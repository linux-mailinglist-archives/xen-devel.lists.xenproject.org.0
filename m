Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30CA710698
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 09:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539324.840091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25f8-0003YU-3T; Thu, 25 May 2023 07:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539324.840091; Thu, 25 May 2023 07:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25f8-0003W0-0j; Thu, 25 May 2023 07:45:30 +0000
Received: by outflank-mailman (input) for mailman id 539324;
 Thu, 25 May 2023 07:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q25f7-0003Vu-2d
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 07:45:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c241a21-fad0-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 09:45:27 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 03:45:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7424.namprd03.prod.outlook.com (2603:10b6:408:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 07:45:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 07:45:20 +0000
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
X-Inumbo-ID: 1c241a21-fad0-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685000727;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BA5WCsCObzoYz5f0dsxhE66miKi5UEwOUHsoAw062Bg=;
  b=CkRVCBFQg7ZlkmlIFtQCGQlwFSC1tS8SV3LQodQ6FugpnPxHHbcq5wVV
   KfdIgqy285CahA1xKMC+aPF/ICqR1AtjycnotewVFOrvk6TJAZauNHBQ4
   nWfdau/lU1B1EeVo0e5Ly1AZjm3pwevKpD8w4pgjX8aiqmy8LA1Wxtcx/
   s=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 110217133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BZjh+qLvr6pvrPVSFE+R+ZQlxSXFcZb7ZxGr2PjKsXjdYENSgTwGn
 TRMCmvUO6mCMWr2fd1wbo/npkwDvMeDzYBiHgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZiPawjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4wHHsX5
 cUHDwsSVRfcnu+TxKLgQOVj05FLwMnDZOvzu1lG5BSBUbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13rWWwnqgA+r+EpWm2uxNp1O+7VdIKzQTe1WA+92/lX+xDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5YQs1BTGS44/FLbv14OlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:8kkUGKCnE1EeOvzlHehvsseALOsnbusQ8zAXPhhKOG9omwmj5r
 STdPRy726OtN9jYgB0pTngAtjVfZq4z/VICOYqTMiftWXdyRKVxcRZnPvfKl7bamHDH4xmpN
 ldmsFFYbWbYTca7beckW+F+pQbsai6GciT9KnjJhxWPHtXgtRbnntE43GgYzBLrWd9dOIE/a
 6nl4t6jgvlVWUca8y6AnUffu7YutHHrpLpZhYaGwUq8k2rgSmz4LD3KgOf1BsFST9DqI1Skl
 TtokjU96+nu/G+xgT903bJ75NKsNH9yt1Fbfb87vQ9G3HBmwysbIRkV6ajuCkvoOazzV42nN
 7Hs34bTqFOwkKUUnC+pBPs3wX66S0p+m/GwUKVhnHyyPaJJg7SRvAxwr6wvXPimgcdVHwW6s
 929lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nvf8Pg2dZWY4+bqYUiYAE5ktaHLoJASq/sekcYb
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDblketteT2z12mmk860cD3sQQkloJ6Zp4YZhZ4O
 bvNLhuidh1P4krRJM4IN1Ebdq8C2TLTx6JGGWOIW7/HKVCAH7Jo46f2sR82An/EqZn8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRzw18B3/fFCy+PBbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmBXfyGLxOwxb1V/BpWCYjufUuy4cGsm+105/2w8zRx7bmmc/oVeHQ+OMfKz/C6n
 hqZkm7GCwP1DHlKy/FaN64YQKsRqW1x+MDLEHgxZlk9GDWXrc88DT9uW7Jpf1jYQcyx5DeXH
 EOZY8PwZnL4VVfCw7zni9U0u00NDcf3F1mOEk69zPj5yjPAOU+UpOkCDhvNVO8V2hCc/8=
X-Talos-CUID: 9a23:AJ7SpmOoTDQTGu5DHzR9rV4tBecebUbak27dBkuoUmxlR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AfhoEoQxWOd0VeqawgYwnvrzwUEWaqLqCGmcqn7g?=
 =?us-ascii?q?tgJKnHCleNQzHqDKoc4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="110217133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYtzxjn+y3dz/Nou8ba4tS8VnqlEIPt3swNz7ZU4YG2pVCXydRmgxWahRPo4ec2yF93sSaiGIs94HccxDo6XUB+HXrP1h1sLBbTqt+1kqALIA/IANI86+ZrbXPwCobvBOfOF9pkj63qEAl3V3nu/HSCuulDYIwb4D7pxxvjzGZGYTEOo6qtgotZ01W6m1PouoLqfXVdBW1VFgx7VnOdcvsllRmG7gimdIh0xVGxyVUSmZHGgrqBTIHNDIO6QQf60deTUjqAEfNuRHI/D1rWqLMc2OKpCRvKFjqBkVNHsVAdjX+GhSia2CcI1bdbRl0j5gucRsCPU+3RrMvrYO1XiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJvHevO7biyUOSdytZ8ksfwQqaBAWDYcktoOqdcqjiM=;
 b=Xhqc+2DfRkKXKiMV1ExxN2uNF7qwof3gt6nJSc6N88Eyj4SGymUR0RMZEaRkVy2vZF3nAVjmYhednBxUicfJrKpTJSVdkCk8UOpo8Vltf4mkuVXZp7fleYaWGWWagK5VcO16MfgKokHgWQSUPKblDVrkXOVY+raQBvL2/Q2i0ZptyocM1Im5xl2GnUM3cVDklxmXiLwNVr5GMPGBURJh2ytJN9VeYTRSFqy6k6yDYU6btPjhZGEt9IaFOwJgy8GUMkmVUb33e8xItBDcojARhpr4loib/YvahQ9Ij4ohDpMpdah4LWEHufKCo5eVooCQZ1yDhhRyTm+d1HXhobGBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJvHevO7biyUOSdytZ8ksfwQqaBAWDYcktoOqdcqjiM=;
 b=Xi5qq/s4p5Etgv2wZ8ZNNzFQGmmY2+ctgp0cIk4COTcyUMY+Y0mluvL5W4CuPzOTqODMlruQjz8MS6xwHKWKKvghFsc5Ak3k8p/sLcreqelPtLKE071+s/yhqS5/ejLlIlAv92RKwpDI2Mh3dAnpaweVz0jgrHovLUx13tv2ZTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 09:45:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] iommu/vtd: fix address translation for superpages
