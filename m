Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E0763327
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570260.891953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObRX-0002dw-1l; Wed, 26 Jul 2023 10:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570260.891953; Wed, 26 Jul 2023 10:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObRW-0002bR-UX; Wed, 26 Jul 2023 10:08:30 +0000
Received: by outflank-mailman (input) for mailman id 570260;
 Wed, 26 Jul 2023 10:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qObRV-0002bL-Bg
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:08:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c22f1ca-2b9c-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 12:08:27 +0200 (CEST)
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 06:08:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5324.namprd03.prod.outlook.com (2603:10b6:5:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 10:08:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 10:08:22 +0000
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
X-Inumbo-ID: 5c22f1ca-2b9c-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690366107;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v583aDy8zZS0zxJwtcisrDeikqyUV9Gr34UD6YLrM2M=;
  b=a7LSZhYZwJQMRVOthp4B49ow+ctNySO+oOLJU/Xj17riVoYI5DgP+NlJ
   e+A85SGblmO1Ni9Lq8LvrOi5oDEBk/+yFNxk1Z7DRHuWfpL83Eg/vQu7x
   vK5ef/25O0iFAOJdVaqEnLo/oNcrMmrvi6AfB02dDAMUnhv+S2hQSXA+L
   s=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 117363276
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:42Xp8q72SbZoe1CRdmeXZQxRtPvGchMFZxGqfqrLsTDasY5as4F+v
 jMbDGqBO/jYMDD2ftp2Odu/9koA7JfTydQwSQpp+S8wHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 txBdRkRNEG/u/u1+L2GTe91ifgzBZy+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwnilA9hNStVU8NZRsVqOnl4sKycGfmv88OuXjUike/Fmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZCZcInsokqRDUs/
 l6Pg97tQzdotdW9UXuA8p+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ikcQlr7AajMpO26Dl+1nC226ovsKRElZz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:Ty+vp6qiloiJ7A/KrzoChqoaV5oveYIsimQD101hICG9JPbo8/
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNKftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkYNDVdZ2IK7voTQWODYrQd/OU=
X-Talos-CUID: 9a23:aGN+gWMG6u8++e5DQwk+qWcIQJEZTmTe9HjtJEmhBlp5YejA
X-Talos-MUID: =?us-ascii?q?9a23=3ACqY8ow27iYLG8W6XQ43G3V2+uDUj2JWpFRg/rrY?=
 =?us-ascii?q?8q+K0cn1iFTCblhSUe9py?=
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="117363276"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5PBKeqUQTQC/EhWfyuXqm780wNp3wClTTIlXlBVEMDTeS+XdG7IKwYO4cew5C0dhu9YLd3Zca99jHox7jTIiohjxNFAsdMy9hjDRDMsmrvvB0laWfYoEL5/Lh9ej65tAzwBWt37VPLfq2JFRYP20kLx3ithMmDesr54ykqW9tAo21loem6SVb2ANAHVHGne5ucaWf85OgkUsiPuAf5FAM6wGOYXewh+EEMucxGjgeEnt/gBN0WGmOan0RFYHT/kNA6rgaDK7v+s2aWq0SflrDVntqxftIYSkT8x25t7Cqqi1jaPLc5ZscjnQuG+34m0j3DPsG4t5oC882ivzXEahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC6chUNrgyfNv0/hreGukj96USzDpkoCgiDxE/KSRWc=;
 b=c7biTNsXACiFRnPRsw+LVehAURhn9JZUXrxP7BDD5H3NmJ44JZLMJQHGII/9wWupDUcLr2LyxmWoZpDZTqp1A0EvVIwqhDcKon/MzIXuoSPjlN5KEgZv9JQNqufV+ovyfuuKFp3JWoTZnf1wjedRvhXq6HVAwGIja+JzBZKa5w1qCDXR5UPB+XzsQY5pL0l53ufa7q9s+rxycfx6z3V9pRgDVfhs1SrW0+lopblbftqHZ/4zyXcU4L9O4NZ3hyF61PB4En3pEg2pmYItHxQ8kmoXRYJtjGQgNz7VCIM7dWRykfJBWvy60iRh74zFV/A22V/XKNCRdqj/MDZoZ0yxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC6chUNrgyfNv0/hreGukj96USzDpkoCgiDxE/KSRWc=;
 b=ghfNQ5kWzXykWJqfUBGIH9wM0Fec+CVr3n8Ma1qBCqroLnPVpbI12YWWNdCs17h+4CdW225POiPVQuYMFT6RG0dAqMjJbbAfFxSoNtNsb5+F1s3kgpPBmiSLvVAmbCvNf3O2Zisa1+m2WGKRFFIkZM0Gjf1UCSf5wnJJElAq7zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Jul 2023 12:08:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/5] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Message-ID: <ZMDwj0ucZjsr_-dr@MacBook-Air-de-Roger.local>
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-5-roger.pau@citrix.com>
 <cddab03e-dd17-c684-71cd-5476ffbc0b4d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cddab03e-dd17-c684-71cd-5476ffbc0b4d@suse.com>
