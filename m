Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1A714A7E
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 15:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540649.842543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3d5c-0001Ke-Tj; Mon, 29 May 2023 13:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540649.842543; Mon, 29 May 2023 13:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3d5c-0001Hk-Ql; Mon, 29 May 2023 13:39:12 +0000
Received: by outflank-mailman (input) for mailman id 540649;
 Mon, 29 May 2023 13:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxNl=BS=citrix.com=prvs=506ffa617=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3d5b-0001He-Iq
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 13:39:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f94d852-fe26-11ed-b231-6b7b168915f2;
 Mon, 29 May 2023 15:39:09 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2023 09:39:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7091.namprd03.prod.outlook.com (2603:10b6:510:2a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Mon, 29 May
 2023 13:39:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 13:39:01 +0000
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
X-Inumbo-ID: 2f94d852-fe26-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685367549;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V6kbflP2uyH2jf1gCs1e0iBxaHajIoKSjgqTEclgZ7M=;
  b=VmxQ0MeTcc3QsMpYm019ShUeKcjL9n/+18Br+i06XQxOHDAV84TuyaFh
   FkHqjzm7jP3oGJWKYWfK/bd0ANxb3bbgQScc06qmmG749wObIForsJeA3
   NY/9d36AXKHiTnpESAMGZU/tccVZV7zQGi6JtwzRJQdOYMSao2OLOHAji
   Y=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 110692140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:r+6Z668I1Czb64k+PDtmDrUDzn6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jFLWmGDafaJYWWhfdh/Pomz/UwH78TQyd5lQVc6pSk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoa5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklJ3
 qBEKS8mLSu82cKa6YCwVrZMmZ4KeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWxX2qAttOTNVU8NZ2j3u52C9PWSY4SEa/v6LptQ2MYtZ2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750NisoM27S+7ErwiTumrZjUTSY4/gzSGGmi62tRboO/e5ah71Sd6P9aNZuYVXGIp
 n1CkM+bhMgECpuHhSGWQOEAGbivz/mAOTzYx1VoGvEJ/jCs4GKqfJoW7it3IkxoKe4bdTSva
 0jW0Sta45lVO3mmZLF2eKq+Ds0rye7rEtGNaxzPRt9HY5w0eArZ+ihrPBSUxzq0zhlqlrwjM
 5CGd8rqFWwdFals0DuxQaEazKMvwSc9g2jUQPgX0iia7FZXX1bNIZ9tDbdERrpRAH+syOkNz
 +tiCg==
IronPort-HdrOrdr: A9a23:Ezt7/KyS3EgtOD5m8B3MKrPwHL1zdoMgy1knxilNoHtuHvBw9v
 rAoB1/73TJYVkqNk3I9ergBED4ewKkyXcW2/hyAV7SZmnbUQKTRekJgLcKqAeQeBEWmNQtsp
 tIQuxTD8DxEEg/reuS2njfLz/4+qjjzEl/v5a780tQ
X-Talos-CUID: 9a23:8DeAfW6yhZ0myS5WDdss82VIRsE6WT7m8ynwD2aKAno2aKLPYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AP+imrAx5C16T0+fUW63VZ+05ZwSaqLihLmoT0sl?=
 =?us-ascii?q?XgOeZKChuYGeizwaORqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,201,1681185600"; 
   d="scan'208";a="110692140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIujZPqEPQiLU5QR/sDM3xj/7Mb3JLn9uM0cP0KkbcNqq9djeQ06cIxy1bRNZ+KRd0olIeakarWv41zQHnnWa0ZsFViSLLf3vJ4k7P1gLLUSap6xvhzOGZwPb4w0QdSwHq2kbqS8oea+AxmLXA0a4lnC1BSlwjRWEwQ8WCO284S03Cuw14kAyArzer08CUoaBCAm/TFPYyFRRy0yzBi79buQFUAFutmmTo4DIr9FV+/SdDAFiCEhZQ/ghJXpce65PtE0yNobb0xMWd67XofNiIzvkqMrmHYpe+G+cd0/S+TBWiC1uadZIh/DaveOpHbP6/lrXVkOZ+VGL4njIeietw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGDcpZLIe32txpHdFxFnu4res4G7PYnJowBw6+3JgUs=;
 b=NFsY6Q8tuO764DFyd7ZooCoe4K70dVNpcbHMZI61eZOqwxxUwLWSRYQrzJlU+IlKff98oTqo72YTwblsl2ZNNQrBboU+HkC6np6UNoODOCKKAPPH1nV2N4DtM6tgA4t+lxeIe2ZlRxpmuY1JV/nA+iyYgbnKB+4U87C0UbEk51V7xRR+DFF3Q8SyGoiLLc1ZU5XMzEdO4S9SX2CRwjIivtS615KFcmbhvCFCqtqZZOf7OMshqvTO7Q1bQK839iErsN70bwKK4k4fDgwRBYG9zxemrt5fI13gmCy3+zy97mvq1UEaAFiXbB7R63Hd2pfvs0dqQzrqmmozM4hUKZ7eFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGDcpZLIe32txpHdFxFnu4res4G7PYnJowBw6+3JgUs=;
 b=PorGPeUL2S2vTa5JasEipwLWqLVsJMa/8TxJBl6SekPoVx0NCqvza7HOMndhAOLJ9rdEK4hNhTnibpzdoqthVZCp6ukaE/rio1CH0ECw9lHBvQ2L54ZR845clFoUwWk5Hc9bLPadYoQ3FPUf0YhzcciXYdF8MOTglBp9eoQ/vno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 May 2023 15:38:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 2/2] x86: also mark assembler globals hidden
