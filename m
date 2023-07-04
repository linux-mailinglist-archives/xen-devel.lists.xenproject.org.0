Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD977472C1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 15:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558353.872367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGg7P-0008Jm-SR; Tue, 04 Jul 2023 13:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558353.872367; Tue, 04 Jul 2023 13:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGg7P-0008He-Oo; Tue, 04 Jul 2023 13:30:59 +0000
Received: by outflank-mailman (input) for mailman id 558353;
 Tue, 04 Jul 2023 13:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGg7N-0008HV-W4
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 13:30:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0033ef6c-1a6f-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 15:30:55 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 09:30:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB4951.namprd03.prod.outlook.com (2603:10b6:a03:1ef::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:30:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:30:45 +0000
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
X-Inumbo-ID: 0033ef6c-1a6f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688477455;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=WCgkf5IFFnMzkXfG6LshJCt1hfuF+SCIXkc0CgQ4kdQ=;
  b=UuwfAXrDrMyo+sXgTShmEjCqhMvaMkp6hc/GEiLWusIKHzsu+aOWbL3m
   +bUNvsoZ/+y0ZTJCgSaBy60UKg1ZWQv3/USeyOUvkKfkzFis6nQxyW5vU
   Mn6S6krDXXGOYOcYnRiEJoinKyx+5lpJb5Iw26/0PkK2O/6bSiyld14nq
   s=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 113831609
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m6WjQKtJ/VtJsj1vUp0GeEqQ9efnVJhfMUV32f8akzHdYApBsoF/q
 tZmKW7VOffeZWX3eognOY6wo0gB65PTn9M2SlZprig3Enwa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACGyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAgsqQjSe1r2N5Z2EG9h9pdY+LMDkI9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4e9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdlCT+Tmrq8CbFu7wlITFR5KbEaAkeSD1US6fc1ZK
 xYm9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L84RudB2UCZi5MbpohrsBebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaETcRBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqY2O76T+FnGh3enocHPRwtsvwHPBDv6s0V+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRvHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:YjBl2Kt0e3H/UgdydKJSDhnu7skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: 9a23:TFOyf28dMXTq7fmI3fSVv2QvPewBbyyC91L/HB6JGEV7Vb2cRkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A80wbhw2cCaB2ZmLhqwjnUEJTpzUj55quFUNRqIg?=
 =?us-ascii?q?9i9S+aiZ0HSibjG6FTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="113831609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5feD0iZ0EwZsz89Vx2tXQ47rGmSgceff73kmk3VxgBToI6+1j2q/oMB7a/bZ5WFAw7hkxOQC33jbf1Rz9IqBoSovEW6fJ4JjG5NC2rA4VyQzJSpVFzYNGyhXc6dWrT6QBcZUxUbwG3229Sz3LQAULUFnXU+f+7CeONUOPyi1FEv4uwW/S6JjTGK9oiZ5/fxD8stagQ1WFELMcRChvLbZClElXUsiSM6KU0XXy6izBkom3ctZ1suz2aQqDqbL6ffTQf9wXBepVwKmbGM132T25Kje9r+RMxUGnJ5YbmgWsclDCCCVJA37r0DtNAuAUmpoC9h97NI0SU7DPHl7Drfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZxWrJPo11d4CXK2s+cv8367KL6szoxU2f/YBDm96Yc=;
 b=TWy7k+oBykGIOmOPmrFlpviO1Z/RZhIzAKMBO1RkZKIAi9hJR79FC21o97OHs+9SGm56Ka20foJPdI25bsVIhXVPuWwhBA+H4ftiquDeADCU+qhMtvQMm2EY7Ehnvr8okaXE2VWo8NWrn1ixo/+dWUju6n3TgJYOHm6ijNN5LPrcLl65JrtdFMxNlTKgIFn3YawXKQTtt2PyoLT6viwWz5TdMGMEo8JNKHRFR993KoAKgpvubft2cvjzt0Wts1IFoXsIXTlU0fKdxircaIMGozBhNNCQcArs4rsi/1jB353JugmMxTRUi4BELIIWppN8imiARi4rfCDuaD1sZcqEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZxWrJPo11d4CXK2s+cv8367KL6szoxU2f/YBDm96Yc=;
 b=CNZRwUJ+eTJbWw4JMEpFXdS/IF+wRIgrtIS1/w2TBt3+0c+CXcLqOxlo6vxSEbmOoprQK8QaZgsGtFLxVG3ix73ENOCNKOCm3PCnyxxl/rnurqZhdGxRqceDYIcHY+ldvImgcWkJJ0Qs+pHnx6kFMY1FHl1aRx3aehT80iWHwrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 15:30:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] cmdline: parse multiple instances of the vga
 option
