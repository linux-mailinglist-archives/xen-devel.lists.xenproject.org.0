Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702C4A962E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265225.458539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuoL-0005PP-BV; Fri, 04 Feb 2022 09:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265225.458539; Fri, 04 Feb 2022 09:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuoL-0005NT-6z; Fri, 04 Feb 2022 09:23:21 +0000
Received: by outflank-mailman (input) for mailman id 265225;
 Fri, 04 Feb 2022 09:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFuoJ-0005NN-9n
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:23:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14de3f66-859c-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:23:17 +0100 (CET)
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
X-Inumbo-ID: 14de3f66-859c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643966597;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Py0vIv6hjWVHAbB0atG47ZgO0hHXoS6wcB3gVNUUH/0=;
  b=X0gFJzjUeYE4MIJHZcDxSf76gFVf+X5N31Tqkad5ECsbQUWpMhDubMNx
   m7mVTaoGDznQeuLM4TbxdsKHTU6p12XK2FUXa/ZO90nI/iWJNMRJVKW+4
   4+eKdZrUFmJW30+TsX4gT5BZzcyTDLr451AgS8rWKXREe57S6BYmAJZjh
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I4YvK+rjXCOFrdxZ8+okPZpz9ihn/qJVkil6s1i2IO5hYWLcacMFNS9+OJT8P8bY3zu12/cwAG
 93yBoP+YcCM4YpqIEmOf1/iCKNwbTd1rKXR390VjNglvGPTZhmBKf/gPDS2yxF5KaT0D/BJSy0
 1PVAsMvsYwHckKcuUOrDAASinhYGXikO8NX9Mx11ZmcOJfVvXa2n7YM7Jfz2gtyyV/ocLZEYem
 C/Q/aiiOXt5lJZ9NkgVhUQ7GeDmr6LFpTIPcAOuyWh+1YV5IY5qedPQPh77A4snZlrC24Sw6v/
 B1zVEHnpAb2ADY0gY8X/siF2
X-SBRS: 5.2
X-MesageID: 63487251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WDWESai0PJQkmlQ3ptGHqQ7lX161/BcKZh0ujC45NGQN5FlHY01je
 htvWDvQPveIY2b0fo91aIq/9xlQ7ZTUndRkSABqpSlmEC0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1EpaKRUSArPZH1v80PaxhzPjM9NJxvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3ZweQqyDP
 qL1bxJ3NxLdcxp+MG4qVrt5mseEgWbTQhZX/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SKM73aEluLJ2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0RN54A+A8rgaXxcL84RudB2UCZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sESEFE04aQi0HcTIiysvboaoenFHGf/82RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCGta4oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFpibLkWN4umgWyKJV3iAsI2SBj
 Kj74ls52XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8yPh7Lgj6wwRNzysnT3
 Kt3l+72Vh727ow8lFKLqxo1i+d3lkjSO0uPLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVlWfje9pIGHsbeclsOMDxwUJf5nOJ+E7GJaowIzI8kC
 FnnBB8BoLc+7FWaQTi3hodLM+KyBMsv8C5gYETB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV9eSOrTyn2lCDOTSLej86c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBoorwS7l+E0NWEnP197GzMSWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVfkU
 Ey45dQHa66CP9noEQBNKVN9PPiDz/wdhhLb8e8xfBfh/CZy8beKDRdSMh2LhHAPJbd5Ktp4k
 +IoucpQ4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMyOEDLy7bGOd85IYxsjL
 TKjjabfg6hRmxjZeH0pGHmRhedQiPziYvyRIIPu87hRpuf4uw==