Message-ID: <ZG8SCgaXxY07daEf@Air-de-Roger>
References: <20230524152208.18302-1-roger.pau@citrix.com>
 <2099b1b9-e3c3-aae2-351e-cbf067dc6ecc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2099b1b9-e3c3-aae2-351e-cbf067dc6ecc@suse.com>
X-ClientProxiedBy: LO2P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: c61dd321-defc-406b-48ae-08db5cf3fd2f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTYR0be/E8p2AGNXsbPPeAOdF7fW8W8sjGGNEeZ933JOv+b/pIXeMzCrTGmBDewr4nZS+lP10sP2wXCIujaea1KpK/DsfvKGc3tgBGN0bHM7vimh81q3IcTfSf57oHpzutS13fz1PJjQbVM4VyIlk8K1Ft83qX/DjQWV633HBe7hitG8XgILnC4+kfIMAaLrY6fTxgmXNMVvGDoOIHKalhFP3L1baId0DCmBg2bU/b+V4j369V0diAUR9DSO/soIKhMbf82N70vMNXGFIFp3LwoRbD/97Pf1OT7INw9JZNXebcaZ+8j8nCOYk6yXU5U5s+pIVcKtUGqQxvHklhiQtDpaevc0vVeBkbmxCBrSXz7ayNgVGxeoia0PhP/99hksQYiDh7RjZHiMK1JjZPlaxOU1RQAwBw3p8i5C4JJE3ctT8DJP7gUbZcJlmLDbKsWPEmoRnNoz6YWCfeeDkP4z8RQ7/SKApgGv0+MOMBm0UjxMxjSRTwYaQn01MCT5N7BQZU7phT+nXIxCMRTtmJfORXs3ovNad2bbXSiWDnElONhsfuHJziAB0zOix0O1nNod
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(66476007)(186003)(83380400001)(2906002)(6916009)(41300700001)(66946007)(66556008)(4326008)(316002)(6666004)(478600001)(53546011)(26005)(5660300002)(6512007)(9686003)(6506007)(8936002)(8676002)(38100700002)(82960400001)(85182001)(86362001)(33716001)(6486002)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW5hc1J4bUczbDhXL1ByU0JreFMzSlpvOWdOb1JLZjRwOEFIc3RaTUh3ditw?=
 =?utf-8?B?emxxN2hNM2FYZ3UvZnQ4Yk1qaDZBVWt4QjhrMjM3QW53S1BIK25QREVRRW5y?=
 =?utf-8?B?cVFRRGg5K1JmL0l2eEhoZ2J3aW5FZjRZbjRxRFFNWXNoYmhiMXYxaDQyYUlz?=
 =?utf-8?B?d1lNb3E2ZWptdGRDTFNybWtPaWhEK2YvcGFlanhFMmJPcXJRQkkzMFlFa05E?=
 =?utf-8?B?UENnbktlK0NPMEhJYlp5azZ0Z0l4RzFnMGt5Um9BaWNDeVRpMkFQY0ZUQk9L?=
 =?utf-8?B?V0pDOFIvZW9GNUZDclFKQVF5dE5HRTBTVjlRQUhEblh4eFFDZTdQRnA2MFlJ?=
 =?utf-8?B?RmZ3RXMyaS9Mdk5zWkRlN0d1MkU5WkEwQ0ZKOFJyODFDVWtkQTFhU3BBWG5I?=
 =?utf-8?B?YmtJU05ra29mTDlwcVZ5UXdNdXRGWllYUVM2SzhRU2RLTWZTNXJnVW55ekR1?=
 =?utf-8?B?ODQycGM1VHJpd3lYL2Fla01kdk9ma0M5WEtrZnYxUXJvMm5vMzQyenpnMmkx?=
 =?utf-8?B?QWV3Rzh2Y051NFYvNVIwcEJkSzlpZ3E5N1hsbUlkditQSjZmMWt1dGxjbTFz?=
 =?utf-8?B?TDAwSmE4d21Yc1k2R2cwQ09RcjBNSjNiN2tSK2RPbldOS280cDNrOEFrOTJw?=
 =?utf-8?B?cE5KcTNXTEgxTG1WVFZhZ2lscGN1UExWQSt0dVVhRTM3eXFFVXc2aVRrNXpJ?=
 =?utf-8?B?VktuMkhvMXFlMDNPQ09zVkYyQW91cStOOVNUYXZVT3N0NjBISXNZRVBrQjd3?=
 =?utf-8?B?eGpDRlhmbEVTSG00dmxXTjd2MjI5Z1d5dFRLa1dhWmhHQXVZTXZXN1F4OG13?=
 =?utf-8?B?T0dhYjZLSWNXZTFZZHQ3bDhoNlc0bEFLNk4xSU95eSt6MjZtMXZlTXlzZmJF?=
 =?utf-8?B?VnVYRWFJOHE5ZU5IRWJsdm9QUUtSaXU0cGJySFJoOEVZWWhvQ1hoVUZFbktK?=
 =?utf-8?B?Vk9KM3hqMG1ZNThIeUNMdnFTRlA1YVk0ekdMQmdEeHIxNUtTWkR0RmNzenov?=
 =?utf-8?B?S2tHS2JEUlNVdUdQWGlNQmlqbzl0cENsa1FoR0hmejdkOEpIMEhzbjNnbTdH?=
 =?utf-8?B?bW54VUxqTzIxcnc4WndMZjgvWE1BalVhS25CaDBObEdwM0taYjFxYTQxT0s3?=
 =?utf-8?B?KzIwck5vbGdqMWpZbFVVVlduUDRLRmh1eHpkZkh0NDhFK1dtN3gvK2ZncGdT?=
 =?utf-8?B?bkV6YWJUMnp6N1ZsalRUTUExT2d3aG5aUjJNL2xIRHVHWC9UdHl6bXFOUFdM?=
 =?utf-8?B?VnR6WHBZUGRudWZaRTJOV1JobXcvOTcwSG1vZ2FFd0RNMVROTVZZaDZ4VllM?=
 =?utf-8?B?MXVFcFY4MEZBV2tkVFZkK2NLelBqZG12U1pIbG92aVBxVTIvRWhtNXJZMlZS?=
 =?utf-8?B?ejMyWkNhZTBJTWtJRXRIVng0dFhvaDJXUlVWR01IWFJPTWFyRlhwRGl5Yldi?=
 =?utf-8?B?bFNYa1hGS05TcTZzL0tjOTBBTEx3QU9aL0MzVFZRUEcwVWlCVk9UcER0TUJJ?=
 =?utf-8?B?aldua2s5SkdLVDZEQXVMbGx0VGVVb2ZMaVZTa1RyN0wxVkJwaUpPZHErVm85?=
 =?utf-8?B?NlQ1RUpkazNieEdtajRiT0N2SkxJOGp3K1ZwN3JBSG1OdUZQREVtWkVXTzlT?=
 =?utf-8?B?bys3bElVaDMrRXdGS1VXWk5uOGxEWDNGR2V6ZWZwaGtRLzhiVnpCNUNtbjd0?=
 =?utf-8?B?dUM0SThtMGNxOU5jTWw3SVVDdzdpTGlEOUpxM2F5SDhpcGFDbW10K0pVczRO?=
 =?utf-8?B?cEtnNVIxQkVFRDk1ZVFoeW5kdVUzYUI1M2llZlNzc2VZWFFoR2hVVmR2ZDVx?=
 =?utf-8?B?MDhNT1ltYnRzUmZ1K0RHVk44UTBGVzVuVnFMYWt3bnI5VDVPSG5nc1h2UUlQ?=
 =?utf-8?B?UDhCZ3BpcmhOMFFYS0t6TG1JaXlXRzdJRXpBcFJoTzlJTzhWcHdtNXB3TFp3?=
 =?utf-8?B?UmxsSC9PYlloU3M4RDFxYzFaMWtCakZCbXArMWtza05ZUU15dUVlUEF1WDNZ?=
 =?utf-8?B?ano4V1BrZGRLdVMxdnBKWkZaM3lxa21ITk1hSWR1WXNkMmtNVG55c2tIM2pr?=
 =?utf-8?B?bXV1UDRjSVEzcGhrN1Q2QmtjdzZKeXZnUnd1eWFqMmJ1Rm1zNnQ2ZS9lN3FS?=
 =?utf-8?B?M2kzeVUyVjM3a0VNT09sUTh4TzJxdStldzlTcGdnV0RHZFBxUFZmTmhYNHhu?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iSlVQz0b9yRAHlZYjpZ5YQThn4FVks3Sqr9kyLsjCFHT95WB6c4F/vLnihywogeyCW7oT3Gd2MC4D4arW9Sg/cIESP+CCvArgvykP5jgcKdPHOKvScOSlHKLH1OzJM4X2fgbqONL6iwamZNKWC+SMlO00RQSDdyO7egTd5ZwWZhLkFBHOczbqEmcfFDrfmtY7rm4zgnhFm0BA9snFFryjsnUq+SBMVYIwpmr6JbOYdXAbwhUp/1KdfFTvVIjlJaCYervu0+qm6a21lcZmAU7a8IjCUVTUvQ0bu2G3TPuqucakl7jJj8+gnPxFibqTPIVzPoZGDBN4+Z66VGEiuORXLerMo6/F9r4aL1n4/jfTI7c0jNIZBLbZ5d5IybuSAcCicELDR3N4GOM5wwrh3uE8HXs2SX+XiYO8x12CJec5AvrJFbNtIRwBjgpTMj1c95FDu/g5mGM8sL0/slMwdXm9b+txZ+5vU06dcGu0GKw8ED97AYAN0gNSCl1Uhasm5Czrh9X/WZHuCh2xEtvM2HFQErxjeONM3pux5wW34lB8Yd9TyznogdKw1s3mZ2vnuBndDSpflZeGAxuETKW+dqpV5Kkptu8tQm48GliQcKNDG6nq4bAL2su7l3Q85ZmuOey03jp9GGhHpIW6OiaYR+khlky5TVMioyp8zh4usnmBVmvfregnRkYDq7PLl+W7USMB8ie4uPbcHjXxD+pJAbHo8bcFendkp0RYYAjOXn5aL/Oex9UK168+3HGyWxyakaW15gykpaFQlJ4nvwE9vu9Oe1Y5Z4lITMoURowdKsDEentJtqfKexxrMqFt1NLc2aGDECtvUftEdR8WwVS9z1JVA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61dd321-defc-406b-48ae-08db5cf3fd2f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 07:45:20.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbwmNh6ydPBk0Ku7GYqwj4MS6qDOlDQL+ZtU4GTFdiEBgVE/N8VI8O2ac7VIN9FAzQ8/IPfXAIzfXa2e3kY2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7424

