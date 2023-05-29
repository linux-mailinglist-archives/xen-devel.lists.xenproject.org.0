Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E2714663
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 10:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540572.842403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3YPc-0006No-1r; Mon, 29 May 2023 08:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540572.842403; Mon, 29 May 2023 08:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3YPb-0006M9-VJ; Mon, 29 May 2023 08:39:31 +0000
Received: by outflank-mailman (input) for mailman id 540572;
 Mon, 29 May 2023 08:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxNl=BS=citrix.com=prvs=506ffa617=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3YPZ-0006M3-Su
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 08:39:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b17eed-fdfc-11ed-b231-6b7b168915f2;
 Mon, 29 May 2023 10:39:27 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2023 04:39:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY1PR03MB7190.namprd03.prod.outlook.com (2603:10b6:a03:52d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 08:39:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 08:39:20 +0000
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
X-Inumbo-ID: 51b17eed-fdfc-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685349567;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zyqsEN0u4JweN6CymyoR3leAD4A8ZzsxJ3ZEsOQjunw=;
  b=Vm0gExyHlVLGrGAUe+w0oZ9sqlhpjTLXSjGBV0a4Rell89sNfs+3l7Jo
   ZlS64fF/yF3LDcu+grud+k9G4N4Z2R3FOEQehD6lyrFvgd58SljqhHU1i
   ORiG5/eZlLibkSQY5p7e4hcLh2Iu95ZXnoD0km+s+s9IBdOOGXoriqgt2
   Q=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 110663272
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4x37vq6uEklCkFHhHtq7KwxRtB/GchMFZxGqfqrLsTDasY5as4F+v
 jNOCDvTPavbN2LxKNsjbYXi9EkOsJPWyIJgHlZkrCBkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 McjGgogLT25q+u8552lQdMrlOI4BZy+VG8fkikIITDxK98DGcqGb4CRoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkotjNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWxX2lA9hNTtVU8NZDg0ydgWMSLSctC2apvMK9px+PXfFAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5e5dDm+Ns3lkiXEoolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:NZxGWarLwHL+45F/wPcDxocaV5rUeYIsimQD101hICG9vPbo7P
 xG/c5rryMc5wxhP03I9erwXJVoBEmskKKdgrNhXotKPjOW3ldARbsKheCJrgEIWReOlNK1vp
 0QCpSWZueAdWSSTvyU3OB7KbodKRW8kZyAtKPm1HFqQhhta6Z8qylEKivzKDwLeCB2QaMjEp
 yS/8xGoCflX082QICUOlkpNtKz2uEirvjdEGA77tocmXazZPqTht7HLyQ=
X-Talos-CUID: 9a23:HJnNcGBuFzl4nM36ExBcz3wuN4MISFHUxlD/PUSCTnRPU5TAHA==
X-Talos-MUID: 9a23:NrOc5wlKvLPKSJa01/fSdnpLN9ZmpKuvLXo2z6gUpvKAGH1BPRSC2WE=
X-IronPort-AV: E=Sophos;i="6.00,200,1681185600"; 
   d="scan'208";a="110663272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzgjkN+O6/2UiSLCs6XUNj2wnFmmZhcpT8vvOLEXfO4FU/3p8qlSzQhGQAqqNQL+ktvai4/RZJqy+fsd+fvITHxVoHJoHb7Q7tS1Z1OY19dCT84cHZlNpwuerz6M8kjdnXLUIoznxbzaPNM6nNweRBPd2frpdyYy9M+bFj8Y+BdOyXEANKp4UQj/NjG4l+vctXPJcaeVKZImgG7I1RdWtE27vaFgHB97Gm0X3BMvcYzNqDp6rYe0pX/uTluWdNlTA1Ax2xSrVqS2hdRW0xUqSAvzMuY6IRsBJ7eC8bs/bo/rXwwFbMj/2n45FB0bS1/Md0m7b9QLCV6sBqZ44B9vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu3VbNvYT/3P7tnAnz5ZryeArbkkmg+3pcEsfx5uZwk=;
 b=G6TM9ObRAaosUaAebq9xrXnGW8NCrFyXKcDAOjaK/KsEpXkmDv/vstvUKRhqLoJRtNAFEAzL5Z6pVm48ikoMlTlAXShIBpKslfPQq5dEWqjrb4gQ6qY5ulewflw4KzO6DAwTPsxK7+fvleG7KR36AAnixci5E5YEGpKGUXiABBuITODL98bkR+NEjAgsDTAvGQcuYMyxY8w9nTmoarbmuPkzjB+sY7F/ob26YuJYdU+cp8rGCGClwnxWOHDz4Ks7n54KLbOna8atMfYjOC4QXE8u0KbodmgSzYL5tPwjIeqD1iH2LEoMTty8v2p37XDzkcoMzxoYcyzv1ZiCdJIllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu3VbNvYT/3P7tnAnz5ZryeArbkkmg+3pcEsfx5uZwk=;
 b=HrVgKsOxaFANiF+M0Wif10vbacDsSA846OGrikCi5n+xw6DPAZaxueMmvSjLDsmqa7+626xMJh+26c9hzw8mX1X6DRDeOUn7JSTwBFvJszbb342CAJI88tSaYdX6OS61wHkm3dzRU9JRl9wHCfysF7R4+Dr1CylBJiN896XbNUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 May 2023 10:39:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIC: register only one ELCR handler instance
Message-ID: <ZHRkstB6UKWAadVZ@Air-de-Roger>
References: <5567b45d-d8ee-7f43-526f-7f601c6ddd46@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5567b45d-d8ee-7f43-526f-7f601c6ddd46@suse.com>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY1PR03MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f8e69a-59e3-43c2-0920-08db602031dd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g2zmfoc6yVIvFe3WUaVU9ZbygSVnbRKYf5zJLX1LfF5LrACCxYoV+YDZDwSfuPlh6xclxnFdmnzWdgLcyT+647fGtAKENwSER95X1cdSOM82DbVRtF3hhKLfJu1URy0uT4sAHhLYzYstdUmt3cDI4xWsLuZWnT4YUezUsaLLFQQbYPzt50ozITOw9bF78Lvsui3XOYyWamyg6ohOREfgdW59+3hnNZfgaNmxqouwxnvtIb+lKXCyagnty+GJLXbsRINUDIMLogi61Aq+/aBgLSNYWnX1U58Yk/oL/B/GwGykA8oZeA7gLWgpHp7ONNgF9UCA9IL+hY14/RyqRup6fGxMvYF8iCGV91lJhWm9vczd32tSVr22k5zfUJ4TKJ3rcueW9I8kyk7tWQRljFIYd8mdpMIhhzfr+pm96vHfrhbwwJ8xUQ7g2Ahjw6B8LkZzD1ESIXSLlsgQANrWkUdNrAP+YPu25jWR8gGsh2fg+qj1x6MUL02ftB4jyxgea4sOiBYvIb4GMAi/jxcI9XZG26GWG9MYk2sdtBXBJGGt9hVm11Gvm6IxJKky4xP/lZp+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(83380400001)(66556008)(5660300002)(6666004)(316002)(66946007)(85182001)(66476007)(6916009)(4326008)(33716001)(82960400001)(8676002)(6486002)(41300700001)(38100700002)(8936002)(86362001)(54906003)(2906002)(6506007)(6512007)(9686003)(186003)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFVUaEdjdFRzMWduS0JYMFlRZzZiNEZicm1hZ3E5UGx1QnpXZDZOVzJVbmo0?=
 =?utf-8?B?UFEvei8wei9NTzZ6NEIzVFZ4UW1sb0lGUTNRMGF2NTlHUTVUTVpGZit6SUEz?=
 =?utf-8?B?VE5xcXFSbFBWUVlpd1dtRS9VWlVOU1pDcjJlNlYraFpyNTdYbEpyanplN251?=
 =?utf-8?B?VkN0WlFRQ1ZDZ3hEdkdKVWlqME5KdnZHWHEzcG9wU0poV25mNHAwVkMyczkr?=
 =?utf-8?B?d0hjM2M3ZE9WY3gxVUpKcWlZd0VnMXNISHdOYUFiMlA4NEg1dng5TVh3NDQv?=
 =?utf-8?B?L2UzWHRpc3FZQUhjUzBEbVdoVnFseEM0SVVzT3ZUTjF2TjU3RzNSVXJKM2V5?=
 =?utf-8?B?WEkwZy9hMVNMV3F5NUVFLzdhTEtoSU8vL3RpWEsrZUFOYmRGRVpHdStXME5H?=
 =?utf-8?B?a1BrUFE1VkVYaUVTOWRScXVMQXM5Ulp3RDJnL290N09udFZiVlNHaTMvMXlq?=
 =?utf-8?B?d0dpczczeWJlVXpKeHYzYXBkZ3Zoc3g3V3FvLzlGZENWMXlHY01ZdUJyS0pn?=
 =?utf-8?B?V0I3R1QzNTBNTEJ6S3JBOUFMTE9hSHBPazYzUjZYV0oyQm96cmxqT0c2WW9y?=
 =?utf-8?B?VmF0WFAzKzY0VlllTVVTakFxaFUzWFZQTG45NDdrVUYycnVma3cxcWZCOG42?=
 =?utf-8?B?T3RSREc4MlliczV5NFMyREVZNVlmZExzNE5QL1M3TnV3NXNvTSs3aEpnNUw3?=
 =?utf-8?B?eEs3cDA0dDAzUXlpaUJ2emZlQ0tVVVRlVGZObWgzaTN1cGFvdHgyZWRsejJw?=
 =?utf-8?B?bTZPY0p0elluQTFvNysrSE9RWXZSNnFLWmdDcVArcXd4anVwMUNFZzRqZWd5?=
 =?utf-8?B?MVFYWEM5TkVsVVhHZUNCUEZkWFpZSkYrOE5jaCtpQzFnNm5tRU9CTElaNmFI?=
 =?utf-8?B?a0puOU1OMHZ6WVpoV0ZKcEhZcEdEQWxIU1VjOW9jWG1BbXcvSXpnT0l1V1NR?=
 =?utf-8?B?K2tTdW1mK1VTY08vb3c1NkljRU1TcnhHNndOVmlHUWhQem5RbExXK3lzdlZo?=
 =?utf-8?B?L3FLcXdDcXFscnBCdm9NUksrZ0U5M3hBdTV0SGxVajRSU2dKbC9LRG81MWpI?=
 =?utf-8?B?YVlGSW5nT04xcTVSSUcvUitEZUp6Qk9ncTBEemE3ZnhKQjBpVjU3UndtR21D?=
 =?utf-8?B?VGVvRlVQZCtOalJ0aXMvNXZ5ZytxUzBWU2x6enQ0NmZ5Uk81ZTdSVnNUVXhr?=
 =?utf-8?B?YzEwaGhXVUxrcG0wRjU2alM2UzE2UzdiUG9LdEFtK1d1RElobllFV2NBdi9n?=
 =?utf-8?B?N3MxMzhiTjI3YW9zKytDVEhza3RMUEVSRFFhMEhoeml6eUdxYjEvQzE5NEoy?=
 =?utf-8?B?TU1YcllhbXd3ekh4RlZ6U1B3NnZjQytMdjJCR3BDTDZPUFM4eURFK1BIZ0h3?=
 =?utf-8?B?TXNZOTUvNGtZUVJSU0pVamt6TmVSazljSmMycktWSVF4Q1RQMW5LS1ZQemti?=
 =?utf-8?B?OHpaaEY2WUF4V2hXeTc1ajB4b2VZUTI3SVI0OUI0MjFDMEUzekkzK3lGcm1w?=
 =?utf-8?B?RXlMdGtxc1ZpY3lqeFZteFhoZ3hMV1FlNE9HNDcxaXBxcEIzN3NuNjFvajVt?=
 =?utf-8?B?SC93d2RSWUxPZjJRbnNrc3B4N2VTVXBiMXFIYVJvWE9zRktvSnZ4ZmZsNlVC?=
 =?utf-8?B?elM1Z1ZtenJkOTlGZTFHb054ZDM5dnZnZW1lN2VqbzRWNzNBbUo5NHd2ZkQ4?=
 =?utf-8?B?aTlrMkdueFBJaXYxM2doQlBVVDNFTW9iaDkrWnprRnF0MEdUcWlseU1sMi9Y?=
 =?utf-8?B?T0RxU1VVVm5TbnRIYmpmeTFtYXNkN0hLVlREbXNuR2E2ZXNVSVZQcmFoaEtN?=
 =?utf-8?B?UW1lRFN5dWU4WFB4TDZaR1B4R0RIRnBDM29lOGdyRXdMWkV3bkxDM1JzQXpx?=
 =?utf-8?B?aWs3QkdSRGFmbVlZUjJ2SDZtMmZIR2JPbEdXNUVTenZsQ2F5YkJWdy90Z2l2?=
 =?utf-8?B?VkFobDdqK3FzWVpmVHpjTHJpUjRLZDFocTJEMDlobXpsbWI2ZWw3WjFHV3RZ?=
 =?utf-8?B?aWFRdmxMa2pUbU0xbnV5czNORHZoYjV6SWUraVo4LzVoWCsycFdwTXhHMkRt?=
 =?utf-8?B?R2FwWUV5aFhlM0p3cXJYby9TM2U5NWJHQTNLa2lvZGdPYWlWVktqNHI4WWJG?=
 =?utf-8?B?UjFHNi9RS3Z1eW5ySjdaTE10YThjdU9Nc2FkUHFjMHQza1BJbEx0TzA0R2lU?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QO2U6sZxvb4UZhFDi7mnl92Tq2shwuabOYWO1apaDAdSOOESSZzmz1uVikwWrBlWFBnc4/WnJtg0MtVhJD8Kp/pZwfu/tyeH7FwgDdCGsvVgmmCsmDjapbKtDwJbGbp5yZh4XPDfDrcaJCnQJVkt60cQpKV8jFMRk2W6bU4OeJLPwptwUIRLQV9AycUyv3nGrFwg9AyAWe8PqjDNpr/m/zA/6IqJSXo8xIpcfP3RKksa3Gt18vHFV2TQ9lP81wb+rmxtlOYW8PJRDGavxWS5GnGbP34vl2RrSWBByjDMzXJ4yazzX3CoJ3GzR5B8FbE8Iua8dZZNDJYqjm7Kpho4ehMexA4DTBqUh6Re6lM2Z7PGeO+BjAcd9KGuy//4eNZmsmlVqMFnt2B9dqQcl7+9tS830BtgQMrQP9JLA+8wP86KB99rCGX936iMceAcZO5gpW68uGLjywJWPOovZbJWL7CIUorZJWBrIE7/s1QW1YthxgILCItE6y0FOxHurKDhn55euFjh7tey8BOzYcRfdeasMlX+0BrroBoHbIZ2iCWJLm78+p+UoWRVyEBaWWR/81FAqht+ziGy8u+VGkXL6XHQWHbtDkYMGJ03TKBmc712SVirdPm+BJksbB7dliX8u8zHr3a25X3nyM8GJUXMBAC+4eoWUHhBYilXupHluXmgIogu+fhp8gg4FKgj+xa/5v9J789mjTzYw24/foqdWS6Ai/I021wczAzCFYbroM9rSD12uLyyx2ltZGoevFRrXKXrS7pEVRPhrvGmivuMSVjsE5TqjLM8708xcNM3jvFCiijOHzprTHYL00DlBShW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f8e69a-59e3-43c2-0920-08db602031dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 08:39:19.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vM0SLOzsMCHaDPRnLe06ngSo+Ke/0UA1YaETVyxsPPX8+9B+fbRF/Xi9dWnSarTk6JyAZEfbL6BsdPYCK9JZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7190

On Fri, May 26, 2023 at 09:35:04AM +0200, Jan Beulich wrote:
> There's no point consuming two port-I/O slots. Even less so considering
> that some real hardware permits both ports to be accessed in one go,
> emulating of which requires there to be only a single instance.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -377,25 +377,34 @@ static int cf_check vpic_intercept_elcr_
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
>      struct hvm_hw_vpic *vpic;
> -    uint32_t data;
> +    unsigned int data, shift = 0;
>  
> -    BUG_ON(bytes != 1);
> +    BUG_ON(bytes > 2 - (port & 1));
>  
>      vpic = &current->domain->arch.hvm.vpic[port & 1];
>  
> -    if ( dir == IOREQ_WRITE )
> -    {
> -        /* Some IRs are always edge trig. Slave IR is always level trig. */
> -        data = *val & vpic_elcr_mask(vpic);
> -        if ( vpic->is_master )
> -            data |= 1 << 2;
> -        vpic->elcr = data;
> -    }
> -    else
> -    {
> -        /* Reader should not see hardcoded level-triggered slave IR. */
> -        *val = vpic->elcr & vpic_elcr_mask(vpic);
> -    }
> +    do {
> +        if ( dir == IOREQ_WRITE )
> +        {
> +            /* Some IRs are always edge trig. Slave IR is always level trig. */
> +            data = (*val >> shift) & vpic_elcr_mask(vpic);
> +            if ( vpic->is_master )
> +                data |= 1 << 2;

Not that you added this, but I'm confused.  The spec I'm reading
explicitly states that bits 0:2 are reserved and must be 0.

Is this some quirk of the specific chipset we aim to emulate?

Thanks, Roger.