X-ClientProxiedBy: LO4P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b1fdf3-fdbf-4be0-d767-08db8dc03e07
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+RIGWWTm4Cgbdyp4m/rjV/SBMxGzeHALhf5M3DyZbOKvukscBI0ovqYdWQEvHY8sueAQ2R0xqtd1CaWMx7EifS84R+L6A4PuPRGHxOVjvumZeSgGeYhRRYLWzHnYQvCFV4t24Z1lLNg01nYAKvxdxtn1N7q015M5M0ElK8y3Uy4BTZI5qCu7CpRuDu4a3QZg4XLr4yFFN2JC6A0DbCS7GHN6J2SOl/vgYdR6LH5XqCVOG6v9NqyZvjEZYYlCvpnc1rAq9tC92qInONAs9Rx7bMahyN9GAisOH9vxXhu9xmgdRNiEfeOcTVDC8+iU0HMdxI70+R5a9uwcf0yogt259pdouXoDHgyJT681Nkk4CWXuUa5+KO7qzPM74l3BICmR6LbpoW13nYtkXSyRtUGwwOMt8wXq9fJG3VzDrO3TlhHrk0sLarAr4P1oVkqVN7xuq/8ilHLQHMfDKL1Tt3ypSYePiGD8pXBbSfCOrevASlf8OhGXs3u/4UK62vZ1loNwap4wHxYuIhuQm343PjKbWdji4nHaktvRBhIwsikv5j2IbIAI3T0wj5iM4dU135tY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(186003)(6506007)(53546011)(26005)(83380400001)(478600001)(82960400001)(54906003)(6666004)(86362001)(66556008)(85182001)(6486002)(316002)(41300700001)(66476007)(4326008)(6916009)(2906002)(66946007)(8936002)(8676002)(38100700002)(15650500001)(5660300002)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkp4KzdrZzhOYmNxWE9pNCt0aTFDZlRKMzU2SW9FQ1diTmorYWZSUUlZSkgx?=
 =?utf-8?B?eTVYVHAvR0dOZy93QWFoZy9iRlltYzVyajVPZnZJSFF3MUI1SThsTXZnY3Fm?=
 =?utf-8?B?SW1jOGRRZXdId05pbWwvQWx2cXlzNlU1bm5halRSU2F3Q2V4MTFrZjZhVEhS?=
 =?utf-8?B?eDF2ejVjT0pLYnJITTlmUGkrUlBNQm9SS3NMb1E0OUlXM2daclZGVkVxMjhm?=
 =?utf-8?B?bysxN1BVMVZHa2YvL0ZQSlBNTTFyTkdUKzJ3eWR4eG55cDZoUTR2aDhPcWRq?=
 =?utf-8?B?cFAwZmE2U08xL2VzR0lzSk5vQXFiazlZTERQNnhKdEhiRGlMYlRTNEt4bFVJ?=
 =?utf-8?B?RWdPQm1LZzdSUGZJWmRKRS9jR09pU0NhVEdvWVZFdVJhYmYvYU5Wa1hkM3Nm?=
 =?utf-8?B?R3ZZTjUzSFhjN1RQMlJ5RW1aejRHNkZpYzhkbzRqVTZIUUNZYkkxSFhpVlhu?=
 =?utf-8?B?VEUvb1Q5UjlOb2l3R0ROUVdGMXFIV01QU1lzbHhhc2s2dWh2enhmcUtkb1Z1?=
 =?utf-8?B?YUkrSkRiSEJQa1RMSzlmUTJVVXRmb1cwTVV2QitBWTUwNmtheE1ka1hFNTZF?=
 =?utf-8?B?d0pIdmpSN2JyendpQzVJY0psbCtYS3cvMmZZNUo3aWluVzdMdEQxUGpRZ2lD?=
 =?utf-8?B?WWtlOStwTUF6dENEZ1l5TjdKUWpTQ3FHaGhOMSs1U3NFNXhYWFowUFBpcVFj?=
 =?utf-8?B?a3dMcHNyUm9nbmJoc0FoQUR1bVdCQ1JZb2pNdnowVnFzUEo1bktmNHFjNW5v?=
 =?utf-8?B?cnAvbXE3Qk02azl1QWI3SFl2N3BmejhsRzZTUGlsOURzMWlYeVA2enp1Z3RN?=
 =?utf-8?B?QkZyQVEwek14OWFqbWZWM3FnTHFvUDV2cWtuMElJdEJRS1dUMjRkTDNEb1ZI?=
 =?utf-8?B?RXN1TUNweHBXOTRzLzlRQ0E1bGdzMDV2QUtEek0yTlRnY3Y3aWhnTndsMUIz?=
 =?utf-8?B?Rm5KVWx5RkxORnBPYnRESUdjR3AvYkt2aU5HVncvV2s2MkI4UGpNdjRXUzF6?=
 =?utf-8?B?K0VpV1psN2tud3dxZ3k4Q1pYQXViTm9WM2gycUI5Ly9va2UwVXBlQVVHdzRI?=
 =?utf-8?B?eEN1UWdVS2haenoydEJYc2pqMDNxVlphNHg3eFZxR2FmQ3V5eVgvZlB4ZVBM?=
 =?utf-8?B?V1JocVVDUmJ2dkVsVFpWYk0zMEZjYmRQd1pCejZ5dis1TCtIY05nOG1wSXhx?=
 =?utf-8?B?dkp2eUR6a0tjZkY1MzJBZDJidnlTcXdwcnNyS1ZoRDViZ08reU8zZFZnSmpy?=
 =?utf-8?B?ZTJTZldpcTdJeEhqUXppS1Bjdk9NUG0yenVlNkFsWkNXMC9JTzVRQTdvTk80?=
 =?utf-8?B?Vis0RWpSL2ZjV0JabTJlQkNzTXFvek5pV25GOEFvN2pJdmNYUkw4TzlrbFQz?=
 =?utf-8?B?dE1UL1lrK09zVUp5QkxESmNjYWpjRmxpTjJRTkRJdVU1NXRNY1p3NHhBM3Yz?=
 =?utf-8?B?Y21XOGtqVVhISnlzam5KMUYrNU5GUlJXWldqU1hJSVQrekN6VWVuMkMzM1Er?=
 =?utf-8?B?RXgyZVYza0pxajFSQjJOMWJCS21rbW84bjg2aDIyVm02ODdJSlZKLzJwNUpk?=
 =?utf-8?B?OUVlNDB2WlM1UzFxTGJCWk9CZFlhMWtGcXB1TmJEckVyaHhEamt0OXB1bThG?=
 =?utf-8?B?MEx2NTVpWkVCcG44dEVTbHpEMldjQUk0d1lTUWFuL2pHNmxGeEtlL3I4NVRs?=
 =?utf-8?B?ck0xQ1pxeFJCdUVTMGRtTlJjN29BNHNCcVVvcGVhZ0VlT2lLeDhjdzVwYUxO?=
 =?utf-8?B?V0F4b2FqSTh6dGRQZ09nQlBPS1VDZDdBWHRyb0h4OGFwK2R6cWRJdmZCdStM?=
 =?utf-8?B?aXlvdE9mYTU1ckU0TENtaHFxZXJueWZ6YjNGSWJCeForSXMyQ1BTY3RENWpC?=
 =?utf-8?B?UHg2eDlzWWNFcENwUkh2OW9TUzNnRVFyNG8ra0c5SU9CcnVLYXhQSHlrYWpV?=
 =?utf-8?B?L3dIQkMraEZtTThLdUlmM3Z2eUpQdnMybVFoWXBUdVovRXh0UEl0RE9nVTdu?=
 =?utf-8?B?L3dzRFpxdUVtU0xDclFIdEVaaGdOS1A4VUlibWtDQldSRXg4a1g4YkNxa0R6?=
 =?utf-8?B?V0ZRWFNsQjBzdWF0eHJYYTd6OFJpSk44TUlwMWMyTDFCUkNlT1BNNTAzeEZJ?=
 =?utf-8?B?L0lSUGk2UjlVK1RScUpqTnl2SFFkTEU4TG51UlVVbGx3aDlRVFJyNEJ5RUZF?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lRvFaGuiLUMyuiQXl7IKrVk8EoCyY3khWMCd87hbzKhCiWEgev7FJOpLKvQxbxDmEemFq9yIJcQPT1usRFKzmFfS9NWbSp1vltgV+rWR7yaANHO7GKyo4nESuKIB2ETZnnUP69PsRdN9UnHHv3qg36rj3NF4abY4nzmEXThFiaubJZ+IYD/NZakJIsyGH0/vYP4ePD+i9LqubeHwGKYDdSrEgaGl19vM5iZZJ/RsihEjpfI3cQrtqdgaeHlazAD/BwV2LdFXOjBb1ezMeb8nWXsdMbC6Ks4kEK2dzOV0ePPvQQJkz2yAyQlZCoWclSSvIkZIOT9mTEyykoXGiRrEdM2rYhjfpt1hhSJCz7oOFXAoTW6JAI8Oio+93qAHksWzimoHdnoZWbbDGk7alN5s8i7d8TxFF3XLqSkDBHQphVLwVvifIVda9eYHn3btEUsUe+HbjG2zlcI9LEuIehxYC6ETTT4D3BjIj5zLM9/jmr+MqlNojNU3RQNerCDiQEHGyq2s4xQ/4vqImrMcxkRgnW/CZkRvCkENKW7C3bY4Gz5tbQfVaEemFFEoz0L1XY7LKdQ4Gu94nJtQ+zS0erIzvSe8MFKWVQ3iiQirgrtgiXnhfy6AVI6ZIZgewXwBQu7zKQAD+CyJpni3dnQP8V6A1IzN7d7bOb1zMdhViIOTeg0RXAw7Br+62JgPEysoTTb2xCCxDTm+58mD9M1fyNif2skWVGWS1YY7R+w44lndrilHlnJGmFhah0KY8zwqrMMDn3ktyQPzhk6f2IrHLKHs4o7iXCBaDJMQoQep7OOHmeM3emEbx3SPpNmXyJ1rRFtrhVODwrRFDpixdUtYzU+chS/dsCI5zY0PqfN998yiuFw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b1fdf3-fdbf-4be0-d767-08db8dc03e07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:08:22.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrnHl2436ZMU3YvxzVjrXUAZ7KlBVWgBOqDHzAf1jJLVfW532oYtXg42E90mQU5t6pjkHZu7sxep8c/hPxidiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324

