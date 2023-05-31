Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962A717BF4
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541690.844678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4I9z-0007AZ-9l; Wed, 31 May 2023 09:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541690.844678; Wed, 31 May 2023 09:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4I9z-00078A-6g; Wed, 31 May 2023 09:30:27 +0000
Received: by outflank-mailman (input) for mailman id 541690;
 Wed, 31 May 2023 09:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXUc=BU=citrix.com=prvs=508c705fb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4I9x-000782-FI
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:30:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38b2b4a-ff95-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 11:30:22 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 05:30:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6549.namprd03.prod.outlook.com (2603:10b6:a03:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 09:30:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 09:30:12 +0000
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
X-Inumbo-ID: c38b2b4a-ff95-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685525422;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tnGQqFbHqFqBZJYohXIvt3R+ZeLOuEetwifyQeDdq70=;
  b=VYsTLWP3hZx+B+hzN8ko67zHBYvTOx12RNWFLAam2jyrLSeMcnEdSUgB
   +5tajR4ZA28Dex9wyMkf/sAOzFOsp/+MJj6CdjP3D2lbl6s6tAYvO7CXH
   SUi7MtS11jb/6yqqBQhwKIs2C2SWfCvoQZr1mIu0+unvCr+SoeOJDQZcN
   Q=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 109807238
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WKft76N8P3TcV1DvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUoh1zBWy
 TMaXG2GbPqDN2LyfNokbYzkoR4PuJPcz4djHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5QVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uVTAH1op
 fUXFG5ORA2Hidy5w+KmWPY506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr91reQx3irMG4UPP6856FKhX+L/UcaIRhMR0XrrPOmyWfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHECRA5cud37+ths01TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRP+ZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:ZqlYvKjqivMT+YCfNDEhfEX4InBQXr8ji2hC6mlwRA09TyX+rb
 HMoB1773/JYVkqMk3I9ersBEDiexLhHPxOjrX5VI3KNGLbUQCTQr2Kg7GP/wHd
X-Talos-CUID: 9a23:FM7g52x2MEsaVnN3mdXNBgUXPsE5VC3Uw0uOYGWlDWhXR77FVE2PrfY=
X-Talos-MUID: 9a23:ykUDswRZaUw7ho8dRXSvgCA9FMJK+5+FAWkIy4cY68SOKm9ZbmI=
X-IronPort-AV: E=Sophos;i="6.00,205,1681185600"; 
   d="scan'208";a="109807238"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2MqC909JB7elvqmaS5PusIeaumdobZDGYvk4Q/QM/wfn3aA3nGoVFRxQaNqPXxYUjPSvYNjHQAq5k79dNlh1p+idC3TjD46zeLdQOLxmAO9+7VHxAOT5ff5FJHnsrQ8yNfhtiQVFe055z9AQhTqY5kNP4OC5RIrNzXoWjXt2lB9FgZa+LIpcQQE0DGVRqGVYP6CA6N82w1ISpjfeN3cRgkXaLojOeeyvTr7qtlr53BuxxXA37up852tSLX0945svtNVQKz4R2P7hlNrcjg8uhwYRlTBSKmovc95DfEjeNH2gyMIXTzqloR39AB8q8g9utN/eslaMygS/Xz02RNhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBLde2htW1OSo1rrrW1SClQXxgodJkUXsZlWoE3kYkw=;
 b=Q3pecsBxuGuXcja6Nwnx1Nf+QQ0JURK7o7CkQYYAgCu9xnmyG8tYsd7ckAIDWvQaGWaSrTu24rexip9e6ufJscaxNrOdnS3EFrOb86upBWYfToo/uz1Codq0FkJNrlM5YPsQmaSPUv0BDn3wxdde4GzWzzoNdSzGt7KE7rMzSuYrf86C5563qNyYz4ircAgr3dVN9TqmvkCfhsZH+YwAyVAYdoPq65LBU0A1q5YVw9L1sSeRNJsAnD1HXAqRSgNoKlO1wgoyfpb0Z3ek9nwwJ9ayFmrnGULdzUhvgPeuLBtGGxWV6CxKbOXtTtAsSvfP2CeeWUjPe8VR9k65Hr7buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBLde2htW1OSo1rrrW1SClQXxgodJkUXsZlWoE3kYkw=;
 b=FZPKjuNJWnSGl8UxZVMEqqxACH/TOeSNAYwWBprQTBXqntTI9BNCVHY+1lmfC537pvkYgOA9Wht4woc83JtOwVq0Lw3wp4xzjFQBWYcW4YvboJMO4lgU6oHJRYZX86e+afKSsr/F05D0viw8s8cchEBoKxlW9wDHSRfjQEVXjYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 31 May 2023 11:30:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] multiboot2: parse console= and vga= options when
 setting GOP mode