Message-ID: <ZKQfABhcXgRLZK-n@MacBook-Air-de-Roger.local>
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-4-roger.pau@citrix.com>
 <0a0671ea-9209-37fc-1d9f-1c38aff45bba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a0671ea-9209-37fc-1d9f-1c38aff45bba@suse.com>
X-ClientProxiedBy: LO4P123CA0558.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ee22db-5eb5-4013-e1b6-08db7c92df33
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+X/J0xgXdr7wya8YtfXCBnJC3GzjfgpztNvt/E6NzAcOfwM3HJU26bTvRO752mex7NY71z5wVaAj2KhwYZtiy7dTaZkQNbJdx0NXy+IOxnAJ23qgV8DCVG2AV29ISrZIJIvrHEJz4X2gdATOt28hPMSHZrGs4dCK2cHCghoJsFV9cBD9RAOhxCySsXFA9gQQo4yrKkNomAvzs2+Z8dGlSmKLp1OTRd2KLzKW1yjqW8P/o+MqfMljGGeGleH20DFEvc+iOkFMJo6zPq6V+K6KMKu5i2ZLcIrtFO0RayYYppWygm5ZDThsu7xhNhfTpKmGLA3pP2jP5ABTYtKP/LlohqOGC1MPjA4jjXSKBoyEC6LhCaO3fw1Y1Z0NoxP9bSHOG+rN+MhQTswGyne9ouo3caIEeziLrEC6LP31OgCaoFf5arRJ3mt36RCDIeSgosmfXDiGoZzyBnmpOTN4Fk3SUu5bbR74H9E0mfmTZJvO7rGssleP5W52EN0huGKvceUXX0ehD29u2/MzV5I9oQ8oZEmVI1XQxvvMubdoEkxqwKDTuAiiaR1nzXYAqsTgjOSJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(85182001)(86362001)(186003)(82960400001)(478600001)(26005)(6512007)(6506007)(6666004)(9686003)(6486002)(316002)(6916009)(4326008)(66476007)(66946007)(66556008)(53546011)(54906003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09QcVgvRFZmTitYTUt4OFRaK2p3Y01wWGpnQzNpeE9vakVMYTYyMHpSUjZa?=
 =?utf-8?B?QmRiTkpHTCtaeTBLT3VRVUpGMXlDQnYwQmNyQ3B1MTBRK2Y2OXgrL1dnRi90?=
 =?utf-8?B?OXZzS003d0puZmIrME1KQ3RLNDl1ZnBmbHRheFJ2WlVCSWZWTnBBWTVQM0RK?=
 =?utf-8?B?U1A0dlZDWDBVUVlWWGdxaTVMOHFrS0ROOTluUXFEd1BuYTZiMTY5Y0hSaDFK?=
 =?utf-8?B?ejZoKzlwRGVzZTlsYkp3SFRCWTNwbklqNHQybUFwT3VTeWRpQ2JDTHU1S3VZ?=
 =?utf-8?B?RHJzR25MWGxWYU0xdUJxZjIzdlhwVVRpRGRGVTB2VEs2RXpvY3VaT2wvei9t?=
 =?utf-8?B?UUN2cVFmRjltNWFtNFdYaWsrVVBKNjhOYTlZOTJzOEg3bXh0ampORHdlSU5p?=
 =?utf-8?B?NE1zaTFsWE9XMm56Q1ZFYUJBRE1iL1pTdDkxSUNDRHdSSEphamRGcW1CMURZ?=
 =?utf-8?B?OWwvRFkrZ3FkU3MwWElnVkQzTnRCQzhFVy9pSDFaRENjeXdJbkNLYUZMUFVM?=
 =?utf-8?B?T1UyUzRWV3RwSERSZ0lRalE2cExjcURZVjZTQ2lOZ0pVTWhsWkwyMXpkVzZh?=
 =?utf-8?B?dG1GMzJKbzVnR0RKV1dDWmlEcldYNUovTU5CSjV4TTVhcUVWTFZpc1QycWEv?=
 =?utf-8?B?VGIxQm5WUFMxQk9tQUN5UGdUeTM5NGhnTzJ6RnFXY2N6R3NkL3pFNWxZc1gr?=
 =?utf-8?B?M2FNUnB0aytSSmRMaTUzeUxIVjg2VHdDeEJNZk9tYzQxVEQzTzNNL3FvZGFt?=
 =?utf-8?B?eDNKZmx3QmdXbElWZHpyV2J1cHIzV3U1NW12N1hJTHJvcm4vZkdpdFhBK3Iz?=
 =?utf-8?B?UGhicmdtVlZ6RHVXWmZ4dDJsa0RlVVZGQjJSM0p4THJQYjRJdkR2bDczYzJz?=
 =?utf-8?B?blNzdEdVWXpqZlNSamZKaWlCdkk2d3loQXlRbVpqMXNyQWI1Ky92NkZyUmc2?=
 =?utf-8?B?Q0h0ellEbHZJdktrS0JhZVhOQlJrRDVXRXkzREpsQnZYUXdoREF1SHBMd01i?=
 =?utf-8?B?V09WUjd3UVZET1NWRFNqOWltQVVVTzJBMzFoUFc5WlpoY3A0eEJNUzJiWVZI?=
 =?utf-8?B?OWVqZkdjS2xZNno2ZmoxS1RPMFVQQ1R5cS9PR3p4aktBQlVXQ2ZwSmlKTHZp?=
 =?utf-8?B?UE8wSExja1FJVUNnMnUrbE10ZEZTL2xnRzh4b3NHVVVOak5SNmtoWVJmd01S?=
 =?utf-8?B?LzFDZjFTSFFidHVTVWR2SHZhTVcxaUc0NUEyQlF6NHk4d1lTOEMxVzdNZ3dY?=
 =?utf-8?B?NjdsTDlxY3R4K1B3M1lhNkxBODcwYlRMMEIxbndYaHRraFN4b2Rsa3E4SUNt?=
 =?utf-8?B?WUdIZmRIUE1CblE5cDYvVEJKNXpici9QdzNYK2lWb2FqOXFMbU84U0lDMzl1?=
 =?utf-8?B?VmEycGwraVVzUjdUV3QvK2Q3MWxWYmVqLzcvSERVOFdwbVB1bFM3TDVQY2R5?=
 =?utf-8?B?STJDUm9naVZFQnBqTGl4QlJhV1BERHFKSzUyMllsa29BbmQrUDZvUjUzdC9B?=
 =?utf-8?B?cUVwd00vZnlWRHhVQ2VxQjJYTHQrZWhJczE3bW90OGYrajVkUjhZcEE0U3ZT?=
 =?utf-8?B?TEdIdnkzWU55bXhaMXBOUS9TR25EVjdnOExBWkR5eFJhVGpWcE5icnRpaisy?=
 =?utf-8?B?blhhQVQ5SlZmMjJFZHl5dWQvNTJmMlF0ZHhIcGVWb3I1K09Ka0tjTEY2YllX?=
 =?utf-8?B?QmZ3WThBMWFUTFk5OXhPSUtBSUlDVElJU1oxOTZBTzJMdUhOM0U0Zks2dlhY?=
 =?utf-8?B?WTIxQ3Y0TDR5L2VRS1J4QjRsMzZXd0VTK1kwZXFDcVVqNnNPQVA1Z1ppSmp1?=
 =?utf-8?B?TElSTXhrM3NWR1BuRXhSZUQ3dWVYdU8zdVFoM2ZZamJjVkg5RGxNNi9VenRG?=
 =?utf-8?B?clkvUHF3UE43aFR2UUNneHo4bmJJdzJLVVdrVGlnNmMyTTdQWkVBbDFEQWRX?=
 =?utf-8?B?RWpwUjYxYWlnaHBCT0dLWUtiYmdZcHNlcTFnK1ZXRFpoK050Kzh3di9BbDQr?=
 =?utf-8?B?TGFlSzZaOFBQVmxTeUtGQVp5YUdpWVFEeDRHcnZZUnBGOVNvMUM2ZTlvMUpK?=
 =?utf-8?B?bnQ3VmxjSGo2Qjh6aVFJMTYzRUQ1cUFjNkVTQVBzNHNzU3ZkT0FzM2F0dEs5?=
 =?utf-8?Q?SVPw8QNOjTux33irSzpgHNdVw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EbHfehsf/k1fDtUG1J/UoTAIcHl/qxTgAX0qXB917zRXskeBVospvMqRUquEv+wICNXrkmbKnV+Ieg/xgwkLlkTx33UNMFrluL0jViPyCM7TiOIvg3KmD5j0v4cnGwVgdJkiziAvtFoDy4t/2Ayq2xy5lPvL4QcoMn7MfkZajbw9L7EWWca1ew4jUOl1L0jdQSrUZzugDw9YL4I/wk6sPLii4EWYRXQ8pvqvPGsxfSQ27HyoxGo8Av2uO1Hu2igqEqpIBqe+Ucfg36dRdnOXLdV+gIOSPeVAcg6zA63u5H/7+5DGuDAfhDetlxuv1tpznHqym8txQuPCStjmKKyBPqNVEOBTG2xcGQDQAMXIqOuFM9WBFd0mTOivCtFvSoDfMi+PuMakrTRUefMg3n6/7+lLeZ0hqyKx/cBaAPwqQVLf3wK39PoSfl87PS1yrFirrHBkkksCG63yTbYK4/6r1aqR8kSaWGJ2mEud+sCGhvKgPxubuVHM4wySNbvPRYMNhdkLedpBWz3EZtnCXQT7cbccyuzPMe/EqS5DRD9K3tpN3Vck79QAHd8mHhrVGaies5h4PSuwXi7fHeyHLnAriaDyZC+9hIE9AqislO2u4U6tuQdvcX3a1mrGkfpD3HqrtzsnXfQFXp1xagFB7vvIPZ9NE6SJnuCa2FS0+oAvWtMaH9Kbl9fNamdYPQihZbS9s7vTmDNZAazBZ4zyU+dPTyITSad2QSMjs9aF4Lvc6oKG0NwJ/pntII7cZX7molRMILTdHLlH41g+x1fPpLIBW5eQwhQHRAGaND6TiNePI3VUiLAZnJTFE0NwAzrmAkm8BZcBAUgbIvNTxfHoz528Bqs5tMGo3OymxbeI3gqtPgA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee22db-5eb5-4013-e1b6-08db7c92df33
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 13:30:45.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7KVbj2cthHtbxOWpQAy3zULDXrC9Mamz3wmzCS/lUKN/NG4/F7p0aVvXc23KrOx5f/Ut03jvtwJ5GWbPqtpkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4951

On Wed, Jun 07, 2023 at 12:07:54PM +0200, Jan Beulich wrote:
> On 01.06.2023 15:05, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2628,6 +2628,9 @@ with the specified width, height and depth.
> >  `ask` option.  (N.B menu modes are displayed in hex, so `<mode>`
> >  should be a hexadecimal number)
> >  
> > +Note that all the occurrences of the vga option in the command line are parsed,
> > +and hence later occurrences can overwrite selections done by prior ones.
> 
> I'm not a native speaker, but is it perhaps more "override" that you
> mean?

TBH I always get confused with overwrite vs override.  I will remove
the line as requested by Andrew.

> > --- a/xen/arch/x86/boot/cmdline.c
> > +++ b/xen/arch/x86/boot/cmdline.c
> > @@ -277,59 +277,58 @@ static u16 rows2vmode(unsigned int rows)
> >  
> >  static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
> >  {
> > -    const char *c;
> > -    unsigned int tmp, vesa_depth, vesa_height, vesa_width;
> > -
> > -    c = find_opt(cmdline, "vga=", true);
> > -
> > -    if ( !c )
> > -        return;
> > +    const char *c = cmdline;
> >  
> > -    ebo->boot_vid_mode = ASK_VGA;
> 
> I think this needs to stay here along with the addition of the related
> "else if" below. Otherwise I expect behavior for e.g. a sole "vga=keep"
> on the command line would change (in no longer prompting for the mode
> to use).

Done.

Thanks, Roger.

