Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88491757C16
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565175.883083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3l-0002Kv-Lq; Tue, 18 Jul 2023 12:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565175.883083; Tue, 18 Jul 2023 12:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3l-0002Ii-IR; Tue, 18 Jul 2023 12:44:09 +0000
Received: by outflank-mailman (input) for mailman id 565175;
 Tue, 18 Jul 2023 12:44:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk3j-0002IO-Gl
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6cd3c83-2568-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 14:44:05 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:44:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5317.namprd03.prod.outlook.com (2603:10b6:610:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 12:44:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:44:00 +0000
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
X-Inumbo-ID: c6cd3c83-2568-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=fcX1i0yf1nk6ewWn6P+aoOiC71E0Ma4dunC5WfGx96k=;
  b=MvFe/c78IKY6NWpvwwK6XYsaoR5Vx3NficYxOpDMXWX45AGINu1ZgIfh
   rHH4gKvYpF6Z+FVLEJsNfRSqeUWzaYYxM6y9W15sHmcJqDX4Qp44DhT+x
   nZ7qe5TchMhICDOFU9DTFoxN42+OXG+THR++n81R+fDvKp+ANVH/cY9kJ
   4=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 116465646
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fqpdqqsqGRIxIrdJrY+KbNXcEOfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKTzSaKyDZzGneY9xbI3ioEMBvJ+Bxt81Sgo++y1gFXgb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACHxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJgokaymF3dKM7JWjaet12e18IerMI9ZK0p1g5Wmx4fcOZ7nmG/mPwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/60b4G9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdxOSuDmqqACbFu7wWtIOURIdGWAuuCo2kS7ZPUOM
 xQp0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0qTSs45SfHuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:N76fK6r4a+JS3Iafiq6EnAwaV5rbeYIsimQD101hICG9Evb0qy
 nOpoV96faQslwssR4b9uxoVJPvfZqYz+8X3WBzB8bHYOCFgguVxehZhOOP/9SjIVydygc078
 xdmsNFebjN5DZB7PoT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-Talos-CUID: 9a23:Iixw9W5Y6u3z5CICmtss+nQ9H/kjKE3n4FDIAE2hVk82RZ6yVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AXEUUWAxCR5ltMNzNMB+y2KLIEwKaqKOpU3FUz7Q?=
 =?us-ascii?q?4gNKdJHx6Pgi63Szvf6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="116465646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il78Ji7u5ABSPTwNDiuFrsYmbuol6Op13GhmYSQoFlRLaWkKP/BJNqDjbWq4jTDtPLzL+rqOI1PhgFBi8uNf69dAFbF3Bj8DLxSXVd2kX/bCabjxoGK3IaV6JH88bB2RXPgkWHzQHSrLJVswg56wiXpFhtZv8VXJayf9m7N1iA8UxF5b4zo98zOrhwm23hqGd0/Ood5izZHuH/oegZv+/nAE2JqyXcTvOg0wh1piL0ZofzYyhwGuEnvrJmuwqF9KcS/KPVLyBWbi2o8wn9mHDG4sco1FnJ0GnMSZwaVQS8OlyWkqsJQVk/GUWIxoKaGgIQRHO4jWwZqgLlOSWiqkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lDf3HGgdgOwPdxea2uOADARo6YV2zcr4Bg6cHDoLRU=;
 b=RoJRwD+pqXbg73q5SZWIXIhhNd7pQxmQbFxNfQ/1+GUl/78PrypeopXm44krwTOD1OsX6l4C7o3Ed9cYn7PFXxtr+zPVYmzDMYymbEAlHZO113qkKXE7rk/+k+7yUY27oZ7znb43x31NoZ+0Ji9ReOldUz+lh+2nUmpiRNumoo63hKqBVUdZFkXw3ilHZ86tAIUV7VHXVNoTuY3zrfQ31/fvt5hleqIYleQKx4SHatyO3o7cRfCqEcOWgLI/fTASi0Tp1qjznHa6xegV3kFBiqfQmWkX2UxD8MtnOldFUq6AgqVG5SrJJiDRTQaiQqexiB/76Z6AE2JiNgmq5Cushw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lDf3HGgdgOwPdxea2uOADARo6YV2zcr4Bg6cHDoLRU=;
 b=FWB8OfmOwMZ47Wlj5b8UsmAFh2e3JojltKFZQUuXQX6rvoIPHxQWLgca7B7TWZnTAU+UpqZSt974VQtDMKYN88xzDAtY8QSsre8JabUMA4JOQubsQZBSaXmcr9osjmKk9aajtC1hynnfDFmIyYtt7//hmbqL1+1RpSg49HtOU0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/5] x86/ioapic: RTE modifications must use ioapic_write_entry
Date: Tue, 18 Jul 2023 14:43:31 +0200
Message-ID: <20230718124334.36548-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718124334.36548-1-roger.pau@citrix.com>
References: <20230718124334.36548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: e3760484-2356-4757-eb9c-08db878ca8f1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRv8nrwCb8tHYmK8cwbPgMw/LhhluD1XynxsVaJffOuca6vtQUkc9PLNIieMBo2zVvaSOqfG+pZS3c7a0lQ1Kw4QRyii3A2kwSNOe/9kjEDlQrmJJKMzfiuqib40q5/RHFYiiYHra97Gp1WnhzkuvZWWrUAtWEcHgc9yBDfRSwKU3FJTsw/s1WGcaB2PEmia5Ky8n8ofynM+gplFQqs+P6xs0FukUNRdC4inVNxaGW75YiJb7jKr5YMmqfbb+NlOc2CdEVpgIJefAsClJVg8jPUw3arRIrY5mFf22jU9HmTPYRIjebTsJW5jJGnxMDK71LznL3sb2lZmeNVoeZmn6WFuIGshXRjKb8HqinmZzZ8FdAUqOk5D3LdXDDD4Esl51VIpb5ObWmc4VkXltAahRgr9mJCjYSnYvDR/5LECBbFQXuJ+T0buzMC5cbemGfyUUHbnQx/Tv/srMsX1bCuMaYHSaP6T5DoBPlBq/xNLWxL7s/XQWq2vxxGoz8dwF/JNgwQO5LGwQbEwnntF7X18lpNoZIfh+YNYgsfVsHlxtT4T3mobQQoYwLlh8+7Xrl2j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(86362001)(2906002)(36756003)(186003)(6512007)(38100700002)(83380400001)(6506007)(1076003)(26005)(54906003)(82960400001)(6486002)(6666004)(4326008)(6916009)(66556008)(66476007)(2616005)(66946007)(316002)(8676002)(478600001)(8936002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmxBR1Rwall3Z2Yrd2ZBQlFqdjM3WTlHcEhLb0FEL00xTjFPaE04NklwL1VM?=
 =?utf-8?B?d0V1MFVMdGIwOVRYWGdNZFJMSzlFcGxOZmxlRzFmTHVmRUtvczJzcmVRL29u?=
 =?utf-8?B?ZnM3Vmp2SFdqVVdHSXZFdDhCR3ZQVk5TV1BzbmpPa0E0WHNtWW5UbkRvdHhs?=
 =?utf-8?B?Zkx5R2U5M0NLOG5QTmdDVXNlemxtTHNFd0l1dzZiTVdnMno5OUNjbzU2cXp0?=
 =?utf-8?B?Zm1HeisxV3F5cjl1R1ZCVGpSU0pELzdneExwdVB1ZjR1MjhESDRVM3U1WFEv?=
 =?utf-8?B?QUZtQVZIS0lGWVpRYi9lbGUwdkFIbWdMWS9Yb3plRE5OM2tvd3NOSVhnWC9s?=
 =?utf-8?B?WDV5NmQ1L1o4cnVHaE5IeVhFTGZvMkFNSEprOUhMa0tLYzhGYWxsWXl3Mkxo?=
 =?utf-8?B?aFpWUUhxaFpJNjBhTWZxTyttSmVLZTJiaE41TFhwcXhJMytrVlloS1pRWDZN?=
 =?utf-8?B?UndQZVVPbFM5SEllaGliVHR5NkpQYmlNMWtzUWV1SDNWdXdUclFzVURrcjlJ?=
 =?utf-8?B?OEVoUU1lQUV3VGwvM2IyUXZicjVCM0pRbytSWm02YVhwQ3JENEhoZGlYTWlx?=
 =?utf-8?B?Kzlmd1VTQmV5dFVaSS9RRlNzWm5PbUVRNWZhMEZ4ODRRSTI1MGVtME1DOERt?=
 =?utf-8?B?K3JjMHAyQ3c1b2NDQnViMUdqckJvZUNNYS9BRlJvNmpRNjM2cGd6MzBNZlNK?=
 =?utf-8?B?aGZwRTNqM1VKbGNWR3NZQWVRYTA2c0FoL25SYVlWZkQyeDBCL1lDWTk2dnQw?=
 =?utf-8?B?N2NaV2QxZExKSzVZbWtqS3I1SHY1NkdEZC9tazRqVDVEd3RtQ2NqRVNnTm9P?=
 =?utf-8?B?aGRDK0pZTldnakFmdEMxckMrVEh1enM2WGpTdER2MXRFc3FKRk0rS0N1MU5y?=
 =?utf-8?B?TmVCYzdQNGQza3JPYU13b2xGRWtFZGpGMDg0T1JtQkZFUktVY00yTytSUEdo?=
 =?utf-8?B?T0NVRVI3ZTYzWThQek9WVGVtUmdkbzVrM3BUNnFZYTRkZDBKREpWV2pvVysr?=
 =?utf-8?B?NGk3NWcvNUJ2WWxxdS9henlId2oxWWN6a2lkYUhRcG9Gc0ZHdDlyUHQrc3Bw?=
 =?utf-8?B?NnlYZlk2T0o2YjZuNHdYUDIyZnlQRlhuVVpnMVFaNnNNOGphYXZrOTcwUUFQ?=
 =?utf-8?B?L1hDYXp1Nkp3dUV2bENscytqNDRpc0djekRuMXh6ak5jalJkSnowNmFDWWJ0?=
 =?utf-8?B?ZEc0WVJHOG1KZTBCbHk3Ulo2bGpEUDhwdFI0M1I5Y2pvSWVIN1E4N29LR1hn?=
 =?utf-8?B?amwyUjV0MFVWTzZGWjY1RTFmSFprSitGUGlkcEV0Y3R1OFBRRDhUOVQzZFpF?=
 =?utf-8?B?TXp1RzZpb0pnREU2OHBWR3YrNG5CbWFzaGUvcG5Dc1dUUDNkdnlQL3Rkc0Vr?=
 =?utf-8?B?ZVZzNUFQMWovREtMQmpBeEJrbzN2bllLSjVZSnRzeTNVY0lJNjZyN08vd1Zs?=
 =?utf-8?B?NEpRekxVd1ZyeWFkdEZFNTlIUXY3bjRka3pnZXpIQ1lMRUlCaTNkUmFQYko3?=
 =?utf-8?B?WURSbTNxTlIvZENSdGtpeGRnMHljSkxoTFBMaEROWGFheVZobVlFR3AzcC8w?=
 =?utf-8?B?anJMYThvdktMTE5VSklaTGZaS0dPbEVabkJKMjIwQUM3YkdnK05XK29TMXpa?=
 =?utf-8?B?TjR0YlFpR080aGZHT1pmMFFGYzZqVjFoR1BCaU8zR0ZPdTkzZ1V1RlV5MGF2?=
 =?utf-8?B?WU9aOUpvNTlhQkduZVJWWVNmbmUxSkxkdG1mNmQ0bGtGQllNbjJNT2NSajQ1?=
 =?utf-8?B?UDd1YUR1T1NTVFh1d2VKQWJMeWlGTjU1WXRFd1puOHFUays5cU1MV0NiTGVT?=
 =?utf-8?B?WDVORUExOTU3dVcwSkZKWTNEQmtUdjhUUXBEd0s2NUtZTHpDclZ3WTEzUE5P?=
 =?utf-8?B?Mi85b1UxYVJXWWJFOVFSVmxwakJaVUVYTEhGTmY1UHNEMWM2T0VzdWNwSmNL?=
 =?utf-8?B?d1VYWVh5ZUtmL3hWcm5hbzgyWmVSY29CS1Y2UXk5ZFVjTmRWdzg5bEhyd0xj?=
 =?utf-8?B?L011K0d6SWJ4U0JLTlp5VithQWNRZEk4Wml1RVBwUkhnSkdpbktlcUI5R1JV?=
 =?utf-8?B?dnExNGVoa1ordWJtazlNODFtdFFlbStnZ1FQSHBqOXdacnNJWjZXbnVVcTJX?=
 =?utf-8?B?VFBESk9TdmI2b01yN2ZtQ0VuWFZJOUFuVkduQ29MVFpXNHRkd2llUDNJOEc5?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ypfeDCWk7wvBc3oY3QvlBEeTMlfufMX9ZKyGu7ALcnSyHeeDWeXEwVSR8crVirvYBNNGxhT/mdXASshbJhXHSfLA2DUdB0eBdmjScFUT/EeUzjqfynjauUMVvivddawFjo/hn5n8nWC74QkkPLDzdydKIv6eyofbAoIPwqvdiadmoLnMZ8FPPquPdJd3/+VnFAgTqkJ9ZuyD4PM7cucDkSszBsDV3gr41CM2JTGAYqenxv4JG/2EHjHWDkskSRO7MJIm/YYX/QGtN9jMr+dvp7i1HWLVHJjvQatZQIw/gwrzxZvwwuXla521B/dI7DTf8nLdxBNUpAipG4luGke9NhKLKk0biaTUi+F75QLK77muafQgBYowUl0IYUDRohsSLpXbawHHmKvclEalEpMsc0x1YBNntp7AK0VJPQTE/wYRJ32GMKmnfzBP87Wlr6O2GH87KNof1cmBqh7Rcjs/TMNbHD8AMeaZ6Xwl6pukAHGaqGQN8CsbRXDAgn7ReurKwKaP32x0aMxOOzelpaxqgg6NrhzBeY83EJn3ECNhCCzXibNtLOSaZNWd3OKDBMqjOv1ZlfFt7PFDB3S2nGPBBQnO1dLd1UUG/4koj43Y7zWlyOS9S76OGVP1TGbmlZWGYzc9HApKxIrquDjnEXc63eaZObxaSfZ6oOgqb0CUPdh7MIgoMpoixoatqxr3TN9oeUSwEd3ruyr1jjo4m3IVZyiYf7FNTZZzfZRvnmdusYalyddqqhhimbUY3Jh4i129FDfwQhjmxXebHTQOzg7G//jsHoaXmXqp5+UcYZ3cv+sMcXKFTStezu52APuo7jgaGU1skaksPj2tUkhAAlyXaQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3760484-2356-4757-eb9c-08db878ca8f1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:44:00.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00YNS6VH3gkg/mAnZGqYwRn7wgmaSCdULAusWXkSMfZzYplvkK5eykPtzbA+3/7ie8PN71itYAX4dMs8iZ6q2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5317

Do not allow to write to RTE registers using io_apic_write and instead
require changes to RTE to be performed using ioapic_write_entry.

This is in preparation for passing the full contents of the RTE to the
IOMMU interrupt remapping handlers, so remapping entries for IO-APIC
RTEs can be updated atomically when possible.

While immediately this commit might expand the number of MMIO accesses
in order to update an IO-APIC RTE, further changes will benefit from
getting the full RTE value passed to the IOMMU handlers, as the logic
is greatly simplified when the IOMMU handlers can get the complete RTE
value in one go.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Reinstate io_apic_modify().
 - Expand commit message.
---
 xen/arch/x86/include/asm/io_apic.h       |  8 ++---
 xen/arch/x86/io_apic.c                   | 37 ++++++++++++------------
 xen/drivers/passthrough/amd/iommu_intr.c |  6 ----
 3 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 4c4777b68a51..9165da2281ae 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -162,8 +162,8 @@ static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned
 
 static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
+    /* RTE writes must use ioapic_write_entry. */
+    BUG_ON(reg >= 0x10);
     __io_apic_write(apic, reg, value);
 }
 
@@ -173,8 +173,8 @@ static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned i
  */
 static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
+    /* RTE writes must use ioapic_write_entry. */
+    BUG_ON(reg >= 0x10);
     *(IO_APIC_BASE(apic) + 4) = value;
 }
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index aada2ef96c62..85b4b4c6bc98 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -269,15 +269,15 @@ void __ioapic_write_entry(
 {
     union entry_union eu = { .entry = e };
 
-    if ( raw )
+    if ( raw || !iommu_intremap )
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
     {
-        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
-        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
+        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
     }
 }
 
@@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
                                unsigned int disable)
 {
     struct irq_pin_list *entry = irq_2_pin + irq;
-    unsigned int pin, reg;
 
     for (;;) {
-        pin = entry->pin;
+        unsigned int pin = entry->pin;
+        struct IO_APIC_route_entry rte;
+
         if (pin == -1)
             break;
-        reg = io_apic_read(entry->apic, 0x10 + pin*2);
-        reg &= ~disable;
-        reg |= enable;
-        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
+        rte = __ioapic_read_entry(entry->apic, pin, false);
+        rte.raw &= ~(uint64_t)disable;
+        rte.raw |= enable;
+        __ioapic_write_entry(entry->apic, pin, false, rte);
         if (!entry->next)
             break;
         entry = irq_2_pin + entry->next;
@@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
             dest = SET_APIC_LOGICAL_ID(dest);
         entry = irq_2_pin + irq;
         for (;;) {
-            unsigned int data;
+            struct IO_APIC_route_entry rte;
+
             pin = entry->pin;
             if (pin == -1)
                 break;
 
-            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
-            data = io_apic_read(entry->apic, 0x10 + pin*2);
-            data &= ~IO_APIC_REDIR_VECTOR_MASK;
-            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
-            io_apic_modify(entry->apic, 0x10 + pin*2, data);
+            rte = __ioapic_read_entry(entry->apic, pin, false);
+            rte.dest.dest32 = dest;
+            rte.vector = desc->arch.vector;
+            __ioapic_write_entry(entry->apic, pin, false, rte);
 
             if (!entry->next)
                 break;
@@ -2127,10 +2128,8 @@ void ioapic_resume(void)
             reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
             __io_apic_write(apic, 0, reg_00.raw);
         }
-        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++) {
-            __io_apic_write(apic, 0x11+2*i, *(((int *)entry)+1));
-            __io_apic_write(apic, 0x10+2*i, *(((int *)entry)+0));
-        }
+        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++)
+            __ioapic_write_entry(apic, i, true, *entry);
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9e6be3be3515..f32c418a7e49 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -361,12 +361,6 @@ void cf_check amd_iommu_ioapic_update_ire(
     struct amd_iommu *iommu;
     unsigned int idx;
 
-    if ( !iommu_intremap )
-    {
-        __io_apic_write(apic, reg, value);
-        return;
-    }
-
     idx = ioapic_id_to_index(IO_APIC_ID(apic));
     if ( idx == MAX_IO_APICS )
         return;
-- 
2.41.0


