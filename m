Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C446BEE4F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 17:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511171.790115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCyf-0004FA-Jc; Fri, 17 Mar 2023 16:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511171.790115; Fri, 17 Mar 2023 16:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCyf-0004DJ-Ff; Fri, 17 Mar 2023 16:30:49 +0000
Received: by outflank-mailman (input) for mailman id 511171;
 Fri, 17 Mar 2023 16:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eK3V=7J=citrix.com=prvs=433af36f9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pdCyd-00047A-DM
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 16:30:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d60f294-c4e1-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 17:30:42 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 12:30:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7052.namprd03.prod.outlook.com (2603:10b6:a03:4e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:30:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:30:34 +0000
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
X-Inumbo-ID: 0d60f294-c4e1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679070641;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WaPVHDDlPcOFPPSz4CEtKH3LZf7TlnkyCRhXaPSZBHM=;
  b=NpBlhWqqZfgyII2xUHigP+1aF7I1HCbp5hICbC1H0hEZGVt+WjdyHB4Q
   cRnZKntyJxaOuVgpIvlEgcnaJ46I5cEbIlh7HXsorSat1QNB+cL9ChteV
   WK8+/Vir1qfgDAz5IMj1HYBBCvUE7nrVI0wyBFJGKgCgc4OPhCLQIlwZT
   Q=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 101710960
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xIx9AK4uzgzmjJjDQQjiowxRtOvGchMFZxGqfqrLsTDasY5as4F+v
 mtOXWnQPKyJZWTyeYp2bdnn/UsPvJ/Qx9JjSgtqqClgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 cVfJGkUV1O5mePrypiQRehAisohFZy+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+CF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTeLhrq802DV/wEQeIhRIXnSYj8Obi06lXtdfG
 kpJ9HUx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTSwJUwoDpcXiqYcbjxTTQ9IlG6mw5vX3BDe2x
 TmJpSo/grw7jMgX2qH99lfC6w9AvbDMRw8xownSAGSs61ogYJb/PtPwr1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb5FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:qBJfGqhIMjPETxMDMvd0Jyoll3BQXucji2hC6mlwRA09TyX4rb
 HMoB1/73TJYVkqOU3I9ervBEDiexzhHPxOkOws1N6ZNWGN1QeVxelZnOnfKlbbexEWmNQts5
 tIQuxTD8DxEEg/reuS2njALz5qqOP3lJxAXN2uqEtQcQ==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="101710960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvqyEUxb09yK4IvACr0Zl0fTtx5F2IIGfcNm08zBx7YzN+l7PrdMcRsvGO3p1UZ4fH+FY9DZPFlhyIexR7PgfdjgUrAsTCd36IwKyxcvlWEzdyL52D16GTym9vsiV3H8BPNi+WtXTQ1+BX1GEipIvhWKZAtlXwPSPpkqb2JPWR3YX687bsAWNrknW0nOGVCJ7Ku/4x7evATT3vOTn0+g08m/PK3t3I0CHQqDmGdnQgASaYy4eRDmRkctyq66FqOVjV48u+SHFr0uaP6qba3nFhqMMNklQ8zm2SiVVFI3kF63MO+8wlaVgK40G2/s7FfLqjls2LDjKNzY7QhJm7g9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+RDPHiudyQhcA1LT88ftRDsFozFE0hvlX1CoKnyxJM=;
 b=KACZtPaQ1NL1zpvBK0V+aDZQE/Q+wPW/OZ6qc5Int+t9Qf8Hjjn+eMd4x88okixxCWb/OXj4HSPUpBzmqiqK0YV/OB3dJ+rPDbKlyIl7MWMMEBfOIQ02iFUn4S2eiSMp6Jqsrx2Cu0sK5N42IjnZb3NQNEtJteKgyC+ycMEaIyS4Q14N7cqPfHpRuuyGJYN6Ai5706xmSp/Qn+jhmB0akP2JDDlZqkHT3sgou9NM3R/Xp2sEhlx+PLevSvn+D/gbHO/oyr7NbBWgyHaSeGy/ZZj0KrBw3f02lt4avG7YbZ4A4d1oBPHNandIb0Jy8hKPn6F6OuA6tJQrQo3C3XAOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+RDPHiudyQhcA1LT88ftRDsFozFE0hvlX1CoKnyxJM=;
 b=ESzWMyFmFA23iqjhHdjCVZ96x26LKEfac0QGzeiEHnszwVgNMA5TA24g4w7hfxSShL8LjI/sMPyjrZUGbb7mlhtwzlKWtrB4LqTrAaH+u2DiPU2flhc2CeHRZc0PpEKR/DkoNhGSNQjsWrt58WZGvH0VCoPRzWxMlC/T1hiVEAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26bf3408-4585-e8fa-a434-56a0d33abf2e@citrix.com>
Date: Fri, 17 Mar 2023 16:30:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
 <ZBR5T57tSqs2o/Sl@Air-de-Roger>
In-Reply-To: <ZBR5T57tSqs2o/Sl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 723bd474-c528-440e-dfc1-08db2704eed7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	33X1v4iDTHuVdoqUxXfRbmZNTxBVszHszbNZnNYs7Z4nFEYQqAaDWCN3AN3JO0iZJLGQ1kvWh09eBWczJ82mZbFEBlaaqY1XkmoscukJ+GdXM19AikjozQYiuMWKAYLSegPX0YM9e5uv6fBAy03KMPtPRDG0IH9avQHWPCkO60gmSo5PwsSIedvVzE2ZbizgV5tyqVY1fBw+YL4d7MJfVjD5kFCODO9hDOdcnFRKOgr6mZuhV1yYfC8mh+ktSoY5IVJI5OupJmAySwAlD47hrwhqLkBCqQnzX6pi1roQ7TDEgtaB/NeK4hobgUPjL+YfwqrWXKkuG76SjueDlbGZE6Q/Nh4yTdogYJD3GbKSDRLOvzKk83OqX+OpcSU0qnR9ufJsOeEt7p3j1yWpTnrBaag01xcHqHwIoP57AVBWT15Y3R+GBa9Tl0YcyljA34baZ1v2Vkpap6c0Qh9etpcLypaDaMVTpR1MdS180l48oRRPRNAxk4R9HwXzEBQz+wpqmbNz95i16wEfYxdTl7R/Oec7OlNMBixj63Jtgv+XyaJOqTTo8cR2+5zgqk6gqhlLCCuY3G8em8MHJRNp83G+2x3/ILzOKrXo0LrMLMEuQbW4ixxeeQAUwn5xRHEVVvKHydqhhH0wadLC8lzcVp/5Jw43TV3Mf2btXjpRLA7iTKFhJEI6rtXvPHVKjYtiRmSoLJ9rILDG9/ATZMkAVqfq1iTgKedmgf+KnlAQUO0h7ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199018)(31696002)(38100700002)(82960400001)(86362001)(8936002)(36756003)(4326008)(66476007)(66556008)(5660300002)(2906002)(8676002)(66946007)(2616005)(186003)(83380400001)(316002)(6512007)(54906003)(6506007)(110136005)(26005)(6666004)(6486002)(53546011)(41300700001)(478600001)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHExdzRseS9YUlN2SHpDOFBiSXQ5eGdpcThhT1BGcnhVenpFVXdON3d0Tjcz?=
 =?utf-8?B?SnlXRDUvS3U0Z0hRamd1R3lXRFJ4NWg0L05MZEJ3RHVpZStidHdsQU5FUitq?=
 =?utf-8?B?dm5scGlIMWM4REljY1NCZU94a0d6ait0RUZqczBOWm1OR0hrZTVhWlhhNWJh?=
 =?utf-8?B?ampwWVlrWnJpVTdRS0JoMHFmTzJVcGYreGFZeDRWd3VRcElnc1lHZWhMYjVP?=
 =?utf-8?B?dVJ1cDM0UHVJK0ExOVQ0WGFrcDJIVTVvQjcxaGlsVk9pV0ZlemZDYVNROE9j?=
 =?utf-8?B?YUVpdStVVlJhbjdCd0hKYTM1OVVoNXFBdXRvc1ZEMUdPeFZzeEcvek8xWnVB?=
 =?utf-8?B?cWhrWkpuKy9BTTdDd3BHMlU1ZFpIaFl1S04vOUhTYUxVdjZ6ZXlLRDl6cmtj?=
 =?utf-8?B?WUxhaWk5aEcxd2FyNUNtMndqU1ZyY3BmTjFsWDkzaGNJcFdCK0JEZmxpbERv?=
 =?utf-8?B?eUdzc0lNdi9Yd3hKZHRrVjlxV29wbk52VDNPYkpORlh3QitwbS96YXpla1BQ?=
 =?utf-8?B?dHhLRnUwREVjNjVSQmpIN3JsdHdZT3hTcUVlYzBmc2FQYS8rUEpkM2F0K0FY?=
 =?utf-8?B?UWFiWXc2amFZaTRPS281Mnl6OEowdCtxc0FLc3Z3M2Z3R0E3SnE0ek1hRE8w?=
 =?utf-8?B?Mm51NW9HbnJ6ZFo4YUdiYTE4aE9OL2srb09EUS9jYkVzdnZUZ3ExTGFsOVV3?=
 =?utf-8?B?Y1lkWno1RllwaS85MVRRY0RVNCt3WGJacEtFbENIY1ZCRlNLOWluUmliV01x?=
 =?utf-8?B?UjV2SjB6cGN4cHVwZnVlRmVTY0tiQjNXNmNNalVjSTRScHk5SEhTejRoUTBy?=
 =?utf-8?B?ZDdZa2V3NnNZNUF3Zm1FblRhaTNlM1oxVy9oRlUweDNFNWdEaXN4NDB2dWwv?=
 =?utf-8?B?K09hMzB4cjBuMVVLMVg4U1MvaHQ3SlJiOC91ZHM4RVdNSFRjSHJNekhWczI2?=
 =?utf-8?B?dVoyczFnbWZCc3pXRnIzd0xZV29UUDhYRmF2bUFTMWZTRnBERFYweWZ1RkJq?=
 =?utf-8?B?WUo3Q2FDWEhvRUVZUHQ2QkhnczV0cURKRmRMUDZBNVpIY0dtcU9kcnJEVlF3?=
 =?utf-8?B?Q3RldVRXMFVMM1liamdQUXpIQ3FiZTRQY3pONGNyR3VRak5UbEd5a2g5VURy?=
 =?utf-8?B?SVpOUzlmTTZoWUdVdG5rQmxNbkkyTHdGS1U0Y3JLWjRHR1B1UEQzOGlnbHZY?=
 =?utf-8?B?OXN5OVg2cHpmY1MwMjZsYXJHdVRRTGhlQzc1RmlwMDk0bXpxbzBUc0M5Vnda?=
 =?utf-8?B?dm5jUklqd2pOSnMzdnVRYTE5OGQyUnpKTVhKUXVjVTdKZjFSUEo2ZDVSRHVw?=
 =?utf-8?B?Nkowa2VXY0wvTDFiUVVBcURHMVhPaEVUdFpNUmNsdWNmcFMwUXhWZkJta0Z3?=
 =?utf-8?B?djdkWGpnOUdJNGQ2Z09mZTBKK0ZsSEhHSUZlN2hXM3hBa2h5cGp2MldaUk1j?=
 =?utf-8?B?R0FuTjcxejJOL0lUQjZ5d3JVYjRIa1o3QnhyQ2Yya0Urb2M5UHpGbHJoMFcx?=
 =?utf-8?B?STkwQi9lK2R4VGZpRktlYTFHRDIySy9mZGtKc09tdXkyZmJPb1hubGtSNVV3?=
 =?utf-8?B?UGZiVTlydmNUOFBMejR6UzZKTlVzaHlhdDVlTFB3eE5oRmlpZkdqcWhtMWtj?=
 =?utf-8?B?SXlXZUkvcWUyaEJIeWxnZ0VmdGZ5VXo3Tmlma296c1ZNUmVRNXJvL0JJd2Nq?=
 =?utf-8?B?NmtBMXVFdVBYc3VzL0FRR1dyZ3ZhNjYyNkdKTFNzcVM0NEZVVW0rTDhET0k5?=
 =?utf-8?B?WnY2aStraUhpV3lNR0pmdjhPQmlxWUtvTFBYV3dZVFVTdVIwM2lTOTgweG5J?=
 =?utf-8?B?dDRUYTNISDFWb2FiVVlaZldTZHZRancxQi9iM1FrSW9ZWFlyVGc3cG1neFk0?=
 =?utf-8?B?UDFIQ1NXN1IzUDJ4UjBFMGhFMWMyZ0RLUWNsTUJwUHNZMUNBYUtrYjlTTGNw?=
 =?utf-8?B?MEMxSWVBeUZ3U2I1K2dnU2tSMm9xT1Z0OUZRYXRnMlhPd2hiZGZXeS9yb3Zm?=
 =?utf-8?B?TXlXQmFpTitud0phdzZsbUlrK3BXMFBEcDJ2bG1HZGkzMTVhSTVOUDVDcHVl?=
 =?utf-8?B?RzZNZGV6aXM4QytiZjJobUh3K2FYdXRjM3hWa2NISVQwV3NodjZZVS9LZjVI?=
 =?utf-8?B?aVBFMWZsbXNMbmFSN0hSY3pwS0didjRDYTJvRWI2QmJyTkpFYzNjVXUyUDdC?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0rKNaj/FIFK5A6szyzFnxty6ihzLMRpz1UdNPAd7mEqgVbr/ABLYrGDaYyz6zIN+EBIYBy7xLQCQQ3KA2zqEzAnUAA68J4zstjuWkjniysPi5P4c1+rjEiwO1uAOVh9qFHiakfm8yTuUelLcuX4Zy2os14yRAqvXNXR1SYwVlVVAIWR3w7eoMMEbovda1PBmUHbd7xUNPyjf56NYQU/4KCchZ8kOP5a9KTDeg12+lezlZ8YojyGvApDLgkIbqJIw0s4aXzn0Z56EBahsYj/m3bIfNr6zhVzodKweggPXvVDNIeXMv+rc3Uq4AlTJkeK43bHjPf/p9uZV3auXoD92Y5Nw2tcR7j8HaH/55b9ADINkTukZVyd0/M1jZYtDmG+xHmHif/u0FA1J3M2UjJVdQCDVyGQlsmQJblWmScbdWK/sTwAkBFZ57CVYU34L4Gf6FTBjtaLXG+F1KH/5y0wPUsh7NMbg/fC23PvdA+/QauxCJibXVbaC23h1BX2MqLPeZ3uT66rgtMNVhut2FXT1AAhR2vAkoZt2w322dVBQPciFHQG9eC+J0SXD/+pb7Qg+1c7qo/tAM7SRw0QPZPyu/Jsq4Z05f3nq7ve6z+8BMaKEKjYVCzMr7/kd5ZZBUV2X9scY5Kkinytl1Ppu+o7lZJVi0BRHUcWog+dRPiWCfSkh8w/jKJsSBRhMUTfBuv8gZganDKSjWsh8EvY683FPvp1PJjHVzEDsxDNJBa5JDaNso5MVy06toZUHZaSrEoPugNJZPr/PS2eDFD3w9KldjR7E0mgthNmt3qhFtBG26GE7xeHUjSUc9bfZSsbOZEFGzte6iQGZboNwrOp8l7W/KbHnvVqdEtFnv6BIkvxjHXQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723bd474-c528-440e-dfc1-08db2704eed7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:30:34.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzh3oQ0bdQAzrLt8tBaJBGB4AVZkN5kWiTHSnWW/yYzw/8euCrW4daq/DzS4uDg1cKbAd2rN5PqQjKR/pg4eMnabLttcv5WejPXRyy6zwAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7052