On Wed, Jul 19, 2023 at 12:37:47PM +0200, Jan Beulich wrote:
> On 18.07.2023 14:43, Roger Pau Monne wrote:
> > @@ -439,36 +427,47 @@ unsigned int cf_check io_apic_read_remap_rte(
> >  }
> >  
> >  void cf_check io_apic_write_remap_rte(
> > -    unsigned int apic, unsigned int reg, unsigned int value)
> > +    unsigned int apic, unsigned int pin, uint64_t raw)
> >  {
> > -    unsigned int pin = (reg - 0x10) / 2;
> > +    struct IO_xAPIC_route_entry rte = { .raw = raw };
> >      struct IO_xAPIC_route_entry old_rte = { };
> >      struct IO_APIC_route_remap_entry *remap_rte;
> > -    unsigned int rte_upper = (reg & 1) ? 1 : 0;
> >      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
> > -    int saved_mask;
> > -
> > -    old_rte = __ioapic_read_entry(apic, pin, true);
> > +    bool masked = true;
> > +    int rc;
> >  
> >      remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
> >  
> > -    /* mask the interrupt while we change the intremap table */
> > -    saved_mask = remap_rte->mask;
> > -    remap_rte->mask = 1;
> > -    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> > -    remap_rte->mask = saved_mask;
> > -
> > -    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
> > -                                   &old_rte, rte_upper, value) )
> > +    if ( !cpu_has_cx16 )
> >      {
> > -        __io_apic_write(apic, reg, value);
> > +       /*
> > +        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
> > +        * avoid interrupts seeing an inconsistent IRTE entry.
> > +        */
> > +        old_rte = __ioapic_read_entry(apic, pin, true);
> > +        if ( !old_rte.mask )
> > +        {
> > +            masked = false;
> > +            old_rte.mask = 1;
> > +            __ioapic_write_entry(apic, pin, true, old_rte);
> > +        }
> > +    }
> >  
> > -        /* Recover the original value of 'mask' bit */
> > -        if ( rte_upper )
> > -            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> > +    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, rte);
> 
> I realize it has been like this before, but passing &old_rte here is
> odd. We already have its properly typed alias: remap_rte. All the
> called function does is do the same type cast again. Question is
> whether ...
> 
> > +    if ( rc )
> > +    {
> > +        if ( !masked )
> > +        {
> > +            /* Recover the original value of 'mask' bit */
> > +            old_rte.mask = 0;
> > +            __ioapic_write_entry(apic, pin, true, old_rte);
> > +        }
> > +        dprintk(XENLOG_ERR VTDPREFIX,
> > +                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
> > +                apic, pin, rc);
> > +        return;
> >      }
> > -    else
> > -        __ioapic_write_entry(apic, pin, true, old_rte);
> > +    __ioapic_write_entry(apic, pin, true, old_rte);
> 
> ... the further uses of old_rte then won't end up yet more confusing
> than they already are (first and foremost again because of "old" not
> being applicable here).

I've instead opted to remove remap_rte from io_apic_write_remap_rte(),
as it was unused.  I've also added a comment to clarify the usage of
old_rte when ioapic_rte_to_remap_entry() returns success.

Thanks, Roger.

