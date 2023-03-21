Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E26C35B7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512798.793016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedxt-0005Og-6u; Tue, 21 Mar 2023 15:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512798.793016; Tue, 21 Mar 2023 15:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedxt-0005MZ-46; Tue, 21 Mar 2023 15:31:57 +0000
Received: by outflank-mailman (input) for mailman id 512798;
 Tue, 21 Mar 2023 15:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pedxs-0005MT-1e
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:31:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f80a2be-c7fd-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 16:31:52 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 11:31:43 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5762.namprd03.prod.outlook.com (2603:10b6:303:90::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:31:41 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:31:41 +0000
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
X-Inumbo-ID: 7f80a2be-c7fd-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679412712;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OxYxRObeEdwV3yyDPTVqfkwmcc/AnBAJdIJG9kkWKoM=;
  b=PZty0aMEzwPAXwPiycBunhxygvuDwFIVrXtFpuk8qAIqM13TCPlVdvWu
   A1EWL9xO2JvdoBJ3r16Sn9xFuSt/VG47mGa5t6ymRoN6FlIHWkT3JiPct
   8p5kqMZ8J8HpRdC3IPXDlWxVdL8LlfMKN9T4eKC0CSfj/FZ75XR/IYo0G
   Q=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 101094580
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lZNgFa6LttoEibRlKKcBAAxRtCrGchMFZxGqfqrLsTDasY5as4F+v
 mYWUD/QMv+NNjSnc4siOou/phkC68SBn982SAQ6rSozHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 tsSKywqVxW4v92G8OuFSPdlgeh+BZy+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXqjCd5PROXQGvhCjG2oxEUVET0tckrkmaWXqG2zdcx5N
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6D+3Zy4cKDZYYTdeFFVUpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:nOwGV6rF/l8fxNE+RdMlYhIaV5rseYIsimQD101hICG8cqSj5q
 aTdZUgtSMc7Qx7ZJhOo7G90cW7MBbhHP1OkPAs1NWZLXHbUQKTRekMg7cKqweQYBEWndQtsZ
 uIHZIOb+HYPBxWt+u/xi+SeuxN/DCAysqVrNab9VtWCStNTI5BwTtDIju6NGozfiV6bKBJd6
 a0145Jpz+tY3QFYt7TPBQ4duLevcDMkJ78QTNuPW9E1DWz
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101094580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef3keST0LUYZ8E3odAu5uO60BL72RLUn/HT3WCshn73M1dx7NXmQ1Cw+rdzgYqdmZzrNkeQCgq2xRdE/4PmTuIgye0HOY7PJbypz4JYYOaM+qk+0YWFQNPPlbmHF+fV0oyqOiMqD8e4ipcdgA9+AQK7NG2n2aI97xPH67hd/qwkq6Y5xSLHauDRs6P4twQZaueEgd92WjH1JZosg3Bub5q2MTiHBcMFjd4pnWDOWrLWdIYABITkloeAKOPFHqNR3j3r1k2rNTEKZV3xtK7LlpNXl1CZ3lBIXzeu2h/wud/MnU2nVs+W+Z91jYxf+ulpnbAYGbEubdgTilH+gRZW8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgOVzEkNbKiUX/cfupqbNE3o/J6r+GiPvKYpvQl18h0=;
 b=AWd+gOxH7RW2M1hl3O9PIo64ApnQDh/fhEGkPmTPbugr/503HmtFy0RWxwWjsI7eU3J39iXIIP2gWNexdFkJSPHXDqbbGZ6VQQfOijMEDMIK8e5/9YDqoaszhnAJkjfluukZWVMjH9y+ECx2q7HcyHwAImGR6Art104lifUOs+WEoIHYVQl+rebGrcL29yhyc6tLTpnYg9IlbnGiXhfgeZUfPMqkZGRMh0284DO4iJGuZoFevy7/ptJMF02oJZVyUSWY+2tbn+DFfCtSTtzIxiKQdeB/w+eZko4ptNc5BqZkZpR2OfFtARZkM4uLK61UvPUF+exaFJvTAWYOrK5Efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgOVzEkNbKiUX/cfupqbNE3o/J6r+GiPvKYpvQl18h0=;
 b=QfgVC1oBf2ktJ6NA3m9OiVHG+RriIrHnhwa8CBhCxZPmMju1tRdXhCgr54HOcRO2I2JkLYZq31eWU0bYlkbQXJgUQqs2G8gpgVbB1+gpaA2XiVzfAnOXAwF66AncfdYo+SJCKmc/Y8ZSfXQwwW20gaS6wvhH4IdtPCZPapIQ/m0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 16:31:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBnN1VRLBtuoO/b0@Air-de-Roger>
References: <20230316120710.38817-1-roger.pau@citrix.com>
 <aa9bf8f2-5ff1-27b0-bc41-b7b639648e85@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa9bf8f2-5ff1-27b0-bc41-b7b639648e85@suse.com>
X-ClientProxiedBy: LO2P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: c80c5ef1-164b-4f83-f230-08db2a215e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEgzhagbdnEKzy7FwbDK2ZCZQZyVTBMMnLEFvhnayrUaAer98locZPYcdFG/LZzarv/RGIT6V+cR1TQNArVpXSbPatdf/TFavf4fnoM6QI5ndfeHvSIjQSgk1wRCG5qyBRP7ZZR2gW+34t69lxF9lDEaANWC7/attjO5xbvWl6TTeIlzWzG005sEh4ELTzOzHXWg8l68BadXv3Vg91gKWWLdezszTKO+xVXD8s1I5Ioi84ksfDVuJOu4PedpqyBbt/pyr/CDz3FmM/2qPry8rkTUXyz9xu800JWbuP2dZWpFCnSFVEri+Rh+lWPCp1llSCoF8VLsBLi/mb8H0FxMD/fcKm1QlIqWIgaTk/q9VB1cI/WBElAQXcWVr81OAkrXLrRAgMuoMsfCC+hUolGsDlA6wU8EIwLnWGriQiGUJS/ijdpgx5Y4fq8UQs1T4hkVa1Ps5dvy1DPQN6PQisNfO2TBJh2i+4CIFOC5RUnIOnLs1pQl3MCoJ07ux2NMmY9e1Z72RSQIT2VOo7wlGGHkX6TBty3gCj3/h7VWfSzle3W5vxTPXt5XOH6LJzcO3rbqtP0cjpRC64Brhm6Snf4f1UXImGvNtWBCi+/zPKIqAtIIeZfffWDWR+lJhCfHPbBiBZcRiHyDgCOT0Kgz/MkKjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(66946007)(41300700001)(6916009)(4326008)(8676002)(66476007)(66556008)(38100700002)(82960400001)(2906002)(85182001)(8936002)(5660300002)(26005)(6512007)(6506007)(53546011)(6666004)(6486002)(186003)(86362001)(9686003)(83380400001)(33716001)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1lTWswSHhEVFpndDQ5T2lzRDBxVmJDQjFmZndPT2cwamEzbVNQdWxhOGdK?=
 =?utf-8?B?cnNTeWRxRWY0eDBMVDFNZ05kbnZLbjVhUjdyU2Q5N2FJWFY1S1VidXo5dWt3?=
 =?utf-8?B?Ukozc3oxMTZqMjkzUkR5d0JyYXozVzFIY1lvK0ljcW1WempBankyVHV1UDBF?=
 =?utf-8?B?YklsK1RZRVpJRkJhVnRWMCtDQkJNTkExOHpuVm5oMGF2dmxjcHZQSmVFc0gw?=
 =?utf-8?B?VFBQWmRiRkZ2Mkl0dHlUVVZkOTl2TEIvUFR5UVlHejQ2Qk5OeTNBNGxqVmZj?=
 =?utf-8?B?SXNiYU03bjEzbTA3aGlXWU5wNUVFMFBRQ21vSnNhSTFoRDUvSnpGa0tveFc1?=
 =?utf-8?B?Q2MzZnh6QVpadXBqa0dKTVRRVGlPaEJSd1lGMG9aSUpsZGh5V2tuRldIV201?=
 =?utf-8?B?QmtMMEgrek5UOXc0azBSR3ptaWZnU2Y2ZFNRQWY4bXN4MW1LTTlPUlBXdGQ5?=
 =?utf-8?B?bnBNUE82RGxZN05JdU8zZUZkbU5ib0ZLU3ROejdiQzk2cjFxYTEyK0ZDUWVU?=
 =?utf-8?B?L3lvdW5PVFNNT2FkbEs5QThVblZoUUsxTzFhVTc0NFZnQUsvMk5rOXprUGhq?=
 =?utf-8?B?VG1pNmN0dStmTDIrcHZFcnlmUGNPbnBJeGc5WSszWDhWOWFMcUtjMFlNMUZy?=
 =?utf-8?B?OUgrOUQwTWxyVStCK2R1cTA3MFlyNk9rSVc4M1ZWNG1XVUtGQ0dYSmQ4NU5V?=
 =?utf-8?B?Nyt6RWVUb2cyejVROVBFQk1FelN5VzFTRy9CN0RaektDcmtEZ1RROEI4UU1p?=
 =?utf-8?B?RjBDSjZVYmpId21jZExsK0JobWdtYVo2U29ZOU5tOHc1NCs4ajlaQkJsUjhS?=
 =?utf-8?B?UU00Nk1PRmkzcWpmeXRtZUw3NkljZENuMTNRcktIVnVQazliaTlsTVd6L0tD?=
 =?utf-8?B?UlpwL0d3K3BNc2VwaHhwRHZUNFBVWXhTU09pSzVXbGRXTitXNmNUdGRRY0tx?=
 =?utf-8?B?cUUwZ2JSa0w5TjlBM0k3bC9MNjJZWTllMmJLMFBTRG4zNllxKzhueDNkcXgx?=
 =?utf-8?B?V2YzZlU3a2Z2eU9XeVlhcFZqTzNQM3dFZGNRT3NwZFAvOU5FZ2k1N250aFV1?=
 =?utf-8?B?aVdKR25VdWRFbCtZVjYvTkdKSkc5K2NuTUd0MjhTSHl2VmtqQi94bGhTUkJK?=
 =?utf-8?B?Q0dQQnZ6aXl1VmZ5N2luelVibVAzOTJ6djlHU3NOWktSYXJKZGV1MC9zdDZ4?=
 =?utf-8?B?YWIzRngremRNUXY4UGNsa0hmZjdTa2Y0NDMrUjdVVHBSZmphMHc0Q3NROWw1?=
 =?utf-8?B?K3ZEbE9iQk1xZ0I3Mlh2L1I4VllyN0FjRW5HWG9Za3RJNmRyQ0d5ZXdPYmxW?=
 =?utf-8?B?dnlOVkNMYnFyREVGSkpwbXpXZmZqdTN4Tmd0SlVzYUVsNTRkb1g1bHlyaUVa?=
 =?utf-8?B?bk1mY3J0VVBPdXhTZ085N3JaT1UxU0JmQVBKaitCRjh5TVYvRlhyK0xtQ0kr?=
 =?utf-8?B?c2QyK2lwemxEVjRQNGpEbXZueWFUd3lhdENDNFJ3SkFFajA3eVFHbDNHUVNl?=
 =?utf-8?B?ckk1V3JVckFnOE1wMkRsYWNyYUtvUUJCcVdOSXBpV0NIVTVxN3I4Yy9NWW9t?=
 =?utf-8?B?RTI4MHJqVEtyb0o4bWNkaWdjbnFnWmxBSE1aQVpGSjlrK2NvSHZlS0EzUUVB?=
 =?utf-8?B?Z2o3Vk40ZVhxSDNWOUlWYW5jbERjWHhUcktkTXlpRFVseDkwUzcrNFdaZWVr?=
 =?utf-8?B?RWdEUy8xM2lnSm13RGhrS2ZxV1BEYTdPYnhJTkRwaGcrbzBDa0M4V3ptYk1N?=
 =?utf-8?B?STcwTUtQbDdrM2gzdXNJNStDNFZUR0pvV2o3c0lMeHBmU1R4OFhScUUzS3ox?=
 =?utf-8?B?eURleEZwb2JFdEt5NXpNTEUvZEMwTkVvYUtIaFBYc0hZQ1k5c3V3RjRSUU5p?=
 =?utf-8?B?a3V5dXJMamNWekVkQVEwM1QyNEtER1lyM2czd3c0cStnL0ZwQS8xQ3d4QTF2?=
 =?utf-8?B?YnVlamlWQktFeERsaHBMb0dCS1h2TzkwK2o2QThDNEFVN1J0L2RtR29SdmRR?=
 =?utf-8?B?SDlhMWRieVk1REIwbndzN2FyTmRqRms5dVYyM2xMTWNzYUJGYklMdnZINHk2?=
 =?utf-8?B?Z3UwV0dDK2pGbWNNRFliR0Z0cUJQNHFXSDNCaEZiWFVJNGNHUU9SZ04wdVF2?=
 =?utf-8?B?dmdtdHlmc0tPK2FKalZmbW9GSEZGVENzVlhucnJZRStCWUNJU2hXSWZEWHpZ?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xRww33umi3ZjM+9TK9IRFwODyAogo9O78qzxH0PXCzG6q1WIFPRKVexQu85kmskZUITRKl2nP07jdkVsGI210bDEDqNLIxHYW/BCOv8ajxgCnrAy6SPoAGJtTZjQLjO1blkcS8GqVfaRLQgMnWVEJa1ZlNJyAQxvDGBtiQWAgdARzk6HGUWvxDA0Ca/QL54JyV0P3RYlozUqAcYa7GgwHgSX0Mt75zc09TG1KTMgoicei4Iyh3yPSmjGNgFMxu7yniyiifPxWCmrQInzkgP7HH/vKqVFJP0rYBp1Mj5oBr7tqGjCtxhsP2Q3hnhKZxriq4y/uX9Axv/KsyZYd1epka6K2uloNKNS2i5ooBpPG54oYDpAeA1q7Yix9SJhiiuMzcFEYuP0UJpyyqQWpJ/QjZjg+gnJnxXaf/TmbBAoaK2sF7T8e2hX7MLK7uWMfIlj+hn2BTApgPEcjMrmtAoDgJjAxnMv1ZgT1pbhKb9KLW8X2LtzJnP9kUPcfe3A83+mjkh97gzjOFtSvfxs4W5XeK9mL5+65F4RCmVmk4GFuFfJIkTaUQXkpS/77YuP8D2cUUeyOm066e0JjC1d6GV7LZb4SAXwSdWvANcPUcv/llwHH//6sQi5lcduGSQ4HYR1A4JlBR6KuvM6ozgcaQdC6QQ+6FgiBp3NvaGsXqueKE/Mq1nQ3799bdcaoAkLR4RRzlrEZb11DptPlXkDlyvb9l+L3E6dDZstbK41qV++oPHgM0XdhWFr/24gqKcO8vR1AO8j+DD4jfDGX17hM1hVYIXj0Z1FAKCUkUosSUJEfGE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80c5ef1-164b-4f83-f230-08db2a215e1f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:31:40.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wr5PgZ1P4gjPIFqfrJ0C9bsXX+ikxj5ruSyk+0YyR2SWA8R/qnF8uPlW1C0sMfMaO6VIkZStHYRalyc9oEIHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5762

On Mon, Mar 20, 2023 at 01:08:48PM +0100, Jan Beulich wrote:
> On 16.03.2023 13:07, Roger Pau Monne wrote:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -27,6 +27,11 @@
> >      ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
> >       (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
> >  
> > +#define VMSIX_ADDR_SAME_PAGE(addr, vpci, nr)                              \
> > +    (PFN_DOWN(addr) >= PFN_DOWN(vmsix_table_addr(vpci, nr)) &&            \
> > +     PFN_DOWN((addr)) < PFN_UP(vmsix_table_addr(vpci, nr) +               \
> > +                               vmsix_table_size(vpci, nr) - 1))
> 
> Looks like this would be better in line with get_slot() (and slightly
> cheaper) if the 2nd comparison was ... <= PFN_DOWN().

Can adjust, I don't have a strong opinion.

> 
> > @@ -149,7 +154,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
> >  
> >          for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> >              if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
> > -                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
> > +                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
> >                  return msix;
> >      }
> >  
> > @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >  }
> >  
> > -static void __iomem *get_pba(struct vpci *vpci)
> > +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
> >  {
> >      struct vpci_msix *msix = vpci->msix;
> >      /*
> > -     * PBA will only be unmapped when the device is deassigned, so access it
> > -     * without holding the vpci lock.
> > +     * Regions will only be unmapped when the device is deassigned, so access
> > +     * them without holding the vpci lock.
> >       */
> > -    void __iomem *pba = read_atomic(&msix->pba);
> > +    void __iomem *table = read_atomic(&msix->table[slot]);
> > +    paddr_t addr = 0;
> >  
> > -    if ( likely(pba) )
> > -        return pba;
> > +    if ( likely(table) )
> > +        return table;
> >  
> > -    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> > -                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> > -    if ( !pba )
> > -        return read_atomic(&msix->pba);
> > +    switch ( slot )
> > +    {
> > +    case VPCI_MSIX_TBL_TAIL:
> > +        addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
> > +        fallthrough;
> > +    case VPCI_MSIX_TBL_HEAD:
> > +        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> > +        break;
> > +
> > +    case VPCI_MSIX_PBA_TAIL:
> > +        addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
> > +        fallthrough;
> > +    case VPCI_MSIX_PBA_HEAD:
> > +        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> > +        break;
> 
> Hmm, wasn't the plan to stop special-casing the PBA, including its
> special treatment wrt the p2m?

I had a pre-patch to do that, but TBH I'm not sure it's worth handling
dom0 vs domU different here, the more that PBA accesses aren't that
common anyway.

> Reading on I realize you need this for
> the (future) DomU case (to enforce r/o-ness, albeit having looked at
> the spec again the other day I'm not really convinced anymore we
> really need to squash writes), but we should be able to avoid the
> extra overhead for Dom0? (Granted it may make sense to leave this to
> a separate patch, if we want to keep the DomU handling despite not
> presently needing it.)

I can indeed avoid the trapping for dom0, it's just a 2 line change to
vpci_make_msix_hole() IIRC.  Since I've already done the code, let's
try to get the handling done for both dom0 and domU, and I can submit
the improvement for dom0 as a separate patch.

> > +    }
> > +
> > +    table = ioremap(round_pgdown(addr), PAGE_SIZE);
> > +    if ( !table )
> > +        return read_atomic(&msix->table[slot]);
> >  
> >      spin_lock(&vpci->lock);
> > -    if ( !msix->pba )
> > +    if ( !msix->table[slot] )
> >      {
> > -        write_atomic(&msix->pba, pba);
> > +        write_atomic(&msix->table[slot], table);
> >          spin_unlock(&vpci->lock);
> >      }
> >      else
> >      {
> >          spin_unlock(&vpci->lock);
> > -        iounmap(pba);
> > +        iounmap(table);
> >      }
> >  
> > -    return read_atomic(&msix->pba);
> > +    return read_atomic(&msix->table[slot]);
> >  }
> >  
> > -static int cf_check msix_read(
> > -    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
> >  {
> > -    const struct domain *d = v->domain;
> > -    struct vpci_msix *msix = msix_find(d, addr);
> > -    const struct vpci_msix_entry *entry;
> > -    unsigned int offset;
> > +    unsigned long pfn = PFN_DOWN(addr);
> >  
> > -    *data = ~0ul;
> > +    /*
> > +     * The logic below relies on having the tables identity mapped to the guest
> > +     * address space, or for the `addr` parameter to be translated into its
> > +     * host physical memory address equivalent.
> > +     */
> >  
> > -    if ( !msix )
> > -        return X86EMUL_RETRY;
> > +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
> > +        return VPCI_MSIX_TBL_HEAD;
> > +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
> > +                         vmsix_table_size(vpci, VPCI_MSIX_TABLE) - 1) )
> > +        return VPCI_MSIX_TBL_TAIL;
> > +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA)) )
> > +        return VPCI_MSIX_PBA_HEAD;
> > +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA) +
> > +                         vmsix_table_size(vpci, VPCI_MSIX_PBA) - 1) )
> > +        return VPCI_MSIX_PBA_TAIL;
> > +
> > +    ASSERT_UNREACHABLE();
> > +    return -1;
> > +}
> >  
> > -    if ( !access_allowed(msix->pdev, addr, len) )
> > -        return X86EMUL_OKAY;
> > +static bool adjacent_handle(const struct vpci_msix *msix, unsigned long addr)
> > +{
> > +    unsigned int i;
> >  
> >      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> > +        return true;
> > +
> > +    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
> > +        return false;
> > +
> > +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> > +        if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
> > +            return true;
> > +
> > +    return false;
> > +}
> > +
> > +static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
> > +                         unsigned long addr, unsigned int len,
> > +                         unsigned long *data)
> > +{
> > +    const void __iomem *mem;
> > +    struct vpci *vpci = msix->pdev->vpci;
> > +    unsigned int slot;
> > +
> > +    *data = ~0ul;
> > +
> > +    if ( !adjacent_handle(msix, addr + len - 1) )
> > +        return X86EMUL_OKAY;
> > +
> > +    if ( addr & (len - 1) )
> 
> unlikely()?

Done.

> >      {
> > -        struct vpci *vpci = msix->pdev->vpci;
> > -        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> > -        const void __iomem *pba = get_pba(vpci);
> > +        unsigned int i;
> > +
> > +        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
> > +                &msix->pdev->sbdf);
> >  
> >          /*
> > -         * Access to PBA.
> > +         * Split unaligned accesses into byte sized ones. Shouldn't happen in
> > +         * the first place, but devices shouldn't have registers in the same 4K
> > +         * page as the MSIX tables either.
> >           *
> > -         * TODO: note that this relies on having the PBA identity mapped to the
> > -         * guest address space. If this changes the address will need to be
> > -         * translated.
> > +         * It's unclear whether this could cause issues if a guest expects a
> > +         * registers to be accessed atomically, it better use an aligned access
> > +         * if it has such expectations.
> >           */
> > -        if ( !pba )
> > -        {
> > -            gprintk(XENLOG_WARNING,
> > -                    "%pp: unable to map MSI-X PBA, report all pending\n",
> > -                    &msix->pdev->sbdf);
> > -            return X86EMUL_OKAY;
> > -        }
> >  
> > -        switch ( len )
> > +        for ( i = 0; i < len; i++ )
> >          {
> > -        case 4:
> > -            *data = readl(pba + idx);
> > -            break;
> > +            unsigned long partial = ~0ul;
> 
> Pointless initializer (~0ul is written first thing above, i.e. also in
> the recursive invocation). Then again that setting is also redundant
> with msix_read()'s. So I guess the initializer wants to stay but the
> setting at the top of the function can be dropped.

I'm always extra cautious with variables on the stack that contain
data to be returned to the guest.  All your points are valid and
correct, but I like to explicitly initialize them so that further
changes in the functions don't end up leaking them.  If you don't mind
that much I would rather leave it as-is.

> 
> > +            int rc = adjacent_read(d, msix, addr + i, 1, &partial);
> >  
> > -        case 8:
> > -            *data = readq(pba + idx);
> > -            break;
> > +            if ( rc != X86EMUL_OKAY )
> > +                return rc;
> >  
> > -        default:
> > -            ASSERT_UNREACHABLE();
> > -            break;
> > +            *data &= ~(0xfful << (i * 8));
> > +            *data |= ((uint8_t)partial) << (i * 8);
> 
> This is UB for i >= 4; you'd need to cast back to unsigned long, at which
> point I think the cast-free variant of masking by 0xff is to be preferred.

Indeed.

> >          }
> >  
> >          return X86EMUL_OKAY;
> >      }
> >  
> > +    slot = get_slot(vpci, addr);
> > +    if ( slot >= ARRAY_SIZE(msix->table) )
> > +        return X86EMUL_OKAY;
> > +
> > +    mem = get_table(vpci, slot);
> > +    if ( !mem )
> > +    {
> > +        gprintk(XENLOG_WARNING,
> > +                "%pp: unable to map MSI-X page, returning all bits set\n",
> > +                &msix->pdev->sbdf);
> > +        return X86EMUL_OKAY;
> > +    }
> 
> Could this be moved ahead of the unaligned handling, so there would be
> (commonly) only one such log message even for accesses we split?

Quite likely, let me take a look.

Thanks, Roger.