Message-ID: <ZHcTn9dV0EPGTg6t@Air-de-Roger>
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-3-roger.pau@citrix.com>
 <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
 <ZHYeGOFpAtLnoQf2@Air-de-Roger>
 <96ade9a5-37c9-dd38-cb04-ed0f2c0bbd97@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96ade9a5-37c9-dd38-cb04-ed0f2c0bbd97@suse.com>
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd07882-7f83-4b27-5a61-08db61b9a23b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	djdil9b9fvF8VulYj1smiCSN+wiDVdcplmUnM1In3EVcvUH2k2G0pRKzHtqWMsL5xovuVz9kDLDbl65W45WmnxHThBvaR+q4HJrzI5y6UAwzU+Clp4WZC7b+eYT9kX+ee9QY+hcsj9pHE5D7ATvMbrfAqAY+U/u1wpqURsTi8LRzUuw1qb5UqqvTSepftmFWLB2cmF9PjXgRkj1sqM7cf6nlcDWMpMub5+rdY0At5QFC2NJmQ2ixjQHuSiTw5w7BfksZhf5ghxOdlbZ61VP0xYYA824ERG59U65UEqBlg+zWoIKt8G+SUXZVcZGK14r0xZU2s4GUDXcBT1YmoWQeKytqXAlHKjH7RK8us/xd/yt5rRGHLoWyq4KJpKFfy45XhoSiCOKi4wvUFETRnuQZyrsQDubdFShOvsrEwkmyKB+reCYinhNNM9JUBuR76eKpou2O0ntDLQsnP8TwkKsMtfiIMsX7tDkW7uqQmNBLK5/IctR6BED2DBdml/RY19rjh4VnmorNQIZRg4HvIxfZ+9dug0nKMUrOl8th94FDBg4YTjKqR7nnC9k+zp7n+b6/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(38100700002)(41300700001)(316002)(6512007)(6666004)(82960400001)(6916009)(4326008)(86362001)(2906002)(8936002)(6486002)(8676002)(66946007)(66476007)(9686003)(66556008)(53546011)(54906003)(6506007)(26005)(85182001)(83380400001)(478600001)(33716001)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ci9iL2dGOHgrRFltalRobk90UXZEWFp5RjZvdXgyUnhrWDVGdFFTSWlPYWR4?=
 =?utf-8?B?dzJ2b3gzMUMwQmtlaE1ZZnBFdVYzS0V5a3V4K0wrZVlRY0hHYnVaaHg3Um84?=
 =?utf-8?B?dVFwSVZHemkyaW1qaHpzbU9aUDkrRnBLOE90dHFjUldHYmt3L0U4dWMzSGhs?=
 =?utf-8?B?bHQyMS85K2RZUVF3YTdkME5uSDg4dE9rL0NHR1dFNEl3dG1UYmVOWEpZUWZp?=
 =?utf-8?B?MXlyalVjNzlwSXB3eVF0NE40ZXZ4ZFF6WGI0VVFyWm5BUzRqcGNLQmJILzRU?=
 =?utf-8?B?Z0ZiUm93OWJXSUxOSGJmTWIrTjZOMmFDYlV6aWVsUjdlV1lNVmphN2UzSkI5?=
 =?utf-8?B?c1ZtZ3VFS3ZQbkd2Z2JGcmxQdDVVZlBqaTB1WjlVOUFKcGNaVzBhdXIrVDdr?=
 =?utf-8?B?anY4QU0xSFBOZ3ZacXFhcHZOMGR4R3VBMS9IMHNXUk5BZ2plUjJLQVh2bnZ6?=
 =?utf-8?B?NERjcVpHMmxaVUc0ajVQc2t4LzdHNkp0YzhPMWY0MDNMakxEMTVmZW5hWDBx?=
 =?utf-8?B?Q3dvSTVwWkF1K1dhbVVNbGZ5RmhmYVZNSFZuQUN2QmJVUVQ0UTk2Nzcwd2NG?=
 =?utf-8?B?OXpURGpLd2ZjQTY4bUE0bEJqdUVHRW40VytFUTBFdWN6M2RvWkc1a0xZaGFo?=
 =?utf-8?B?NTMyTFYwRjQwRGdDbGRJaEhkTmhhTFN5MWllUU0rZlpWQlhTbGl0aCtGRVFh?=
 =?utf-8?B?VE0wWkpQVzJ2ajZlRTFOZ2QrUnlublNJeUZYYi83QW01SmdJSUk5QkJZVnpV?=
 =?utf-8?B?YjNiQ1dIZXNxTEV5cHk3NTFLY1FDVXYxVjdrbzNVeGhGa3hCTmh5bnJIdWc3?=
 =?utf-8?B?bzJ3bkIwbDc3VFlzVENxMEdkbE5BUjQzbkszZEw4czRmUXMwTkNSUXhkM2E3?=
 =?utf-8?B?a291ZEs4OWNKMXhvZ005WGVIRHdaRVNtZFBDYXFPMmlYU3BUY0hwdTUvc0s5?=
 =?utf-8?B?YnlTa1daanBSbmZyL3VsWGJqT2t3QkJiT1FsOURNK3ZiOGZmUGQ3dTBJd2d5?=
 =?utf-8?B?ejhQNEJER2xFMFJ5dTRiTm1FL1MvcW9NTkw5QXNGRUJIbWVmSHdqOVdiM2Ra?=
 =?utf-8?B?NHA4bnB3VVAzNlpHeURXSnFZWDluVkJodHo0R0s3S2ExYVAzQzhRdVJXUGxK?=
 =?utf-8?B?ZGpEZk5Fb1ErZTQ3QkdoUC9iL1lWU2d6NzIxYk1rNmx2a2xSc1RqVmZNZzJl?=
 =?utf-8?B?SG8rL1RLTm1jdk1SWVRVMzhmS2ZXdEVqOTlmVzhqdDJBWmlSQUhZU3owV1FM?=
 =?utf-8?B?ZFBzMGs2dzZPcVZHcURGS1hXdU1HeFBkNzV5QmhOak9LS2dGM29iWDdnU0dV?=
 =?utf-8?B?RWRKbWVFQVRUeGJ3TlJrRlZDTTNaZE5SOEF0L3BvWklFcVlwL0tjZDBuTXdT?=
 =?utf-8?B?M2hncGszRGdPSjB6ZWhFOWYvTVk5Tks0R2RZSE1RVGwyS2Y1dFNtUmFIOUJu?=
 =?utf-8?B?ZXBIbE9QMUJPOTJqSGh1RGw5UXlPeURIZi9FVWhmcWpqbXcwSDdVOWlBd1Nl?=
 =?utf-8?B?a0JLdzRydEE5c2N5VDBzdXRXSUxvRjJIRVc2K0JPMVZXT2JhbUtLZVRVZzk5?=
 =?utf-8?B?UnB6MkNHWXlQanVlWU90bm5TTkZibFIyc2JidExKNkRRb01taWpDSjZ3MFBt?=
 =?utf-8?B?aGRWNTJ0NE1nRjgwNm1FWjBPRnFlSUNabFZNODROckZZMGllWC81dUM1UlVT?=
 =?utf-8?B?cjV2b003RXVTTFZQY3F1ZVhyZzdoeWNjRVBIeEV0Wlo0VWNxU083QUVsbEpU?=
 =?utf-8?B?V25obmwyNk9FYXJ4WmFNOEZ6VjNJZnVMWk5kY3hTbmFaNFdhY3QrdE1RVGM4?=
 =?utf-8?B?R09IcXpBOTJYbzBvd3JJOUc4TkF6NGdIdFdGZEFRRTFGZnZrUjA1Nmlrc0Jn?=
 =?utf-8?B?T3NnODU5QnhtYnpQc1NVWWc2OHB6ZnZZZjdrWWJsR2pOWmp3ZXNhY2xZMGtW?=
 =?utf-8?B?WDZWNnkyZ0RDcjI4cEJXL1VMZlpqZGU1blJ6UHpTY1VYb0VFR1EwazlOaHg1?=
 =?utf-8?B?YmZQT1lTQ3liTGFuWmwvUFhqMVgvd0RRQm85L0tzcnRaRXg3akpNT0lrQlc0?=
 =?utf-8?B?MFdCK2E3Qm1ZTEJ3THkvVXRpL0VYQ2FMKzhqVmRNRzJtcktUV2tTVmYyUmVt?=
 =?utf-8?B?WlFTbG1uRTNXZVdVN2V6ZnY2UW4zc3pER0k3L3ZxZ3B6dVVHeHV3c2RYcGZs?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aIA08lL+YWS0CTsVcezKQtO5q+x0pzTKrPNYk+gvlkTjMLdy9DAcxfltWutXFiuNGb8CmBIZIp7YJrYyoJ1pczHV8o7fs9nql11JS0v02HV9Fucivy7dGcyCzZS9HmkJZqtChtn9cITAuvTjKqJd0EbFk5JtqKaHl1Oh0/XgC0zLT8ts83B8xLZCppLqW4xLDJwtWkDjhXT1rVn6//b0+Pwtf4S06vnDXs3EZJCcxkWTrwg3gR2DLGavukIUYZqyRHh393ATK+GcNPbboGJ4Hqf3NcoGy/KJz4UeMx3lhpZ8kyaJ9urd+7/sdTjZFu0pYe1MyzC9aeKyweXsXwyq181IwRehiHTTYhSIR4CR1RRmlhG4RZPltNdkmhgAibkWEBaVjJ9N9WsrWwvmPSw/IUYZfKlgP7njyyBRd3Z7sZRo+xioQ89CUUKLDlhPAK5isZ6Aumxt5ZVltCA347rCxS3KI6LnnYAOyhDlYJqXyZwWkmaVjkn/PfeLZtWNlYZDEdczpSnAbO4HCHf1wbJ4aCEHgC0LTXgFr63SOtvy48Zr3KA6K6/TfLTQFtXMGi3aUD6lLG5dNGtOE0ey7r54a9Q5jc3ETFCsowNppo0+Wjrk/YVjV541a//zCBMfXoxzDI3JEdHMZwmEK/l1qungnOOgGbaiVtG/z+zTbCnx24jk/70a9rvMA2j+Nxi4HpBwI79tCtpw1QSOBKbE4At7R1XL0RJuhzvaeCAGJpF1my0l6xzZW/8GMogwXU8e+ZGjvYNk+PDZbdfEwVP1p2QYUUR/7p+LHrkZRRV+y6+jwIG1EhjMsAk/0m5Rh4spNdx7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd07882-7f83-4b27-5a61-08db61b9a23b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:30:12.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFGHC/XdeEicNyfogu0idZy6ExEssGdxH28S1yPDTAKowslQ7tAc0mbPUwOMECVNXIN4W9CNYXWZILYdTFw77g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6549

