Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BD5EF3CC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413626.657392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrFZ-0000SK-FC; Thu, 29 Sep 2022 10:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413626.657392; Thu, 29 Sep 2022 10:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrFZ-0000P2-CK; Thu, 29 Sep 2022 10:58:41 +0000
Received: by outflank-mailman (input) for mailman id 413626;
 Thu, 29 Sep 2022 10:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRGE=2A=citrix.com=prvs=264d7c073=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odrFX-0000Os-Tm
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:58:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa66a45a-3fe5-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 12:58:37 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 06:58:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6787.namprd03.prod.outlook.com (2603:10b6:510:123::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:58:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 10:58:28 +0000
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
X-Inumbo-ID: aa66a45a-3fe5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664449116;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4jJ213CpqjVAViAZ5WEl+damVcCsVRSluuW681vtrcA=;
  b=GV+EFrWfaU3DrWTcJJpgDlMjf4fYhKwjWhaVTB92BMbMa3MGhOTTjku6
   ma2fQonrYaGcQXNRZeyMkAoyiRxK6S2IsyKWQFgxganRapwoukhZLQ10f
   NVuGVxUt87F60f7Q9tvQbeqATIdRpjlapgcAN0rwmIUsV4AYxs6O9RFlD
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 81617831
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AOdNPZKLfdVfP3dP8FE//H55ynAfxRhNe8xJyq?=
 =?us-ascii?q?0mlJ83Iv2s+/A1BKwYKpYUu6wEK28F0isbSNJTe5bO4tq4DKQk6O1Tqd/fT+?=
 =?us-ascii?q?mdqRDR5wIJWCaTeLwqnoycapJ0iSKZVb2rAfaWu9KkeU+fDGD3tFp/TPPaVi?=
 =?us-ascii?q?+VhRnh4nW8rvlQqf/ZyEmblA1pKVRxjCDgGs/hbRgLEa49pPI71GfCwoWfv8?=
 =?us-ascii?q?HGGFCItA231CZ/l+I9KPGSX4YXfB18jaoIbcXCsIMHzKwzBuO0J+jRy8msvr?=
 =?us-ascii?q?qRtHgtioRJh7iPM7byBYpaJbt7bKKhvll3MhkxYicpFIoDk1kAmORwxSef1q?=
 =?us-ascii?q?mZ3/wR0Z0vVRawuJBxkS52AbSuuEmAC9nG1Iv1lT3vsvEG8R1SeAuqaMOHqD?=
 =?us-ascii?q?vfqDsB4PYXXx+YWVAjQ6eC84P0n4EBNZGELd1isuLHutjAJL7IcaL+a3BJ4n?=
 =?us-ascii?q?N+dv4Eqq+d9u2tk7r4yqVJn/iKaUkF1bUQH+io/7tSM5JJN0hYMMalEcSf9Q?=
 =?us-ascii?q?jgJ0Bl2lLJz1FGhFXE5+KMZ9aNTqGhXCKPEdV+5WhuR88bCxEJwh9zYmfmnR?=
 =?us-ascii?q?BQPVdGkeaCf9rWwhYQ/9ZpR4sAh8XmjpdLoIkYjZ6dRV56R/hxUacWIKL4Yb?=
 =?us-ascii?q?pZU+XJ8cGo3ocltbvyQcgcpzq+x9qyArBEqyAoO2XCbr6uM9fFmrR1woZfKR?=
 =?us-ascii?q?tGxHZEt+JNk1piBDQoohpYkh0nWlgFbYv/QqKk5z1prasRutI81eE6ulYNA2?=
 =?us-ascii?q?nH+3ImTmVujDl936dFPdjk/v50/MxokeS5zBYKzpNgRM/9nSID2VyAm/xsHE?=
 =?us-ascii?q?f6MGcXlvFkcwVvnZY8K/Abv9vR1JXgQyDo6wuSMxi1PJTrdJthRKDAs5BMeF?=
 =?us-ascii?q?gUj0m+IXS+UevZoRp8JbWlpypTO2PLPZqgSXeR6CBWEDdDQSoi2/mxejh5+e?=
 =?us-ascii?q?voKVFe2XDO8VVeQej/SgBhwhxxdZTSnupkMF29V2JakGbusCAIaTc4sAKl1H?=
 =?us-ascii?q?CbWrj/o0E8rdvCKRzQ6QrSu1+PFUUVMmrnwU3WOj6kG/BCoqqv82yx+YSUlG?=
 =?us-ascii?q?ULyVRK+qpEsT/da1O8JEextDoCMISbIaeTKlaJwvTjQwXkyhQ/k+ldtoZ2iR?=
 =?us-ascii?q?ohSqk1Wz3UUNEMjK5GNKGFNSvSQ/Ivb+zXYsgWarG/f8dgauD3WOqIC5ammU?=
 =?us-ascii?q?NU2Y2T590Rl5mdjKfARQIrs6P1OPCoEgTMaWi6ONcV73mdrE5YE0NL9SlkVl?=
 =?us-ascii?q?7KzuWDSO4Hf0Oa3yG1Tm0oeOQEAG9YerrdfIRlikmQUM5xxC2z8FaS1rm0c5?=
 =?us-ascii?q?HETVUs7ifLa/lMYa+E/uH6pWEoAT7QOpL+l4oEMaxbw5FsGX4rwoNZXmWjvi?=
 =?us-ascii?q?Nm5S+ilO3A+djAGmL9/vK8/Apy6ew7OWfeCrfalfSc58NU2ltYGsz1Tcstbl?=
 =?us-ascii?q?BFaEBqEpocIRXtYpacNTfTstR7otZSKCM7qtsXHhHj8E3gZeSQzEB/DXWKTd?=
 =?us-ascii?q?LJ8Jq7B5CIYAkdwUzWjMMSozQMy4JtPcPtEvPf9kHqSP+P+7YndZV9A+TizL?=
 =?us-ascii?q?z+3oWxge4yJYhtw9CsNG7Y7pitOFS1WICByep037QoBuv+QmlmBjBOGjmsW+?=
 =?us-ascii?q?6qNCbl9iIDtQgGrllsIgPpNWAGTb4x9R5rI+d+KTW1648F12auz1GG1mU+i3?=
 =?us-ascii?q?Ou5Vw7N/d2PG79ckN8n4x8z6UuyV8xDxm6YjyLU25t8mWtV+/SjXfHCyJIZU?=
 =?us-ascii?q?s8e3ywxFPm5CSIkHsnmXi5SjIX3s/xtATVBGD4qM0hNU3XoCTD2i6qJa+IKW?=
 =?us-ascii?q?yoQKY+z3CEvRQQII00qLpDkAtYclURwr0x4R8X9AoefiA3yvdpNrTVffeU6h?=
 =?us-ascii?q?UWcYU1b9gPmRe0Qjv8Xy24maUx/yaQDb2J2gh5XIlHd3P2vsSU87Q722jyEm?=
 =?us-ascii?q?6mDa5R9qKKvC4dD4AKEUHzXG9wDhSfpUsHYGqJNpLSzFSGnalwSfiJvjTtua?=
 =?us-ascii?q?Ur144dtos+g9iLIR+wjCmE9k32qXMy420LmWlm8sJUdQVa2f3jMD/DRqAjf+?=
 =?us-ascii?q?zIT5oQjJERz+OlvuKMiFvL/b+WU47caT70l/akS0WHQxR4UY3NBcYD+Sjwa2?=
 =?us-ascii?q?OVE3pN7L/HblIj0pG4oHLZmVUxv05XqwkYj8EcQJ/cYOKiG9JbxclEghGyp2?=
 =?us-ascii?q?ExBY44Rw2PE5JQp83Qh+A+McT4s1Y5iT6dkGXswInX/H/PJwr033RADY4uTI?=
 =?us-ascii?q?CLidAsjZqpW2980VRkLmLuiys2D9EMZej7A3uy4orXNmjrYh/j99LIj5xYoh?=
 =?us-ascii?q?suyEpny15YhqvzkfjRIBZ5FrUZxrnKmhG1hQ0LXKsnV19tXg4fn0Ceds9j9b?=
 =?us-ascii?q?0vR7Ihjd7YbO7axF82bDfMlaMERxqNSh4/Sl539IOUys2MoT0NhvknhChno/?=
 =?us-ascii?q?AMu7KkfotzVMrEkuY0UyFfM7VdrmvDLLd3Zqtt/mKIEw861T8rfCEdCo+mhM?=
 =?us-ascii?q?vQWHVYQ1YDje1js8IAl+XL2d7BsqCi0mDQKe49QtRUrRicPwQWxEf+vU/FCD?=
 =?us-ascii?q?suMF0u99oohmN1FroxfzKl9NZklcGO7ZBCJYqDyFznZs6/zgADiGWbZX6EQc?=
 =?us-ascii?q?n8p+QlkSACUCocYzqzw+StgCDHu1ztUEtkven88oEsoY25Adzk4+JlOTuknu?=
 =?us-ascii?q?v1kvjo57Mr4tLVQMTsbI53GQAFc7KBhOseg3zNMTtSMGzN6tuEdfsgftdv94?=
 =?us-ascii?q?71nzhxU5v1ZFrD7Zl2lbAbwQ1um4mX8V6pxerwcoQsIzcv8wQuBWOFXgu5Nf?=
 =?us-ascii?q?V3HuO2a4cVpHK2KIITwRf3G52HDIcrAQxa5DcBVVRCc9/3orUYASTGlPvcwA?=
 =?us-ascii?q?NWw4wxsGeSV0ABzrYpD7GOie2BIhUigueDD+nHEIA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,354,1654574400"; 
   d="scan'208";a="81617831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acSnkaCl+cBAqFlhqdweU94J83H8l6KfBAAKl5lVQBXbXeq05rrKY8nYw6HshRy+mr98s/Y5p+UabtPpvrxnIj+HrfJexpLx1EjZZR4ISOhjXJYPw1Mx/1OMvMoqAOmu+vT567CkC3Hr/T1UYhFR17BBP5/a75qx97mtLpOsgT4GtMiz9ZxuDO4Xx7lCiDQ5MJdGH4/UWueX//sWNMcS0PhLf4RGi8gnPosAdRA1kCCpZzebOjxnl7T4mp2WNDnk2eqikn7L7IQV1g3KconwC5Oaq7n2kQh+QGZN5Bvs3DOUuEXn0lau9QSHzxw9BsTCW6PPLSWD37Lc1CKkXnywPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7psNnl26cukPzWtA35vTcODbt1tXfttRr4illCx02fQ=;
 b=TuYdGM2/lmhe4uzc+nrkhhQF5af0c+xI8AN4TTzl/IDM14hx/peXRwCpSZtcH0Fg91/KvFFaw4wiyi6P9FoPrcH3hUcKAs6QDIJhuFGcRolWMXMB0wjUsN0J/oLu9i4qqxDVgMbsjrKK9xyISBit0M4eSSRdI1rlGZd+81VCIWA1Q5lxH/32Kt04HGoXzQqOjDjBEHZqRHyzkW//lzyJcsKh1xV4BBIuN06l7IsyQF83IaVAnbqYvFcR7TIt+eoxzRn/CSpKRdWskn0up2BkduaTTCb/UZZW9mMCC9sY3t2/aUfMF28vtTqLfrFeeDbJxcggqnFov4IOPsMl8mnAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7psNnl26cukPzWtA35vTcODbt1tXfttRr4illCx02fQ=;
 b=XKsObqaVRLEd06FVmMSYW6F8dzTQCvrX85cIb39ooF42mi3Y1MZOsF8pj3LPV2c3G+RkND1EDKo6BheGhCdjH3bnBzzkaScu07/fPGV4/N5cZzg3hfCcGhTUSJaTsMsxqCOX82UKmB/xVQzOsnaSlhbwdGM6/c8gNdoTSYi9swM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Sep 2022 12:58:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: For 4.17 (was: Re: [PATCH v3 0/2] Move calls to
 memory_type_changed())
Message-ID: <YzV6UNneG0jOrvQJ@MacBook-Air-de-Roger.local>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <d7a14258-713b-6fc6-5da5-ce4fd56202c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7a14258-713b-6fc6-5da5-ce4fd56202c3@suse.com>
X-ClientProxiedBy: LO4P123CA0633.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b6ff70-86cf-42a5-ff22-08daa2098a51
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CpT0gO8a3It+R2ub1fjQBmdl8Pnfrr2iINZ27SxGBXR1s1x25VgcE2c3HO7a3bIx+C/urWVZXWVLG1fBvcUUCX9p1nhFz1DjyZnlJ8qqUxPZn/sooZ21/JuHNABpJ10WYVNPpmme1xy4+je5aUvOMPT2peK3mzTwThjbehsQJ6oFZ5a/cerc2++VtgwErvsaYDud4XdrQDvgR2DPD6anxHflqFUpjeiO788ppkptsfw9v8ppKgV/tTBIAfdXdyMJPpqjB+Rl6aJjIYTAD8txff3lQzmrsgSXAtYFk2hOKBnMN1w8OxsJGqDBA4Gm8TpaTA+SPfcXgCMyCCaGd0kCYJMt5TQ7bacAXNuHgViYqQ+TC0d1JXj6gGhBPqPpHG303Vr6Qwzupb5ifvMjqljzECx7BdAPRxSZ3m+f1J9HDI0JI4H+qrYvRi+wJAAQhvOZrsD3z7mY8p4WcrW5whTvU4iTuEpd/mjJUlS8uIOaKroQfYcWEoFnvJ0qctxh9lUT9HzSms6K1LgI+L8JZHvyHmtU39bv61/20rEz007CvKPr9XWhLY1oOmM/ZCGnmGnu62eyrmvmw09GdiRpebVRWwoLkAhYs7rJB+vBJof1tzDYnIfCHJPKqC0Z2RYUGwCwFwyYzH3aWhYBTxHxKM1vODa46bEvW6jkKwnTlEtemknWNFOEg8xI5drxW3+LW5q901ZJfiVbQSMPJJaQMEDQrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(186003)(38100700002)(82960400001)(85182001)(86362001)(83380400001)(110136005)(5660300002)(41300700001)(54906003)(53546011)(8936002)(7416002)(4326008)(316002)(66476007)(66556008)(66946007)(8676002)(478600001)(2906002)(6512007)(6666004)(6506007)(9686003)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0pkYlhqOXNlZlphcXM5TVRBRUQ4eXlCVlEvUnBUbHRyUnFhUEw5UVY2STZr?=
 =?utf-8?B?Wk8zZzVpVnltaHJWSXBjZitSQ2J1cERnWVk4NFZpZHBrK3dIaDZZQnY2Mk1G?=
 =?utf-8?B?T0ovOTVlaHdETUsyZTNyYmpTUmJDV2R3aWxORHdLNWVteFVXdkpLNEtTdksx?=
 =?utf-8?B?WXJ2bWNJMFd2UDVycXQ0MHdwNkU2Z2xZZHpOSGJXMjI0aDI3VnUwOEUzdXY4?=
 =?utf-8?B?ejJGK0ZPTHU5VUxERjUyR0Y5dGc4ZDZzRGpTWjVUWWJra2hnNUhGN3BVai92?=
 =?utf-8?B?QTByM1VCeEJtQUQ4YVc3RTlYNHJoZ3BGS29BTGFkQi9KSGloUUhYOS9jQ1pF?=
 =?utf-8?B?bFpZdzdGYjhVbmJUcS9QOWxhRFZyZ1RqT3VzYXMwaWFDNDk2a2xxb01SbFRi?=
 =?utf-8?B?TlhSeHp6OCtPdUxsMlVzVTJZbXkwYnFmWVA4NWh4alM2VVRtMC9UKzQzV3VW?=
 =?utf-8?B?VDF1bXovci81WFE4eWg3a1pBbWVjSno2WnZhQ3BuVkhJRVBPREpxdWFvWTAv?=
 =?utf-8?B?bTBZK2JWNVNSQzVBMFl6aUM2eEJDYkNMOU9GM05sZW9XZ0lLbnJWM2hqUGJR?=
 =?utf-8?B?S1p6NVhGallkQ0JFaFl4K2FXNndsaUVsYmdyWGk5NzAzYXVOcitqRS84U2Zr?=
 =?utf-8?B?djY0N09WM1F1UEdiK3RZSEsyOEVEcmtQZ1ErK3ZCNTg4SnhkenVIQzVjdWZh?=
 =?utf-8?B?VVVkOXNYNTZOT0RwZERkTXVkZjRDa0p3SlhUaTdWQllpR0NkOTllM253aWsy?=
 =?utf-8?B?QkpCcGM1Q1k4S2pDUnk5QVNCQXhOU2hPS0ZXd00yYURYVDlMc1RhM004WkJI?=
 =?utf-8?B?QnFRazJtQjlLZ3NhSTh0NU5QQ3BzV0luaEdTRGFESU92dGFKSnNldGVGQkl0?=
 =?utf-8?B?QTNWQ3hXVWRmOUlvTmJDazBKMjBYVGpYSjd6ZkVJNjFXc1JLOUJMSzJscFZR?=
 =?utf-8?B?OU5RQnhtNlQyamE0ZWRQZDkrb0NlWjkvRGQxZ1BkYWRSWHQwN0FkN0xFN1BS?=
 =?utf-8?B?d2FEM0VwdUxhQkJ0aThGZ21JcEdEbnIzandKQk1EMGNNa04yWGtFOXArQ1Zr?=
 =?utf-8?B?NG5NTFA0RFd6S3c3MTdFL1VDR01rVnJvRkpJcW1jR0hNTi91ZU0xd292b3ZV?=
 =?utf-8?B?OE41Q3czdVFwR3ZVWG1QU1hiWUFvNkJScURNUE5oTERzTkMyY0ZjUWNBYWl5?=
 =?utf-8?B?V0NjYm8wM2J3VUpqWDhuUEQxeHRDRHpjdmVYQTJEVk9tNGliRTF2RG1EZ0pH?=
 =?utf-8?B?b041QkNFU0VzYndBVDlkZUM4RFdKbmFiYWI5MlUyMnhKVHF3TUZvVjZSRDVN?=
 =?utf-8?B?ODRHRUlQcU4wQ0tzbDR1MFFVRkxCR25rSWNUWGVxY28wSXZKY3F5WXFUMUNT?=
 =?utf-8?B?enVJRVp5L3dMeklFcDFQcXF4QitKbnpRNzQ3SGZpOEVTY1E0VnVyY1FqZ0Y4?=
 =?utf-8?B?cnBRV2Q0QXdJalo5aDlCVEtSMHBQZGZiZVQyYUEvdDlRNWRBYy9RakhCaHR4?=
 =?utf-8?B?cHQwd2FsU25UTnJsMGh2L1R3L3l3RURqZCtkZXZ2d3JHMURFajBPNnBDWWs2?=
 =?utf-8?B?OU5peGVSRC91cGc3RDFIVllKU1hQcWxWZm95V3hpaVJrZjM4dXNaRlVBQkdw?=
 =?utf-8?B?RGtHWVhER2Uvd245b0FFbHA4NkkyQ090ZmROZ0ZTREN4WFpjbllJbWw5V2dN?=
 =?utf-8?B?c2FadVlwUk5qQWxpL3NJT1N2cTdmNCs1QzZJZTZEbFMxWkthOWR1b2I1RnVN?=
 =?utf-8?B?WnBMU2tFOGVyQXNlUVowaUphYW1CRVpSS1FnakZ4QVdsbjdXUDVMdzFiMi9j?=
 =?utf-8?B?OGc2UnR6SXlVUDB4RUpoQ3FlcGhBWUNzUEZVUitCV1Y2REtGUGt4M1VzVEpj?=
 =?utf-8?B?NnhmQksyTTUyL2JlU3pzaVhMcDRnNWhmZll2Nkl4ZE1iam1tbWR0VjBZK2Nr?=
 =?utf-8?B?SlNCc1ZBU251bjY4NHQrRG1kdm4wQ1FZd09oOVFyVzVwNndNRFd3SzRqNStN?=
 =?utf-8?B?UkNhOC80dEppR2Qxc2poczJpNzNxVHkwMUw4YU5FdlpCWmZQTTh4UUdRNkZr?=
 =?utf-8?B?V0lSTzhmVVZKN1pNYk9GenlXdTRlMWdpVDlNaGllaFI3MDE3T2swMEtWR0J4?=
 =?utf-8?B?RzhxQkovRjVWbXFzNXBYdHN2OHl3MlpOaEUrUnVnOG15MFAzRHZUcTlEMWVN?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b6ff70-86cf-42a5-ff22-08daa2098a51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:58:28.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN8mnFNYRyzwqRiFOPV8ULYt/S2zeJQcTKoQTlMs9tecT2ilf4wb+HJgMwp8V3Zb6vVGqdjKcRJPX3Lh8F6ycw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6787

On Thu, Sep 29, 2022 at 12:14:10PM +0200, Jan Beulich wrote:
> On 28.09.2022 16:11, Roger Pau Monne wrote:
> > The current calls to memory_type_changed() are wider than strictly
> > necessary.  Move them inside the iocap handlers and also limit to only
> > issue them when required.
> > 
> > I would really like to get some feedback on the Arm change, since this
> > is now a prereq for the actual fix.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (2):
> >   arm/vgic: drop const attribute from gic_iomem_deny_access()
> >   x86/ept: limit calls to memory_type_changed()
> 
> Are there intentions for having these on 4.17?

I wasn't sure.  From XenServer PoV it's certainly a bug fix,
otherwise some workloads related to GPU passthrough are simply too
slow to be usable.

I would certainly be fine with it making it's way into 4.17, let me
add Henry:

Cons:
 - Changes the number of issued memory_type_changed(), so there's a
   risk I misplaced some of the conditions and we end up with wrong
   cache types in the guest p2m due to missing memory_type_changed()
   calls.  That however won't affect Xen itself, just the guest.

Pros:
 - Removes unneeded memory_type_changed(), thus making some operations
   faster.  It's effect it's greatly dependent on using a set of
   hypercalls against a domain, which doesn't seem common in upstream.
   It's possible other products based on Xen apart from XenServer will
   also see an speedup as a result.

Thanks, Roger.