Message-ID: <ZHSq73d8EKfvG9Ib@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <52f884cf-b88f-6fd9-e4d9-79da2bfde422@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52f884cf-b88f-6fd9-e4d9-79da2bfde422@suse.com>
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cc048d-4e05-48c0-f390-08db604a0fab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AtOJZAlDCa4nLI6i24orfhXdESs63InNGcpL1ynfNPlGZe8ghdJV8KZRYTwxibbwqB+C1OAPHdWk8rV9oZ5ao3ut1T18TyvtPhr2f35QMeKFbO72PeOc0Q613MVoE7Oj6lQnm/z+D0aYOo0iRl+tG7KK2kBjNZhx7WiI1WJze9Bqz8HiP3Fx2uOt0+NzAmP/R1jX7LrSJNTtuQFBAjMhhSSbwwmHwrMHBUjeu0p+507ZaA7OlqNU5SlAQRRn94Vb7GyyIuFeYRLg3ClSueAuyiFwQB0XJ/xW03fhO7uU/rN8+2mxsSHRWT7gVcjQzmkc+iAX7bVi2+N+CvJBJJKof+in1hSlXUDvqQEXeQpdR7ArUT2ScVzIW64Y//t6qzpefPgDNriGZwkyJxn/GOtOrAnRyC704OcnsWRNKrV7GtaxVbzUwEd6tugfOYHbZ5y0EY2vZaWZTcZ0rf6f3IXXPlFDeEtN4LhJB88/TYD/kQvRrveWnKcJNwCaRCpB6jdmju/ZPJP7PQcsKZctFZ19BXIcnARsaRZ6J6k7yH3O53eMohw/5+IrdPJ8QS4AQdsT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(186003)(26005)(6512007)(9686003)(6506007)(41300700001)(38100700002)(6666004)(6486002)(54906003)(478600001)(82960400001)(66556008)(66946007)(66476007)(6916009)(316002)(4326008)(7416002)(4744005)(2906002)(5660300002)(33716001)(86362001)(8676002)(85182001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW1SU3RFYWNQa2hQSmx2Y3krSEdHRldsRTJVeVE1eFFjbnUvNlN3V25jV3Rv?=
 =?utf-8?B?SE5JdUF4cFhHVXpqTStlMmVIaWRKMEtEY01Ya0dQTHdpRnlSM2Q5SThOOENv?=
 =?utf-8?B?V3pvY1NlQWpXY2dBS0RIamQ1OE91ZCsrMkgzQ1hmT0FuNzZDaXRmT2xVYlZJ?=
 =?utf-8?B?R2VSVmhuQVZHWlpzVUMyQlhLTVFGamtQLzZzdng3ZWdkcFdnZzBqMS9qOTRp?=
 =?utf-8?B?cVEwRkJzMldBcmxhWFJjOTVJZU0weXdWRFl4MGthRU1nUzFGdmI5T3lFR3Aw?=
 =?utf-8?B?RENISkhGL1haV2VrUWtZODg0V2NZTzVpWTJIeHJZU2g3U0kzKzVIU1VWUXZE?=
 =?utf-8?B?THpuRlo4TWVDN3NEN2tJd0lYQXBUVTg5OW9pZzhmSUhiWmhvWkNueE5wa1ov?=
 =?utf-8?B?MkZDblBiVVZURWVlMVpsNzh3MWY1YkpkbVBQQnNqQ05JTjl3Z1crRndSRFBP?=
 =?utf-8?B?Y2RJclM5Vkw0RkFSVjhJM2lJZlJNNThDbjJxdzRwOCswbTA1VUVSUEhSbFFx?=
 =?utf-8?B?VCt6Tm5xZExqM1YySGVWeDA4K2EySjRaaGRNY3dNTXdxQUlRbjhSSGxFOUZT?=
 =?utf-8?B?dzd4MDV3TkZtU0F3TFFwVWhHV0NNRHlyb2VKNGhTM0Rwby9ST3NMNjROQzRj?=
 =?utf-8?B?MUNsSjBGRU9SbGlZdDRydnFWRklYaXphTm5mOGlpeGpEU2p0dS92aGgxOGcv?=
 =?utf-8?B?TStPMGFINXIvUy8vMlphc3dvSW1zUnRaVkt5SVpxaFpza1l5RzQ3aVZZanJH?=
 =?utf-8?B?NlNJOFBMYldUTEpIVEZoQzZubkxVWXJSWGpqOWtxYVpOYWNxcXV6YTJ1YTFz?=
 =?utf-8?B?SWM0UGxDb1BPWFNMKzcxSTl0WkNjQXgveWovclZGdnV5U3JTNHNpQVcvbURv?=
 =?utf-8?B?NDh6RnBHd1UxSENjbkx3eW9qM21PNXJNZXVIbmI3NmhyUjlETzdid3hRVVha?=
 =?utf-8?B?OU43RkNjOUR2N1NFWS9QcFV6ZmpLQlFBdVVRWk00WHVxTzZXNXZzZThMKzJI?=
 =?utf-8?B?eVRWNVRqVWNoblUzMkNuQURrYktSNTk5d3lZbXhaZDgwNFpWUTYyY2hyaVhJ?=
 =?utf-8?B?ZC9ZSDVmeXVIREI0ZzdRV1V5bU1mZlIwWXFlNUtRL0o5eExrakdDQllxTUwr?=
 =?utf-8?B?Smd0NWFCdjZvQjBDVS9pSllLd3JVQTlQSWU2cXNPWnRwaUJCVDdaUjZSUEN5?=
 =?utf-8?B?eEdnQ1JvYmFiNm8zeWY2dm43Nlc5ZkNZZDhIRHF4OGpaVkpyellpZzByN2tJ?=
 =?utf-8?B?QVFQQ3VobGJ0NXVmbTVGR0NZZnRKczdoekJkQXNvMTVuVW40VkVXek5pQXNr?=
 =?utf-8?B?M0ZWV2IrZDNrM3RvVzB5bk9OWERZWjdkbEs0ZEZzY0RiR2pHbjJmWlRQekZI?=
 =?utf-8?B?M0dlajFhNXNESEZrVng1aDdvOEY5am5nRW5EM0pjTytSMkpOM0hoRGVWK2dJ?=
 =?utf-8?B?SGJlV3B5dlFQQXM0Wm43dHBhNmwwSmdGaldaenVzVG1ONFo4RGNsK3dreUh5?=
 =?utf-8?B?dWlONDk3YkZ6ZkxsYjAyNVlNZWF0dFBjY0V2OCtnb2xtYVVOanJWRUdCUUdk?=
 =?utf-8?B?VVlNVnFpQktnbE9OMm52ZFBpSitLV1ExQXVGK0FlTFZscmdxZnF0aWFRaGNZ?=
 =?utf-8?B?TDdib1dNaWpqREpYRzI1a0ZmaTZiako2ZDVKOVh5WlgwbXBjNWJETmUyNVBH?=
 =?utf-8?B?M29adEtoZWVQWjRYVDBaZEVFeE92S3J6TE5iRDROdGpGaG10Z1B6bWhzdVV2?=
 =?utf-8?B?MnhUQ1cwem1OT1pVNmRIYXZkM2FtRGZudmVYeHFnRkt6YXFicGUyWm1IZDl2?=
 =?utf-8?B?c05LU2JzSjZTNUdwc0ptbGFzYnFUVmlkQlVtOEM5TXVzZENxTnhWYU0xTGVs?=
 =?utf-8?B?UzdJeHkySHZnZjlsc3RCOWVCRlMzVDBQbXpBbS9nb09OdXhUeHByd3A1TDBF?=
 =?utf-8?B?d2RUakljbW0wRklaZ1hjNU9nZTlrWFFjMDd3NTdCNXZuQ05PNER0dzBtbE85?=
 =?utf-8?B?OTVVOG1EL3dOVU1zQmlWcTJiQ0t4Vm04dDN1bmwvSkF0WHp6enJkYXUvVnN1?=
 =?utf-8?B?Q3J2ZlQyT205MG1nTG92Z1JiT1pTRzNwdmRlV3ZiWEFjNWsxWXVldWk1c0Nu?=
 =?utf-8?Q?IoMzzdV8LMRSwm4BHmIgej4k4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?M1Rvb0R0QjBjY3JpL2V6YS9zVEJHeVVyZTdjNVh3cVpYM0plR0R6NWx5YU5J?=
 =?utf-8?B?dTJNaUNlNm91UWlnRXVNLy9hTUhYek5Oc2hxOUQwdEliZkdFYU9oUXlLR3Bl?=
 =?utf-8?B?WUpvQUZNbW1pamhTc1hrREgxL2oySDJ1VkxhUXUxcnhXNk12N2VzS2FhN3Rp?=
 =?utf-8?B?WlRETzRvWTFkVDRoMVFxZmMza2tKYXUwVkpaZjYzSmJUMnF5MVAyL3dYQWtR?=
 =?utf-8?B?T09TeGdIKzhsbUt4WEpZbXNsSExNKy9VTjhudFRFT0FRK0VzRXdBSm5wTGdo?=
 =?utf-8?B?RUJ3bHFnU0VaVzJOVzRnMlR2ZHhmbmRNRU5kM08yR0E4amdLdWhuRDArVTM2?=
 =?utf-8?B?RzUvRUxTSXdwVE9wS2M2VGw2bUJKN3VLR253aTFWUFNPK2JDbjZCL2JOT2ZT?=
 =?utf-8?B?blZZRzZReXhwbGRYVGpIWC9YWjJJTktlZGNUNkR6STVsdFVPUjNKTnU0Smo3?=
 =?utf-8?B?elYxNGtodEZCQXZzSzdzSjk0cXNNNTVXYjhpN1VyaEdSUURPSjAwUG5zSmI5?=
 =?utf-8?B?Y1ZaQ1pKZ3k3VzlSWlp0TS9lVUtuWmpUSGEwZFQwTWhPbXJtZjVGckFROEVs?=
 =?utf-8?B?N3VKS1hiSkFCYXZjQXBuSkQ0MnBJdWFTTTcrMG8wU1IwaUliZm1BR1BYK3px?=
 =?utf-8?B?cjRCS2tSMmpaSnNHYytPUWp3elNSWFBXNjBmVU05SFJ6M01UR3lhQW1pbW45?=
 =?utf-8?B?V1N0M1FFWTV1OFhLaFVMay9YNjA2eDc1R1pHVkhzTmw2QUc3Rm5RVDJUbzU5?=
 =?utf-8?B?Vm5qMzJhcjM4VjYySEIwREd2ZEFxbzNrWGJJUTY1MHJUOWN0bGJ3bU5ISzVj?=
 =?utf-8?B?bCtBQ0sxTkc0VUNMNXozVW5iN0FJYSt0dmo0bUxZOUlaNTBGOGZyODFuNnRE?=
 =?utf-8?B?MytVeTVWMlhSNFBxbHBaZVBtbzRVd2JDNVBvVW8zZGpXd25hZUZybGlxdGwr?=
 =?utf-8?B?dU1yZFJUbGRScmM1MmJyYmwrWEpEOXZtWHpQN2ZsTXRoa3JPYnRJc1ZuZDBB?=
 =?utf-8?B?L3ZxS0Q4Wjd2a1pNMlBTeXN4YUNSejZDajVHMVE5L3lwM01aUDRvbmpCeTZH?=
 =?utf-8?B?TEVXYWF3WHFhMlljR3A5ZGxwd3oxd1pLdzhRUFhRK3k1VldHMFpzc2lKbTAr?=
 =?utf-8?B?V2ZUUHZaY2drRUVldWdTYVE1THNZUjBLUHNIZUNEQkx2cnVqUXU1Tm9Ybll1?=
 =?utf-8?B?MFh1Q3JGcFpPdkNWSWhtMEhOOUZ3MEhuU01ZMDM2MXJtN1djWkVzVXR3RDhY?=
 =?utf-8?Q?kwsh9AluYdldlj7?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cc048d-4e05-48c0-f390-08db604a0fab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 13:39:01.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJd50uZCQj4MxKRE0vDZKrE/mBjNFJTOKCrFU4fSytFPtpjd+JAaOCbxP5LN0eS8xwavqHKtipnMSQAR9dBIBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7091

On Tue, May 23, 2023 at 01:31:16PM +0200, Jan Beulich wrote:
> Let's have assembler symbols be consistent with C ones. In principle
> there are (a few) cases where gas can produce smaller code this way,
> just that for now there's a gas bug causing smaller code to be emitted
> even when that shouldn't be the case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