On Wed, May 31, 2023 at 11:15:44AM +0200, Jan Beulich wrote:
> On 30.05.2023 18:02, Roger Pau Monné wrote:
> > On Wed, Apr 05, 2023 at 12:15:26PM +0200, Jan Beulich wrote:
> >> On 31.03.2023 11:59, Roger Pau Monne wrote:
> >>> Only set the GOP mode if vga is selected in the console option,
> >>
> >> This particular aspect of the behavior is inconsistent with legacy
> >> boot behavior: There "vga=" isn't qualified by what "console=" has.
> > 
> > Hm, I find this very odd, why would we fiddle with the VGA (or the GOP
> > here) if we don't intend to use it for output?
> 
> Because we also need to arrange for what Dom0 possibly wants to use.
> It has no way of setting the mode the low-level (BIOS or EFI) way.

I understand this might be needed when Xen is booted as an EFI
application, but otherwise it should be the bootloader that takes care
of setting such mode, as (most?) OSes are normally loaded with boot
services already exited.

I've removed the parsing of the console= option and unconditionally
parse vga= now.  We can always adjust later.

> >>> otherwise just fetch the information from the current mode in order to
> >>> make it available to dom0.
> >>>
> >>> Introduce support for passing the command line to the efi_multiboot2()
> >>> helper, and parse the console= and vga= options if present.
> >>>
> >>> Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
> >>> option, and print a warning message about other options not being
> >>> currently implemented.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> [...] 
> >>> --- a/xen/arch/x86/efi/efi-boot.h
> >>> +++ b/xen/arch/x86/efi/efi-boot.h
> >>> @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >>>  
> >>>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >>>  
> >>> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >>> +/* Return the next occurrence of opt in cmd. */
> >>> +static const char __init *get_option(const char *cmd, const char *opt)
> >>> +{
> >>> +    const char *s = cmd, *o = NULL;
> >>> +
> >>> +    if ( !cmd || !opt )
> >>
> >> I can see why you need to check "cmd", but there's no need to check "opt"
> >> I would say.
> > 
> > Given this is executed without a page-fault handler in place I thought
> > it was best to be safe rather than sorry, and avoid any pointer
> > dereferences.
> 
> Hmm, I see. We don't do so elsewhere, though, I think.

If you insist I can remove it, otherwise I will just leave as-is.

> 
> >>> @@ -807,7 +830,60 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
> >>>  
> >>>      if ( gop )
> >>>      {
> >>> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> >>> +        const char *opt = NULL, *last = cmdline;
> >>> +        /* Default console selection is "com1,vga". */
> >>> +        bool vga = true;
> >>> +
> >>> +        /* For the console option the last occurrence is the enforced one. */
> >>> +        while ( (last = get_option(last, "console=")) != NULL )
> >>> +            opt = last;
> >>> +
> >>> +        if ( opt )
> >>> +        {
> >>> +            const char *s = strstr(opt, "vga");
> >>> +
> >>> +            if ( !s || s > strpbrk(opt, " ") )
> >>
> >> Why strpbrk() and not the simpler strchr()? Or did you mean to also look
> >> for tabs, but then didn't include \t here (and in get_option())? (Legacy
> >> boot code also takes \r and \n as separators, btw, but I'm unconvinced
> >> of the need.)
> > 
> > I was originally checking for more characters here and didn't switch
> > when removing those.  I will add \t.
> > 
> >> Also aiui this is UB when the function returns NULL, as relational operators
> >> (excluding equality ones) may only be applied when both addresses refer to
> >> the same object (or to the end of an involved array).
> > 
> > Hm, I see, thanks for spotting. So I would need to do:
> > 
> > s > (strpbrk(opt, " ") ?: s)
> > 
> > So that we don't compare against NULL.
> > 
> > Also the original code was wrong AFAICT, as strpbrk() returning NULL
> > should result in vga=true (as it would imply console= is the last
> > option on the command line).
> 
> I'm afraid I'm in trouble what "original code" you're referring to here.
> Iirc you really only add code to the function. And boot/cmdline.c has no
> use of strpbrk() afaics.

Original code in the patch, anyway this is now gone because I no
longer parse console=.

> >>> +                vga = false;
> >>> +        }
> >>> +
> >>> +        if ( vga )
> >>> +        {
> >>> +            unsigned int width = 0, height = 0, depth = 0;
> >>> +            bool keep_current = false;
> >>> +
> >>> +            last = cmdline;
> >>> +            while ( (last = get_option(last, "vga=")) != NULL )
> >>
> >> It's yet different for "vga=", I'm afraid: Early boot code (boot/cmdline.c)
> >> finds the first instance only. Normal command line handling respects the
> >> last instance only. So while "vga=gfx-... vga=keep" will have the expected
> >> effect, "vga=keep vga=gfx-..." won't (I think). It is certainly fine to be
> >> less inflexible here, but I think this then wants accompanying by an update
> >> to the command line doc, no matter that presently it doesn't really
> >> describe these peculiarities.
> > 
> > But if we then describe this behavior in the documentation people
> > could rely on it.  Right now this is just an implementation detail (or
> > a bug I would say), and that would justify fixing boot/cmdline.c to
> > also respect the last instance only.
> 
> Yes, fixing the non-EFI code is certainly an option (and then describing
> the hopefully consistent result in the doc).

OK, let me take a look, I expect that should be fairly trivial.

Thanks, Roger.

