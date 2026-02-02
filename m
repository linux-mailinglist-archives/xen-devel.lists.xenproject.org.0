Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJxuDuPHgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:50:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AACCE6F9
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218723.1527569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwCK-0001qZ-GA; Mon, 02 Feb 2026 15:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218723.1527569; Mon, 02 Feb 2026 15:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwCK-0001oC-Cw; Mon, 02 Feb 2026 15:50:44 +0000
Received: by outflank-mailman (input) for mailman id 1218723;
 Mon, 02 Feb 2026 15:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmwCI-0001o6-V7
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:50:42 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecd9ff95-004e-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 16:50:41 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5253.namprd03.prod.outlook.com (2603:10b6:610:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 15:50:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:50:38 +0000
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
X-Inumbo-ID: ecd9ff95-004e-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6mgCZu5bGPBqIa9ALF4mmiLPODJ2/bSTHliSIYEcG+0qyPd2A9BYR4h0T3cWxEH1XDiys04azBbWEF5uAOxiSiAtXcuzSr6rKI7sXFf10mGACJ5mcLjbC5O92hEx5ivj4OvfC9k20breSzA5YnsJeQmPkU8rtLzC1oHFs+uXbAkHm7FsA7/f00USwmQm55fr3Yctgxv1QwY+MDx7gd5EhrPFuUWREyjaVDptpkzExlVnAV6j0Df32fNipH2z0qcTARkWef76z/FauaR5PXmqkGLd8wJloaP0PNuPghsNLd58Fn0T2hWuNrUU9naFgwhtl673AICAfMKPx19W7qUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+RRRC0MOrEnYrxIii09KIC60Ite75AJyfTqgG+qhec=;
 b=RaGQSUuWFdo3cJnb57ydR5bqGXZ4ZsZr/9ZsHktIkYWw2kk0j0NT1nna1YOs+wfJlLz6vskJWiaxMgNVk3GlYs3WHIl90QM48koJMbU0ntVH5hT6ROQjnkfDnGOBiAhrqt9z//DZnVMUQCsvaxbzLeHfZG0GFeUXDIEkcf7c4dLXdtXWMfYBepl1DH5EsAzKrhv9C5rATxwj7gB/RNksaVhmY2OS9haAKW+atBINe7sYeqqh5BIJfoZOjEcFo+a4tRtZWKrNvdOETcwBaGe/DbPt9TaDE5K4fh6IIwiTRwmW1PjJS0e9oe9QOX05HAAVQsL/1Ll69XmPLgHwXF8b8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+RRRC0MOrEnYrxIii09KIC60Ite75AJyfTqgG+qhec=;
 b=tYcJma2werApM5lh33g15QEzOeuSH8yzKsC19secqJX6+7pU8mlhqqqIug60kjq+sEJgkq7/ebndyd2Fxxm5f3ZAfUqiwRn8b7lf/35RM7K3AGciNTygGy/XF4XwBwHDHm3k0aInmcYXO24MuBxQAHI/p95TiZYopHvTBnKk3OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 16:50:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] CPU: abstract read-mostly-ness for per-CPU cpumask_var_t
 variables