IronPort-HdrOrdr: A9a23:OZ9WUK3gy7rBd63ghCIXWwqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63487251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l13yM9SMAsWdAEcPtu8PnnssPjDZgxRLjWhHIDkaDHNBN5t9dYyKfte3cVdyqaY9KNOmYh5uMVLgiSe514fhv31/JH44SGUMsmETKnuFsHbjZ3c8Q8hqFiFhZ38cc4blM2+Z6TB54tJM4ySuW083vHQu3SvmwI/ecIx4p0Y2nH1BopQQcbqH+13bNpBQ8GDz628a/NAcsvcMxPXfJV5JtQnGLTrpW8ibzXZnz09HQGsNamwVkPK2/8v1Sl6Lw/22aScKmesj/oB5QM/RNY37Gk8qVHmbx7d2BfAxNTN7yIR6Q7zm8VwJ6/92QATP74bcYXXOzgqpnKCnSkm+QDx3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ro+G7XcDQDdwFpozBkSjFjPo4+IMmlcDyncGzsGGMo=;
 b=NKYVUv+BMzTnEjzLzozlXQsmhESTVLSybF0JYVA9RUuw/aNNrZ/GwG/eXGv+SRujkepkW4yKGQ8gyOWqwZhpiZCXWxlblQ6an1TOV+r1+0zHVZoXbY+Neyw1rtZNm1/MespVV7D+/l+Ji7d7sECQesVmoN1s9GyMdgG9cQxMcB/hV2zgUcS/NPfLv+/lxDpHGByqE9Q7sQH/R50YRevH6XlxNrwP4bHJE+HvRWXmmkPRwGvfhW54TQ0k+gWne+0fEAqnRK5JxVILNCTyuzSYohzn7U9kkuQvBpKYsa/F4QjzV7fq7LeHknQr/tvkj1laJsNUazM7JoqxqgISQf6GGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ro+G7XcDQDdwFpozBkSjFjPo4+IMmlcDyncGzsGGMo=;
 b=wOvEXYUGy3vmqvvmfBRN/24MJeXKQO+OxUK0nwKI2PQVeZNZLXxEcrtZhjXw/DjTDloQTGyHPattkYN0YkmJRcJVr4FxhFeBe4S9RI0wu5vFFBG89bX+tYybZO6xhap3HBWn/+4j4pHAE1gT6d6K2Z+oA/tfP8UeieTxdeVT4ys=
Date: Fri, 4 Feb 2022 10:23:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Message-ID: <YfzwepCoIvJ3cI0v@Air-de-Roger>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
 <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