On Wed, May 24, 2023 at 06:11:03PM +0200, Jan Beulich wrote:
> On 24.05.2023 17:22, Roger Pau Monne wrote:
> > When translating an address that falls inside of a superpage in the
> > IOMMU page tables the fetching of the PTE value wasn't masking of the
> > contiguous related data, which caused the returned data to be
> > corrupt as it would contain bits that the caller would interpret as
> > part of the address.
> > 
> > Fix this by masking off the contiguous bits.
> > 
> > Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Just to clarify: The title says superpages and you also only deal with
> superpages. Yet in the earlier discussion I pointed out that the 4k-page
> case looks to also be flawed (I don't think anymore we iterate one too
> many times, but I'm pretty sure the r/w flags are missing in what we
> return to intel_iommu_lookup_page()). Did you convince yourself
> otherwise in the meantime? Or is that going to be a separate change
> (whether by you or someone else, like me)?

Gah no, i did assert that the iterations are OK, but completely forgot
about the r/w bits.

> 
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -368,7 +368,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
> >                   * with the address adjusted to account for the residual of
> >                   * the walk.
> >                   */
> > -                pte_maddr = pte->val +
> > +                pte_maddr = (pte->val & ~DMA_PTE_CONTIG_MASK) +
> 
> While this addresses the problem at hand, wouldn't masking by PADDR_MASK
> be more forward compatible (for whenever another of the high bits gets
> used)?

Right, I've just masked ~DMA_PTE_CONTIG_MASK like it's done below when
splitting a superpage, but for the use case here it does make more
sense to use PADDR_MASK.

Thanks, Roger.