Message-ID: <aYDHyutbi9EQcOe4@Mac.lan>
References: <fe35f075-ff44-4942-bcd1-dcd917179867@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe35f075-ff44-4942-bcd1-dcd917179867@suse.com>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0533687a-d0cc-4f6e-55d5-08de6272cf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zys4NWROdkpRYUVES1ZYN01abk8vbXRtSDAwQ05uK2djV3pYZldFUXIzaXJG?=
 =?utf-8?B?NTc1WmV1NFBMQUNpallrQVU0MVBYV3U1SXY0c3lHVjczSHV2VDFiNXpIMHJN?=
 =?utf-8?B?OG5kOXdaZkVjbnVtRk5Sek5GTXduc0RNZmhXeHkxT2NWMlo0VEZoTVRVaThv?=
 =?utf-8?B?UmI5N3lqOUJUM0xwTkFyQnc3L3FTY3Fkc1IwU00wK1FGSGlnRDV0dlRORmVa?=
 =?utf-8?B?VWZHbzJhSGlIc2pMTmV0RmhHTnljUWpncStGVmlqd2NPYkNUd09nTFZHZVE4?=
 =?utf-8?B?a3BJdWVtOElUL0F5SHJYR1dpZEd5TkFDb0g2SDlNMWxWSXBqSVdEeDdPdHB4?=
 =?utf-8?B?SXZuUzJpSmV1NUl0OUlMaTFXUmo4ZjUwQmJHc2VBOUp4SWVkSUU3WkZmQUs0?=
 =?utf-8?B?UXNJZ2JjeFFmZHNrNXdOODM3azZYODZiZ0NNMWlzNTgyOW5NM3VvOEcvTzdD?=
 =?utf-8?B?b1p4VGVFZmVoVEtwYnljTTRWT0d6aEJ2dnlVL2N0K0xDbVVzU2UrS1RKcDho?=
 =?utf-8?B?bzNTak03OCs1eHNuRHpHT1VrbG1uUHRaNlVZUDB3OWVHOWRua2NtTktHV1JQ?=
 =?utf-8?B?aUVhdGwrenNXN1E2T0c5VGpnYXVJaitmMGJvNUw1WUU0SThPVGcxaWRkUk8z?=
 =?utf-8?B?b2s0QytCTWx5aFljM3VzT0pyclk5cm03QmhXUmRTRnJWSGFwVCtSOG9rTGlz?=
 =?utf-8?B?bTdZMy9OYnlJNHk1S0lURzI3ZTFUazBOWHRUalAyNGZzNWFWdWFoMlZUdHlK?=
 =?utf-8?B?Yk5xaGV6anVOQ0hnQWw3eFBGRFp4T0RKMFNLYzBNNk4ydU1YdmVZUmV2TW1u?=
 =?utf-8?B?a0FEajMzYlZJaGp5S1ZOL3J4eDVKeHpCS0QrMnF6ZXkvazZWTVdJTFo5S0xC?=
 =?utf-8?B?TitMQktQTXFQamkrL21kTUI0S3RmbWhhdlhNTXhkMjBuQUQ0Y3FaZ0wvQzU3?=
 =?utf-8?B?SHBJd3I1akc1Z1hYYU00bDMrMisrZGtvajFFYVdMN3Y2ZzU1WEhLZm9laGQr?=
 =?utf-8?B?YmFLSEN6Nm91eWM4K1JtamRURmhqRTZuc3FIK2tMNUVTZ1ZJVEcwTGdYRU0r?=
 =?utf-8?B?U2o5bXhjU1NvVnp6a21aeUhmbHhiNDV6M0szNWpFL1FDRGdMUHliU2JuVjF6?=
 =?utf-8?B?QWxxcGo5NTNISWJ2RkdUM0pSS1IreUFEL2ljL3VBT09JeU1VcHNQbzJiTEZD?=
 =?utf-8?B?a2FTZ2lydjhNRzM3UG01Mm5FbzB6ZW1uMiszSWc1L0pYblZiU1FVcTk3UmZh?=
 =?utf-8?B?UkNTL1lYcnVIUzNIUnE3OVV2ajdNdkhsbG9OTC9jcEZFbGpibkpHYXhxWFAv?=
 =?utf-8?B?S1V2N3BmYnpjV2V4NXlEbXZQUC85UCtzZ2tSc09YVlp0aDJQbVdmMUNHR1ow?=
 =?utf-8?B?YkpvQmxJVXNPTDM0cnYyVlNxczNsNkZaOUJZZXUwaHpGVlg2UHlHTW1ROTdn?=
 =?utf-8?B?SVloZWt5NUkwTFBHRkYxMG5lNTBpSkhUWmZNUEtyZzZnZXQrTk5iTmJ6QzR6?=
 =?utf-8?B?a01oalVKbzB0OHhFL090VGxEUVRsR0lvZE1jYnc4Z25CR01DZ3lyM29LMXhr?=
 =?utf-8?B?NXpEOGw0NFNqOVF0Z2sxWHFaSjJyY20wck1MbEo2eldnRVJyRWYrR1dPSmh3?=
 =?utf-8?B?U00wSi9Pd1QwcXJzN0RlaEFQNzF5bkxrZmI1UVZONThUc0JEV3RWdjA5S28z?=
 =?utf-8?B?S3Z4Q3FoZEtFSlRKVUlSRnV4Tmg2M1gyeUlYZnc1NmxvTEVvSzdaV0Q4QkFE?=
 =?utf-8?B?NndRV09leW5sRDVsaXpmSnAwU2VCUHA5eVZDUWN0M096Y3hiNWEzQndRL3Jm?=
 =?utf-8?B?QjMxSE85d3QyRGlhL2llbjV6TURPZ3hBcEQvU3JabUREMHZvVjYxMDZmb3Zy?=
 =?utf-8?B?cHNXNHRQTHdPeDMzQWtBVFlzR2w0Z0dWNHRVRkdBNXBEazhNcUFiWDFwV2I5?=
 =?utf-8?B?aEpCZThKVUVwM1g4QU50VUlSMDFPU2hWYUJ6dS9ndk5MRzZNa05Ia2xIOEdO?=
 =?utf-8?B?RVpGaHRrOVJpYzJxeFRGTnZzS0dHcXhWdy9vTmQ0UHFJNmdFMExCM1NjVUJB?=
 =?utf-8?B?Q1E5UFZzMTZzZTFyQzZRTVFveWhPb3VtZUh5dDcwMkZHSWUycldUZTdiN01s?=
 =?utf-8?Q?G2Xw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVpaVnFTVHJ5ZXl6dzRMcnp0YWpodFcrS1VWb09GaVJOVGFENkRhVnd4RjU2?=
 =?utf-8?B?Tmo3UlNnekFVYXl2a1VxTGhBczdMMjBEZTVBSmFJRWZWbHVKbnJlYW1uUDdX?=
 =?utf-8?B?cGZKVTZScE1NQzNmQlJQbVlkTHVTVzQ2WGxUY0x1UHNuVjE4ZVg3ZkNIdVZS?=
 =?utf-8?B?YVg4OHRyQjNiVFExRTYzTGxENHBPMW9SZTBvYzUyanhKbXpHWlgwQjdqYjBh?=
 =?utf-8?B?REROdFhpSFJEKzdhYzQvaFFCS3JLRlFwS2grS3lKK01MODRlakxwd1pIR1Y4?=
 =?utf-8?B?TUUxSUVkZldCcWk0M2hrVnVhMjl1NDlaVmRPc0ZmSEFMc3N6MGJLSHJvUXBK?=
 =?utf-8?B?SkdTY0pGa1pydHBTclJtdkk0ZVF1L1ppSWlySWY5Z2lDaHo0eTZScjZDZEhi?=
 =?utf-8?B?NHJIcFR5S090WHZuOXFGUkZWdC84SzdDdDFObTVzRHBsYmFOYlFsVHU5UkVX?=
 =?utf-8?B?R01iTG5xSTY5cUdTUHJTa21xUzdGVDBQM3lMRFlncG1Bd3NrRzFFRUFkUUZW?=
 =?utf-8?B?ckdLTjN4YmhXWDd4eDhPYW91RTYrc1owQnhIVDRsRkw0QTBWaGpJY0NSNWZU?=
 =?utf-8?B?bUhEejBRa0xkazdxTkRYdFhmNGl3RzF4QzMxTTV6b2JKYlV3UFNjQlJZT3I4?=
 =?utf-8?B?OGw0K3diVmRIOC9mNTAwWC9semlydVdGVXg4U3VWU2Y3VlRqRU8yazhtYXZD?=
 =?utf-8?B?RUVXTlJJMG0zWXJxYnY4Qnl0UU1yR3F6YmxiQ2JGeVVxVndPYThvdnhXMk5Y?=
 =?utf-8?B?dXY5SUVERXArZ3BZUy9OUEt1cU9Kb3dNYnNjUjVQUXd4clpFMnkwWVVXdm5t?=
 =?utf-8?B?bnVGVWttYkdsbWtlc25adStpZXNmQU1KTHJ1U2FNUVBTd1E2V1VPTWZ2aDZE?=
 =?utf-8?B?ckw1cFozcUJxTGhxdWN0cWF5OTUrYVBWOThOZmFwSmFXeEVVajNFTlJzckxR?=
 =?utf-8?B?VVE2TUJGOGQxMGVUMXZKK0p5MTM1OUtyY09aR252dHBZaVQwYmphbEh4T28w?=
 =?utf-8?B?SVVNRFhpaktVZUpWYlJ6aWdKWXBqMkZWZDJoL3NXUlUyWVdhclFlOUY3Mk9V?=
 =?utf-8?B?cmVQRHFQWFlhRGZWSldvcXJ6eERpK2pVMTFLem9TSDB1Tkl2OE9ydi9uWVlI?=
 =?utf-8?B?aGJONkFtUzAxdmZhanNNbXFlUE5YVFhuYlY4MzUyc0Z3cDdOMXJTVnlZY2FB?=
 =?utf-8?B?MzhNZlZNTWZ4bitwY21ROUE3NEZpNVI3NkVvVSsvQ2xYZ3daRzJaNHlEN0xq?=
 =?utf-8?B?a29helRJSHFNZlB0T2JRVkNKcm5ycXNPbU9rWTBCdFdvSjdqYnllSmJRVmZl?=
 =?utf-8?B?WlUza2ljUlI3bk9hamY0VVFsb0Jsd053aW8yMHFMQmVrQi80YXV0RkFCb211?=
 =?utf-8?B?azZJOVpYUHdUVkN1c2liaGFlUVA4UnJiQ0Ezc0RSTGxUM2Q0UjhPNGoxaFBF?=
 =?utf-8?B?VzFrNWJjWWRIQ3BVMVdBbnE2ODRaYzNMQURFM3BXNU1pdFc5cVNNSFVkUUxS?=
 =?utf-8?B?aG5MUHUxN1BPa3pMa3dIZGJ4MkNMR3ozTnVTUEFSYXNYRDlpdkVtQ0xKTGJ5?=
 =?utf-8?B?SEE1VFlKY05GWEgzdGk2dWpJdEdDendDbHhZenBKclVVa1JyVnZvNHpjc0lH?=
 =?utf-8?B?V2JtclZpT2MwcU9HbmlRb1Avc3F1M0dacFBmOVkvUXZpbEkvK2tHRlJYSXAx?=
 =?utf-8?B?U1pSWVZHNVBPR1RFK0J4TmYzVHFHdVRMS0NHdzUzUUhpNSt1ZmpVSWw0d0Rp?=
 =?utf-8?B?bitNZHJTQXBKb1F6VVQwemx5amtURUhzQVQ2b0NWS0Z1UzkvS3c0WFRqT2RE?=
 =?utf-8?B?dUtlWVBIeGZHWU92TTBGSFZ3R1hnVTZHOEphZk9qTjV6REdNZGpoU1NhUFEx?=
 =?utf-8?B?ZWhnYWwzQ0FBOHVWd3ptcEk3TVR5MnA5bEdCd0g4UEhLSHhPTGxwZ0ZHdmtu?=
 =?utf-8?B?Tlc1V01RQmJ3MkVFb1VEMEJKNjY0ei9vTDF2Q0oybDIzVkV1ZXFVQWJPeWQv?=
 =?utf-8?B?YTluSzZIWC9TMTBNZWxDY2ZHeEMraDlaOUY3MlNnNzBDdEZPT1RjdUlxRVhY?=
 =?utf-8?B?ditNT09yQUkvRU40UVNYV3VpOFprWnAzNGU1YWQxUkEreXBwTHQvQ2JaeFJq?=
 =?utf-8?B?U0FFVy9lV3BOa3ZaU215aVB3Tk00Nk9tRW9xQ3pETVVHR21zQS9MWEdHWS84?=
 =?utf-8?B?VnFud0IyMXpxZXR6TS9kVjUzbm4vNHZ5V2Z3eURUdjgwNnBHSFBZdDV4ZGc3?=
 =?utf-8?B?VzgwTjdITzhSczRZN1RWc3hVaVd3Yi9lYW5SNm1QeUFRR09CZlpkbU5XcExp?=
 =?utf-8?B?RFYxT2pxVngwTkZhTGFNalpNWTkwdTVWeDJOK2xsemJ3OHozWUUyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0533687a-d0cc-4f6e-55d5-08de6272cf51
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:50:37.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kN2BeTL3dC+mnSVEY9YEsUAzv4vsnTYPFOVOHL58GmZDSyJLn0ehdcZI2Af4C8mPuDyaadCQpes0D1PmHpCR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A0AACCE6F9
X-Rspamd-Action: no action

On Wed, Nov 12, 2025 at 04:53:27PM +0100, Jan Beulich wrote:
> cpumask_var_t can resolve to a pointer or to an array. While the pointer
> typically is allocated once for a CPU and then only read (i.e. wants to be
> marked read-mostly), the same isn't necessarily true for the array case.
> There things depend on how the variable is actually used. cpu_core_mask
> and cpu_sibling_mask (which all architectures have inherited from x86,
> which in turn is possibly wrong) are altered only as CPUs are brought up
> or down, so may remain uniformly read-mostly. Other (x86-only) instances
> want to change, to avoid disturbing adjacent read-mostly data.
> 
> While doing the x86 adjustment, also do one in the opposite direction,
> i.e. where there was no read-mostly annotation when it is applicable in
> the "pointer" case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Really in the pointer case it would be nice if the allocations could then
> also come from "read-mostly" space.

Hm, I guess for some of them yes, it would make sense to come from
__read_mostly space, but would require passing an extra parameter to
the DEFINE_ helper? Or introduce another variant.

Thanks, Roger.