X-ClientProxiedBy: LO4P123CA0511.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f11fb6-526b-4baa-77d5-08d9e7bff6b5
X-MS-TrafficTypeDiagnostic: MWHPR03MB2959:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB29599575EFECF0F23F53B1DC8F299@MWHPR03MB2959.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZaxgNDEUAmXR97lb3M/U6XMpN5bltnPhl2l1limbjRgQ+eepgXUrHBcNNHL7TNpVCKfcEBbnnW2hKnFONS4XurlbPGcUTOVg1FAzXxU9ZgzLWfYF+UC971pxWY5a8cN4PJpb4IFzBVcJmagMOTtdvev/uPIV9QC1gisrtHZZdftHCUfp468smrvuRrVek3llIXbZEzDJuGpWTE6X2oaU9GIeCEQEJlZn6WTM75MUpisMq8bvo5FoJfD7ulW6lPN2j1YXcqReXtZRkCP7kCDawwASOpG4q8F5SHq82CsT34YRf/RL2zRo5jVaPvBtu0jjPkMOeqSeeASHEjFBSj5MWo/gngw9h5bfiMNjtKn0ClVZdTmR6sKCco3c2ZUKWKazbXWAHIMeTNrgworzvkaV0rydRXTsltu2wctELQTtkHzNv7PjdlXgIpMBtG8utOB+K9QkHAcxZ1slBNaw4oZb+A93JeHnlqv2wBxe1EwzHRm3w/DcWynU2BRaje5ZaBqGahaV4/hCLiBSgY2aRcvSWAj2eMSyJG4idsPcvL/YKu0E0241a6embWP3DCX+hEEN05h8SvnOI1n2TnOfvC0JVOFFdH7ISxy3SrpfBAS1vmFv1dqtPsCl6eOwmFH9dZBFdxIAQCSqcnWf99rcXQq0dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(8676002)(8936002)(66476007)(66556008)(4326008)(83380400001)(6512007)(5660300002)(66946007)(26005)(186003)(9686003)(85182001)(6506007)(53546011)(6666004)(33716001)(86362001)(316002)(6916009)(6486002)(508600001)(38100700002)(82960400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElwRGJkOERlTkdzbWJZeVU3M3JJMENrcUR5emJJRDJLUjNjcUxhdnFNUlpj?=
 =?utf-8?B?YnUvZ3R6NnJuNkV6MHVCTEVndUNtUHQyNGYyOFh4dzhxZ1pXb1BOcitDdkU1?=
 =?utf-8?B?TlozYjFnMkp2dTdNWi9RMlVucHMvbVNYaWlTelZsRmJuUGFHWGNGVUxVdHQ3?=
 =?utf-8?B?aEsxYllWeXkrT2RDOWs4dUtpZ1Z5bTAwQUxUQUxCOGx1bWl6WXNSSDNjMzl3?=
 =?utf-8?B?ZUFPOWMvajJTL1RnSEcrdVNFVFJFQlNxdmdJbTRPY0UzMG5la2lUaWZuTmNM?=
 =?utf-8?B?OFJYbzMyN2dYa2V6NVp2Vi9yb1QwZTB3eGc5dDR3T2hoQ2RBQm0wWnVWaHY5?=
 =?utf-8?B?MVVDVjFUWEZZRkdLYXNjbUY1TktDbjN5VVZUbzRQQjkzZmtSWTVoZWhpQ0pN?=
 =?utf-8?B?VFhvNmd6L0pxZkZRTWNOdWY3RE9YK1BITUNsOGlmaTFlZkxVYXRLdnZyb0dJ?=
 =?utf-8?B?cVdSbXpHMWdzWVZqYlpNd0QveEZ2UjBseExVaWxhYWM4NlI0Z1ozcWZONFF1?=
 =?utf-8?B?T21nWTVLaytBbkxNVTNzR3RyN0NlZjJ4U3NRQ1dVbThmVUZQZDVCa3huYk9x?=
 =?utf-8?B?OGJxR0l4c056cHBraDlONmFwU3hYNG52N3hqRjBFckdneVZjQVd3dnhyRjlS?=
 =?utf-8?B?YmkvWHF0OXp4RzRURkdPMmtlS0NFZDBxc1l1QlN4Q01oVWRqN244Q0pKMHVZ?=
 =?utf-8?B?Q0FXUU52b0RHY2ZsKzlmQWUvQWs5aWJXNUVtMERqM0V3WnVYUUtxQnBmRFJF?=
 =?utf-8?B?WHRTMU1RVk80QndKVnV4QWU3Z0MyNGlXdnBBWG9DcWU3dlJTRUgyS055NUZx?=
 =?utf-8?B?Y1cxU0wvV1l1MHZSZ29KeEZET1c3WUFtSVZ2enFWVm16SW1lZGFiQzYrZ0tp?=
 =?utf-8?B?NE9JUDB3bmhXb25TcG1PT2FyOFB4QWphU2srcm9ObTlreTBTV3RiKzJLaEF4?=
 =?utf-8?B?NmNwakhNYitKZzBCRjFmbEZHYXQwMFNKK2RpTzA2bzlpOGo5NlR5QUZrZFFn?=
 =?utf-8?B?N3BuU2hMbnAzaENSdGFtYjVWUnNRektZRlpBbFNNYktMcDRoSGwvVUFob2VB?=
 =?utf-8?B?YTdqNDVUZlJVaGFLeFdXUHUwZzQ2SlpxNWhhMEVyWmgrcEUvWTFYeXB4VllU?=
 =?utf-8?B?aW4xbFczZCtUSzVWREpKWldsNlphMGRWbFY4azVrU214bng3bWhZVllHZnFx?=
 =?utf-8?B?YTFLWFRwT3Ewa1IzQkp0S0N5OWF4S3ZXT0NkNzgvYk5nYndjeHZtK1k5OHJQ?=
 =?utf-8?B?US9nRGxnSVg4Vmk4TGlPdEhWRjNEdmRRYmdRb09VWTNhT0tVb0JIVFRTL1FE?=
 =?utf-8?B?aG5aemx3MHoyWVJBVDFIbjNnT2tXZC9HMzhib2Y4dmU1RWNiUTE3cWdnRjdS?=
 =?utf-8?B?anRzdGx2elZudi9GaUd3MUhDL0RMZWQ3U2NxNW9rK2JsZnFVM1FXR2p4MGJt?=
 =?utf-8?B?SklTZmhTSXVINFc0UHZ1Y1k1N2RPMHIxeXd0Y09uaWF1dzg4NGVTZkVuejMy?=
 =?utf-8?B?SzdpVUs4NXBUM1kxV3F4eDNweXpkUis3bURHUXp5dG9RVWRhYS9sanhkTzRt?=
 =?utf-8?B?YXlSamUzSlZpRkRYa2pYTktjYjlkdHA3M2Q4Vks5aml5ank3Y2xDWlpjc3pW?=
 =?utf-8?B?cC9jSFc0aW14YkdlNE94RWZVY241Z2d0T1YxblNpblptSTZWMVVIajBjbUdz?=
 =?utf-8?B?Z1J4aGh6VFZObTZNRE1QSEc2QlVRR1Yyb0Z4OWdrRGVqL2lvbXNrR2IwbUF3?=
 =?utf-8?B?M2dWdCswY0h2VlF1MXFVeWU0Qnk2VCt4ZzRPM3k3azRwQlYrRjI0ZmljNW9p?=
 =?utf-8?B?S1c1YTh6b2JEZWlaQnF5WWM5eEdTV3ZsdjY5Tm1zSDBLdHcwOEg3UUdoN2dM?=
 =?utf-8?B?NlFnL3pMZ3F1M0FDZyt3Y2U1MHkvTjdaR2VLUE5xMEpGdFNIcXNLVStOMlJn?=
 =?utf-8?B?clZMc3RsNmdNR1lqa2h5NHAwUnErVVhMdDdMSkM0RHVLcC9KWm5FR1J0YXNh?=
 =?utf-8?B?dno1YVhIdEIwek9hd09EM2VFVVVGRUdhalZLblJrKzNmZkUya2FqV2I2VjZU?=
 =?utf-8?B?TVM3UlNMZHhydXhiam1hblZEOHBsQzI2alZ3c3NYUEVtdGN3U3JRZTFIaDJs?=
 =?utf-8?B?THdEYVQ0dE8rcFF2bEtxdXUxaEpJMDBKT3VHMDluVmpnSHByTWVQVzB0Wm04?=
 =?utf-8?Q?062X9kTqma8grLF9vd5Yriw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f11fb6-526b-4baa-77d5-08d9e7bff6b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:23:11.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGTR4PXdJoQiOnLvVtrGsBzOP31Rxdqo+HN+chpJr8IRroYXx4VhBXE6jfJY2D+a6UewbeTOKwLZsRdw24aDhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2959
X-OriginatorOrg: citrix.com

On Mon, Jan 24, 2022 at 02:47:58PM +0100, Jan Beulich wrote:
> On 20.01.2022 16:23, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/msi.h
> > +++ b/xen/arch/x86/include/asm/msi.h
> > @@ -54,6 +54,7 @@
> >  #define MSI_ADDR_DEST_ID_SHIFT		12
> >  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
> >  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
> > +#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
> 
> Especially the immediately preceding macro now becomes kind of stale.

Hm, I'm not so sure about that. We could expand the macro to place the
high bits in dest at bits 11:4 of the resulting address. However that
macro (MSI_ADDR_DEST_ID) is only used by Xen to compose its own
messages, so until we add support for the hypervisor itself to use the
extended destination ID mode there's not much point in modifying the
macro IMO.

> 
> > --- a/xen/drivers/passthrough/x86/hvm.c
> > +++ b/xen/drivers/passthrough/x86/hvm.c
> > @@ -269,7 +269,7 @@ int pt_irq_create_bind(
> >      {
> >      case PT_IRQ_TYPE_MSI:
> >      {
> > -        uint8_t dest, delivery_mode;
> > +        unsigned int dest, delivery_mode;
> >          bool dest_mode;
> 
> If you touch delivery_mode's type, wouldn't that better become bool?
> 
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
> >  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
> >  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
> >  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
> > +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
> 
> I'm not convinced it is a good idea to limit the overall destination
> ID width to 15 bits here - at the interface level we could as well
> permit more bits right away; the implementation would reject too high
> a value, of course. Not only with this I further wonder whether the
> field shouldn't be unsplit while extending it. You won't get away
> without bumping XEN_DOMCTL_INTERFACE_VERSION anyway (unless it was
> bumped already for 4.17) since afaics the unused bits of this field
> previously weren't checked for being zero. We could easily have 8
> bits vector, 16 bits flags, and 32 bits destination ID in the struct.
> And there would then still be 8 unused bits (which from now on we
> ought to check for being zero).

So I've made gflags a 64bit field, used the high 32bits for the
destination ID, and the low ones for flags. I've left gvec as a
separate field in the struct, as I don't want to require a
modification to QEMU, just a rebuild against the updated headers will
be enough.

I've been wondering about this interface though
(xen_domctl_bind_pt_irq), and it would seem better to just pass the
raw MSI address and data fields from the guest and let Xen do the
decoding. This however is not trivial to do as we would need to keep
the previous interface anyway as it's used by QEMU. Maybe we could
have some kind of union between a pair of address and data fields and
a gflags one that would match the native layout, but as said not
trivial (and would require using anonymous unions which I'm not sure
are accepted even for domctls in the public headers).

Thanks, Roger.