On 17/03/2023 2:29 pm, Roger Pau Monné wrote:
> On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
>> There are three noteworthy drawbacks:
>> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>>    now have to emulate certain instructions for ring 0.
>> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>>    complete there.
> Then I'm afraid we can't set the bit in the max CPUID policy.  What
> about domains being migrated from a host that has UMIP to an Intel
> host where UMIP is emulated?  They would see a change in behavior in
> SMSW, and the behavior won't match the ISA anymore.

There are conflicting opinions on this.  But the truth is that SMSW only
leaks the bottom nibble(?) of CR0 and that simply isn't information that
is of use to an attacker like SGDT/SIDT is.

So from an entirely ideal point of view there is an argument to say that
UMIP-but-can't-block-SMSW is better than no UMIP.


Except, I'm not fully convinced by this argument.

SMSW aside, emulating UMIP on hardware without it involves emulating the
guest being able to set CR4.UMIP which is reserved so we have to
intercept #UD, and intercepting all #GP so we can find the
S{I,LG}DT/STR/SMSW(on AMD) instructions and fail them in Ring3.

We went to a lot of effort to not intercept #UD (by default) because it
exposed x86_emulate() to guest userspace and caused us a huge number of
security headaches.  Similarly, #GP interception is the source of a lot
of security bugs on other hypervisors.

So there is large security concern with this patch.  Which is not a no,
but definitely is a "need to think about this more carefully".

This logic isn't useful for Linux.  All versions of Linux which know
about UMIP already put the IDT and GDT on read-only mappings to prevent
SIDT/SGDT being useful to an attacker on hardware lacking UMIP.  I don't
know what Windows does here, but I would be amazed if they don't
something similar.

Therefore, this logic is only useful for guests which do know about
UIMP, and do not have any other defences against SIDT/SGD.  If this
isn't an empty set of kernels, it will be a small set.


Also, as a note, the XTF UMIP test declares a failure against KVM
(because SMSW does leak), and will do the same on Xen after this patch. 
I don't think OSSTest will declare this to be a blocking regression,
because the XTF test won't be configured for "max", so it won't notice. 
And because I still haven't got the test-version logic working, we can't
modify the XTF UMIP behaviour without breaking the OSSTest bisector...

~Andrew

