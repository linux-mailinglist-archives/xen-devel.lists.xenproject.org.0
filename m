Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E1E6CA960
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515333.798077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgoze-0004Z0-Ql; Mon, 27 Mar 2023 15:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515333.798077; Mon, 27 Mar 2023 15:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgoze-0004Vr-Me; Mon, 27 Mar 2023 15:42:46 +0000
Received: by outflank-mailman (input) for mailman id 515333;
 Mon, 27 Mar 2023 15:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d31z=7T=citrix.com=prvs=4435eb1af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pgozb-0004Vh-PA
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:42:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01a6cea9-ccb6-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 17:42:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 11:42:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5105.namprd03.prod.outlook.com (2603:10b6:408:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:42:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 15:42:36 +0000
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
X-Inumbo-ID: 01a6cea9-ccb6-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679931761;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SSVDMtvUOqdL929W3SrqsG46NF49BM7hwjY9euzxMBM=;
  b=Ft3GpuNxbX1vBzTKUGhXSqhzpnIbaiG6JOXHuzuayXvY3XjVkpSNHmc+
   FBdATUSKKSp0BOssHkQhe3tpAeRtwDxI7oO/ArYNvVPYuDv68MVt1Hh3K
   txR3rVHkK3qHOd0922Jpv1fV/AiVzP3dvqpEG9X2BFYUanTec+PdTWJ5/
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 102944185
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2HFAyq5KfOh0KoWNCXHXbgxRtOXGchMFZxGqfqrLsTDasY5as4F+v
 mMYXmyCbq7ZZ2GgcogiO4q/9U4AsMDczNMxTlQ9rn81Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 dwBLCA2bj251vPt/ZeqY/tLnoN/I5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXmqBN5LRODQGvhCrXuf72FKE0Yqa0qKhNq/jF+ddcxCJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQHSR7KaJrhu9PCEUKSkJYipsZRQBy8nupsc0lB2nZtNqCqu8lND2MTD23
 TGRrSI6iqkTjMgEzKGy9xbMhDfEm3TSZgs85wGSVGT16Ap8Pdehf9bxtwmd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:7X132qpfkowDx4lJiSYolF8aV5rseYIsimQD101hICG8cqSj5q
 aTdZUgtSMc7Qx7ZJhOo7G90cW7MBbhHP1OkPAs1NWZLXHbUQKTRekMg7cKqweQYBEWndQtsZ
 uIHZIOb+HYPBxWt+u/xi+SeuxN/DCAysqVrNab9VtWCStNTI5BwTtDIju6NGozfiV6bKBJd6
 a0145Jpz+tY3QFYt7TPBQ4duLevcDMkJ78QTNuPW9E1DWz
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="102944185"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKPGZ0q86DjwscCMBxySh2e5l1DnUqKHBYhCj+pZEMxkBECLIHTPsUuF7vw1QgzrYKy4PReR+W50/DF5USoC3veXGkXk/OgNglAN1GpwH25zC3HYj96Fuzk7d1WekSXmonbht+zuBUBF35SPeebgHrhAYy1Dr4n2PFFPb8WEm5Y1umLSPvoJ1lcob+julPj4LENC/1qGWMA3lw124N4YxKmAPM9gsVuP2vM2ds5cNxqAGYNN/5zj6Fs0a5Hjz/HG7JN/agn3UyMHmEC0XJ/R9mx5HJ//JAhfNaOt/yE4EAuWIZgSoa1iFystlm+TLDl6U/86NKg9DmyhrtM0UEMCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHS6jqjRW5IebXgDbZe0PUK5VFUcNMPbWPZWJDB03eU=;
 b=hgZQp8oLpXP2k2LhWyZt6eP1y5rj5ysbgr3nIuR1rXaNwYw5JRqXgnVMK6dpUk7HSQ6CwQS++iMWu/lE7q3231lBsZebBkWVZzGiBMkhWdlhocY8CJwPxJzq8lgilt1LoLAWwM5XII7SRourrbu+9mX7ZgathbOFw9pE6KT+i11GTBwaoXhDNuAHAXuMM58+4IUTd+POsLOcidXE3xACF5ON9XIJb4BIQwC8cAZHjcWRmiNVWtYP2UOJW1WYPLXpwtH2srL7jNgQ9EVVJXtbErqQdmJk5/HT2hDJO5ZTAIGNBdpcDXjLgmw0QY3Ebdl1lcp0rJi4kKZJUDC3pwYmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHS6jqjRW5IebXgDbZe0PUK5VFUcNMPbWPZWJDB03eU=;
 b=a+Kamta5eaVOPQlrpHcbOt+9c9BuNBL7Qph6l+XK/uhMR2XLY0biIXt6Cy2A1sE5nHxrtI71NaehhhQLHjORWleN7OljZBLDJ44dMWpDFqeyPr0aURY8JXpXqghMQit36o0dIYhOtquwvdOT4jBKq2VYO0tS36y8fOuY8IJTYu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Mar 2023 17:42:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCG5ZeWU5CtRsZ9g@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <0fa4f2e8-390c-f898-973f-55f5b56a9ccc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fa4f2e8-390c-f898-973f-55f5b56a9ccc@suse.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: f32487cd-5695-43fe-11fa-08db2ed9e347
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8VljtFGLhk6/xEYZoKWa714n/GVOLr4HCLJDNLMKisVQ+9pJTDbJWJohZaVSHhGiQI61UtED8n3oTWE6YtoAMr+yXo8RmGlptOb+uOecc0My7T1JG5xOzik6TcbvkMazOp9NeVVKs8LqfrKGmgflm+4mZl9nclB+Vv3vTo4WhGVbi5A0xEBQJmm7nSJxCWwh+zo2KZWx3Zewdvi+L46TgutlLrxuZ4+J+f2arr+ArOzLO+Nb0nAotQiFUDlw1wksHfSgn9iiEs9Ed+yKHC03KgfpeFq+T7t8wgeNyJBKOO5grevRBqs0cfII4GS3aVhyFPSF1mKOwRYm8aAWkJ1Q3E9zDwRCnFbsoweZewE2ys9iEPiz+6Hid8msJJw68Ty/x3HV6IpOGZjQBQa32RSPLtWcNn8xTx2L7LhQGLSNg0XmyAxYFfL1TGRecJBqJ4OSEOttq5RXwa04W1eB8PuJbryyrL6D84j35uV8vBbezZj9kv3HPST6YRp9+dnRc0gKRE+IExnD4TS5qtNvgmYWmBWt9CB5w0OeVK08LqE4RGStPxb5cgcQuMBGX5y8dBLK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(85182001)(33716001)(86362001)(6512007)(6506007)(26005)(9686003)(53546011)(186003)(83380400001)(8936002)(82960400001)(6666004)(5660300002)(41300700001)(6486002)(6916009)(4326008)(54906003)(66574015)(2906002)(38100700002)(316002)(66556008)(8676002)(66946007)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y093S1A0anRVRGQ2UlZWN0RvNzJQa0xVL2N0SWVlNXlGc1ZWcGgwMlpEQzcw?=
 =?utf-8?B?cVR0V0R5VXhtd1ZjTEE2dHJWUGpsdUpjc095WkZmRFVtc0VTTWNsaWh3cWh6?=
 =?utf-8?B?VUdEeitjd2U1NlltUURFZk5uVFFRZmlEY1E0MG0zR3NpNlBBUnJkbmQ0WHpH?=
 =?utf-8?B?Mit6eTQxNEo2N2NxV0hqZlQvbGwxVXRGV1hlaUdIT2d1SEZnNElBOGJ6d0Jr?=
 =?utf-8?B?bVRxNDJKTG5pWHFVck1SbHh6Ry9VdVNkZVgwZ0F5ZHhibUx6bUlQNGl3amx0?=
 =?utf-8?B?R1RUVkVaN2JGdVFIakt0bWtQSHN1SXk2UUtOcEREcVJ0a1owSHVOei9LYW9S?=
 =?utf-8?B?djBlZ1NVdElmRm05dGFnME83YzZaaFoxUWFpa3pRMHNwM0REZ1oyVzdrT0lM?=
 =?utf-8?B?UVVpaWtBNzJlRWkwT3k2RlZ1Tm5sL05IdHNGSVFqYXZtR0dCV1lWN25sTlpV?=
 =?utf-8?B?UHV2SWN6MXZLZys1WWhnUTJrdHZ3azNzc3M1QjlNUXErbUVrNU10Q3VqV1JY?=
 =?utf-8?B?UFdCY0VKK2FLRkpqT2w4VElwQnFqRjdZK2dGRTZnb0tybWpOVzRWOXY3ZUo0?=
 =?utf-8?B?ZkNDbHk5NmZUVzVuSjUxcUZCSFU1YnNyWWUwTndDOXh6QURaSm9lMmEzdm9a?=
 =?utf-8?B?cENpNjNuK1hUeEpMMFU2S0g2cTVqYWFGc05TcDdHTmUxNEdsUTZ0VmZaeDBR?=
 =?utf-8?B?anRrOUhMYlQ1L2Z2UFVCQ2wzQWJuYmxtbHJOTHlDeGNjUUFwYUhQYVZ3TDNQ?=
 =?utf-8?B?aDZzaVdsRFVhR0xTL255bzRXZEdxeUFDYVQ2UnZ1cGZvV0VrTTB0YnJkMi8v?=
 =?utf-8?B?Qm5rb1NLeDdhZkl1QjQxSEpLR3lhb01ZR2tPcVZuR0dXUVRNUkZPY25jdGs0?=
 =?utf-8?B?eWVqWm53UTMyYnZvTFA4cFBDdldMNy9ZM3RGcW1VS1ZqSW5ZSnFCaUZaSHBY?=
 =?utf-8?B?YjdmYVFmQlVUd01PZGJHSVVJdWcvc0krYVhiK0M5aTdrZlNxdnNWZVY1QkRJ?=
 =?utf-8?B?QjZWa2I5ZXN4R3RSQjFFQm1hOGVreElkQm9iOSt2SVA4MldDVTR3QnpHRjVn?=
 =?utf-8?B?c0kwdDd3QWJlYVZsUkFiSjIwOEJCQlJycE1MOVJ5Q1dIMXNGMXVxcDVzYnNI?=
 =?utf-8?B?aFNEaHFpYnlZbUNCaUdBaHZ0Y0hETXk0bW8waG9IWEpYci9kZ2VFTURwcFV1?=
 =?utf-8?B?Q0ZBYURQWGMzSzE5TTJBc1Bla1lMWnNoYkxWV0lqWlVrZkNTc3M5dnFVaCtr?=
 =?utf-8?B?NGd5T1dONE52OWlocnhTWXp6OE1rNXg2bnl3RjNqRThZRmo4Z1FnTWd2aTZZ?=
 =?utf-8?B?KzVRTk0zczFGd1M1MHRmT21SVW52dzdtY1JDNjQxbmF1VjdlVUkxSjJvT1Zx?=
 =?utf-8?B?eG0ya2IvKzl0a3JaM1JuWHRxcjQ4Wk52MjcwM3QzT2VyWjZOU1N6aFJ4bXo2?=
 =?utf-8?B?ZTF0YS82Q3h4cGFHd0dvc1ZLVldYaE11NjI1NzhIN3RPL2VoRVJzOUxzOWZW?=
 =?utf-8?B?T3VsTXhVRUdaRmpQME8wQjVycEF0QlRDdktKeXdSSUVPWVpmZEpTVTl0RWRD?=
 =?utf-8?B?QkJBaHpDc3FCUUVUREU0c3dwajF3aEkzTDdOMElDVjA0d0QxNGtEY29mZFRm?=
 =?utf-8?B?eUJVQ1d6cXhmVEMzM01HNWpWczlvSVVmOGh3RUNMNmtkUjlxSkQybmJETnFS?=
 =?utf-8?B?OGVsZmcyckRWN0d2cEdJdDV6bWo1Lys4REZpWlBJdng4bkJVcHptK1N6TDQ5?=
 =?utf-8?B?THVxZ0pnU282VG1kaUJrMGJaVFpFT3dnbWR1eWJqOXVvTDZDeWJJWTVaUHJo?=
 =?utf-8?B?Y0JhNzNkZGlGOEpaby9jUytiZVNoZ3I1eFBkM291dkhWSngvaUJEWi9IYkZO?=
 =?utf-8?B?M21wdDBid3dscVgxd2k5bEI3allVaG9EVmxQanlsUU1NOHZtVityaDJuVWo2?=
 =?utf-8?B?VFpxa3VXcXZzM2lsY3RJdzFFUXNrcm1OVGx2RndseG5keSsrQ204VFlVNlEw?=
 =?utf-8?B?UHdRbmE3TlYzWW9PQXZiMUlJdTAvd3BsRnBTV2tsclZLeGNHZVlPeDNMU3Nk?=
 =?utf-8?B?N2dMWE1EUUg1SDNnWjJjcGhiMjlmTHliR3lpaFBIZEhRQk0rMlJFZWJsRE1C?=
 =?utf-8?Q?rg1icMOvMp6Enjzi1cM13nI8K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nb5PEphoeRXaw9mvpmxcqZy/mUqWJPG38XqpULvIRCHO7Pw3fIONkMchaqdaAubY4W/fh+ujgJH08IMpEIqqi6Q08+4abPIsxaJzO+SjV4w2zqJoHYSDM6m25IxkUmKxGAYQylK97LjDpGozK1AfwFRgtStkudC8ys9FzY+QJdDuLXJ4QFlfs6YSYkdn1SI14STsSRmQjnmq77HOvgf5I+2jsF/ko/dgkKkAjys2LfTKnMyM6Aa+/VvEz8Zdg/KDgZHby/RqwYXcB799rpppjBPfWDcRy55fIivRdSTt04KgueLAlcLbEJq8UFgWEbBhQQogOpjNIO6HNYAlHAYVpXME08qYlKN0vuHjKGdkizXViAfxbeN1Nu/spK5xMDF/AOiemmPmfWY2V0xWJjbYN/W2BU7MDHs8o9e18K2840zaE6wqgKFQ2vRrRw8q4HO1QII58djuWSHllQt23RizBRaMgfQAxgfk4Mir1JvdetjJDTNZ1qAkYLRa7hEsrjFPf84I81oehe9ngnt47dnabzo/sr8e9QkFFLqcZcSjXOWP0huvy2U3M4wtBatx+5M7bxFIlWxRqTWl3izwEBSR6mnj8+OiYnFE5yrek+b/1HEkjBWfTyo7j9rqMq80rbYcdI2v0yyiIZXBNsQlAp+p0dPW8WyuiKr5I+r6It4O8966Z9jUCneld9zmAjs3yERQ8RriT0ZItiXZ77Z/tq4sUT0O8ONfzUEyazYOXqwT3bCNWompVZI/aVPyT9u0rkTWT4PEyWHX0fF/wSDMD8+nRdAjc4+YAD/SDHpcYwVHWB4nWGaxOKaGZTRKu+sQXZkgSqClaBCin1jhEadJGiJ1j9MrCHRl1xnSWh4R8+acoRlKzSzxQoghyAB6+OfalP1zGaf8tntmdk9G5L1H5hb2t8PlvaMM7Y1e5nNOsWmZ8Ko=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32487cd-5695-43fe-11fa-08db2ed9e347
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:42:36.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S74cgJYQ8BKezpdSVMsAG4snGyzMTS9G8A1ibVsqyNCQqFj7nfde6WWAFFZNQTmVy9M0JD46UWzkErbNWKQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5105

On Mon, Mar 27, 2023 at 05:32:01PM +0200, Jan Beulich wrote:
> On 27.03.2023 12:12, Roger Pau Monné wrote:
> > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
> >> QEMU needs to know whether clearing maskbit of a vector is really
> >> clearing, or was already cleared before. Currently Xen sends only
> >> clearing that bit to the device model, but not setting it, so QEMU
> >> cannot detect it. Because of that, QEMU is working this around by
> >> checking via /dev/mem, but that isn't the proper approach.
> >>
> >> Give all necessary information to QEMU by passing all ctrl writes,
> >> including masking a vector. This does include forwarding also writes
> >> that did not change the value, but as tested on both Linux (6.1.12) and
> >> Windows (10 pro), they don't do excessive writes of unchanged values
> >> (Windows seems to clear maskbit in some cases twice, but not more).
> >
> > Since we passthrough all the accesses to the device model, is the
> > handling in Xen still required?
> 
> "All accesses" isn't really correct; aiui even after this change it's only
> "all writes". We still "accelerate" reading from the first 3 table entries
> (whether or not that's [still] useful in this shape is a separate question).
> Plus we need to invoke guest_mask_msi_irq() as necessary, and I don't think
> we should make ourselves dependent upon qemu communicating the necessary
> info back to us, when that's necessary for the correctness of Xen's internal
> interrupt handling. (That's further leaving aside the performance aspect of
> handing off to qemu just for it to pass data back to us.)

The call to guest_mask_msi_irq() is a result of a guest action, I'm
failing to see how that's necessary for the correctness of Xen's
internal interrupt handling.  In my proposed model QEMU won't be
allowed direct access to the physical MSIX entry mask bits, and would
instead use an hypercall to mask/unmask MSIX entries (and thus
guest_mask_msi_irq() would be called as appropriate).

Thanks, Roger.

