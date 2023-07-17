Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CE756573
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564581.882105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLObG-0005bh-OV; Mon, 17 Jul 2023 13:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564581.882105; Mon, 17 Jul 2023 13:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLObG-0005Zw-L6; Mon, 17 Jul 2023 13:49:18 +0000
Received: by outflank-mailman (input) for mailman id 564581;
 Mon, 17 Jul 2023 13:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLObE-0005Zo-Hi
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:49:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b63e3f7d-24a8-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 15:49:14 +0200 (CEST)
Received: from mail-sn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 09:49:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6549.namprd03.prod.outlook.com (2603:10b6:a03:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 13:49:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:48:59 +0000
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
X-Inumbo-ID: b63e3f7d-24a8-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689601754;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cvwfUO5wNu8Z2w8B3/uQVdK9NMclrI1QtWw4wmaKY/I=;
  b=GNTFFDteFBlvtofKzEOAq9iwNCJtAOy4pT8/U03bQlw8Ug1GjVrdXLfR
   pfiEqGIMDkkGwzAkjY4iAPXWVrty/6vqDpt9oX+oaW5lfVdqBUsH2nhuV
   Z+6GJUkAMZbS+oPABXCTnXiljH1tJWueHgAUcjqRt5zPOg+VKXacf85aL
   s=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 119051349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CgVq+6MIBhKOVcTvrR2AlsFynXyQoLVcMsEvi/4bfWQNrUoq32AEx
 jdOWmCGbKnfMzbxeI91PIrn9kxVvpLUytcwGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5wNmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tlMK2JW9
 uEIFDAISxS4v8mdyo68c+Y506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyP027aUwXKTtIQ6FKaY39cx336oyjYwMBYYd3KwsablhRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBqgGqy8qDqzPW0OKzYEbCpcFw8duYG/+sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Qef5Aqykf3thkdQ4ghChKrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+8jzsCWftN9/Yh4dcLy7VpVoBEmslqKdgrNhWYtKPjOHhILAFugLgbcKgQeQeREWntQ36U
 4KSdkaNDSfNzlHZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-Talos-CUID: 9a23:d3sYqWxB40qyIFtxfwRiBgUrIeoman7A3EvQJmq8Ml5CY7epTmafrfY=
X-Talos-MUID: 9a23:CfX65AjDXc2dUbJz+KIZL8MpNNxIyo31V2M2nc8lg8KKFwV7K2jBg2Hi
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="119051349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiFJvCTYMdnHYwZpwstOjBKQXQKjPFYXU9dffbBvh5BeaSmwPgFZdw+ZhEEpYRJZI5dPau9dBjD0IJIneQvaDQGHPds3A9m8mTlLfQpq2BQ4QHXQ07BCY0ZMxIvV+tpUW+uY95oHMp24ihVsgLDJNWzWVjpWUEgJFWzqeWd2ofxJFVSRI0gEhAyFD4Jf4pmD3aujo46A1T0u1kE+Xs4oz6+KTWwMK8B/rUq2neQD6URe2Q1BtTkVo7+tlRkfM8ZKS6blkCrXBANj3452Ha51eJZgcA55aMKZ5WCvc9GbzU9i1rLg+oOWWcMD3eLCMPiCbec34V1bdjmcJyVLTIZvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mcp3wEPnZ7rV3MUjZ1ALwGHSE+qdvWmUUEoyZC9CGY=;
 b=IgFYsZC/6wPt2FInIq2Igon3pdYlfXfM+P4s9nKEE2QhTKPbQkMGA/74w2tm6xjVGFGXBZRJmzrSyhLtI4+N1znEa7e7rTmdizy2i7n4uHZZCL9jTWr63IPOI6HvJDQywmaI+VZ+ykL0tnzRo1eL2OhwkGmktOw1zQSrZC+mPekVEbNnEjqzL2YK5+byijRN66qSPTSyxM4HQy4huk9J3C6x5Zp4UtIPIFCoehl6RulWGzd9FmbMibUxuo2PWWn2Rr4GJtzmMj+SLZ6sqZjJKp0XJmfK6mPydv6Ogxay/+AumkLXBsuO22f2tjzqShzF8GgPLdDIMvcMw4quVUpZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mcp3wEPnZ7rV3MUjZ1ALwGHSE+qdvWmUUEoyZC9CGY=;
 b=Js1z3sjA2AA+5iZJWTE2zKV/yPSIwucnrC7Kh+JWpUkOo968lOzWgCIDyTh56n/vwxtmxY/vaBjuypz3kMgPazWKK+ybwZHP1dL3FRGzxcusUo0FdtvH5aJiuEckp5BWWCqEbe96IeIneRVJ0uIXffa2R5yZQzEMEa0tqLrjYtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 15:48:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/6] libs/guest: introduce support for setting guest
 MSRs
Message-ID: <ZLVGxe8mrvThUXJ8@MacBook-Air-de-Roger.local>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-2-roger.pau@citrix.com>
 <6cb49c4c-b355-38a0-5d96-9ca4938ac145@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cb49c4c-b355-38a0-5d96-9ca4938ac145@citrix.com>
X-ClientProxiedBy: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 018364de-6616-48bb-6792-08db86cc92b2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	50OYaoK/38huoAZFqTb4b4ag36FSfuMH49y3CuSlQwG8+zV3GWv3PQgKS1tdYuQU2htBcfZJ6hpYtUneCSlq7s/OqmWNbmhCimARdJmYTT9Sa3G7e7pPj/JICJBzHT7ocymStSIEkb4A5rpoLu53YLSkpGJSpUS6vYIJzx+BK5pUgUJxP6cF7Cdc6b3Ak//AKwy/vB6jk+WUBEdLAtRy2XpXJ4JjlAgNnppPye1IjOvGpZrq8+XdwI3v0hm53S8Fukh8Zd8MQkjO4IKk55Fzxt4zo37AhZo0gN9CV2tF/OKMNAEyehUYawQKPU8uQfUmUfF1aXf20hM7g8LwsM/vB6RJWc4+GZcslDtZNpyeyVDT8fEM4DFxkhea+XtnGbFHM2RXAkjyjagXd+wCVUdJz0gMl6tnbu1UO9PQ8CEn3I6Mx6bmM2JZzwgBfeou8hGmNehFD2Bqq18IZZqTpD1b7MHEjwXN+kZlB3glcWiE5r9nPwAYYZ28HfWwiHNiZOLm+Xj9f93KjoaN5u0tpo1TYjK15noJm5HC8kRmeCNjK3DPUy7qKF2bqFjf89cSR/px
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(26005)(478600001)(82960400001)(6506007)(53546011)(6486002)(6512007)(9686003)(6666004)(41300700001)(8936002)(6862004)(66476007)(5660300002)(66556008)(4326008)(6636002)(316002)(38100700002)(8676002)(66946007)(86362001)(2906002)(186003)(85182001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXYreC9haWsvWGZ6VExoL3gzQkZlUCtUMG9kRC9JdnBwMUtoejNhbXlnNmx6?=
 =?utf-8?B?dnZTT3V1VUFrWXBuNlJmeTV1WTl5aVRmVWFNVFRxMFBKZHJ6UG9nQjVxY3ZT?=
 =?utf-8?B?N2V1bHlVbmtuL2RCYlk2NEM4Qys0Rmd2cFRwc3lLclJleU50QkU5TGIrSmlP?=
 =?utf-8?B?T3o4cElQUzdiSFBQaTJCdkxBNHp4d0RZU241QlpMSHU5WThkZE9IRGdWemQy?=
 =?utf-8?B?UzFyQ1BRdlpxSjZrTVRUWC92OUpWRDNKdmxvcHkwZ1E2bFNWcE5ndC9HcVU5?=
 =?utf-8?B?TTk4bTJIZnRHakVTam1IOWdSTjJmdXdBK0pmRVpncjJXajV0UHF3eW5yWGpM?=
 =?utf-8?B?NnZNSGtVZWlyT3dINndUSFExS0pCTE5lekRKV3ZDTWRzWDdic2FBVUZuNGxO?=
 =?utf-8?B?dDdXMHB4eG9NckNpd2hKV05YS05nNnZyaXJIYWpWeGhVOXlIM280OHZ5UDhv?=
 =?utf-8?B?UENlRWVZUkNUQ3NtWE8xVHlFWlNMTnJGN2hGTGhGZDZmbVJWeVo5a1Fvb1ND?=
 =?utf-8?B?UllrQzc1U3YrN044REN2ejBrODIwN0dsU214RDBtbVhuWHZaNkh2NkVuZkdj?=
 =?utf-8?B?Z2FEM253RkpQS2pORy9nU0tKekNTWWZpc0VhTzZZK0l3UHBKbDVpUXY1cmZW?=
 =?utf-8?B?bmlJN0FWMWFudHJXNDNTdnYyQ0grcSswaUFCTDVWak9DcC9VOFMzOFhXZVNJ?=
 =?utf-8?B?ME5UVVZ5Nmw3MTBQQmRLQ28yR05WL0tRYjJqMDdldTNrMXlYdWRpZEFhbjNi?=
 =?utf-8?B?akZvellTZDR3ZGM2U09TUm04QitSdVdZSnBnL1NPZ1JaM3I0dUc0dVZEb24r?=
 =?utf-8?B?dlg3SUN0K1h6NHZaNWdQODhzcFFFalFPcXNxK1YxVDJOZmRJVStqUG1sWkRO?=
 =?utf-8?B?VUtkbHJWQWpTSjhhM1B5NGM3bWdhQkNOOUtyRHdJS2FRMk8xc25vaGhwMit3?=
 =?utf-8?B?ZFF3NWtDZGs3Vm54L29XdWZGNnhRbkJPUUhiZE1jOVQzQTc4NjhPZGErdHZS?=
 =?utf-8?B?cVJQVzRJMmpSc3lWcEEzT2NmSGQyTlpMVUFCdHIraXptRTZRZ0paVEN6enVa?=
 =?utf-8?B?a0tlamp2MVlvRnhtMHd5dTdDdlZ5K0dXSGs1YWU5K2xpOGI0T0NzakF4d2NQ?=
 =?utf-8?B?cjJYYUQzS2lNRWJiTHNqNEcxVFFPUWo3Y2poa1NRWWhVVVU0YUs3YTBlYk5N?=
 =?utf-8?B?TmlicW0vcGpQQWk5alQycDVXTlU0UCtQYU8rS2UxQjJycWZ5b0FuRlhicDlP?=
 =?utf-8?B?bGhmL0ZmUE0ramE3Tm9FSCtmdWR4d3ZLV0loNU5PbjNTd3d1dmkrVFlwUFZH?=
 =?utf-8?B?Tm0zeTlrcXdlVk10UExKR1lyL0RCUEFocHlqNHltZlRpY2kybEFPUkVoVDVs?=
 =?utf-8?B?QzVWVGFUQVprM25vK3dlTmgvL2ZTUFNrc2xhQmprdng0UXR5Zjhrd0QvY05G?=
 =?utf-8?B?dE1ocld0dWNFajhWMzF2bFpicE80bThrem0yekVaSXpqUE5IeTA2clQrR2Fx?=
 =?utf-8?B?elFCRUtOTXUwNDREK1k3ZHZFdkRaRmMybm82eUU1bjU4WCt5bnJaYVo4TGhh?=
 =?utf-8?B?d2pwT3FlNUJJRXNHT0FmNVUrM0NFdmdGL3ZhcmV2dkxsWHZEWlFxTFJWVlU1?=
 =?utf-8?B?SGV4bG5UV2hEWUl6ZFR3Wk5TdHRoaEVjeUZUemJPOHFxVVhTLzRpb3V6S1Qx?=
 =?utf-8?B?cmZLQUtJVlowVUp2QTZ4ajVZWFVBY0s2VFE1dnRFUlRXeVpnajRWZFB5S2M1?=
 =?utf-8?B?blE2NTc2SWdxT01DYjRhaG1SSkRKK01DSDJWUnB6YXFzRDU2Q2JLREh4TTh5?=
 =?utf-8?B?V05KaVF1N0p6STVoVm81eTZYL1RFbUJ1Zzd6VG1VamtZMUdiZEdaQTFBVXF3?=
 =?utf-8?B?ZnJMRUMvSWpYZ3gyS09mZ1JLRFBQcTgxbXl3K1RBS0M2U0VIaFRwa2tUUC9m?=
 =?utf-8?B?aUNZK3EwZ2xFMFV4SmJzemMwWCsxeXNqbklqUVhyTUJEa2tTZVRvOHdlcWt3?=
 =?utf-8?B?bFl5R2MzOWVLeDNWak9FaytsMHFmcnRLUEYwT3RkWWJCUWJFWWR4Z1N1a0RD?=
 =?utf-8?B?RjBjS3JpODlkMld2MEJZdWpiZ29BVGFERG9iaUxUampuNUM4dmNlMVZZL3kw?=
 =?utf-8?B?SGkwM01vcU9YZTJzUVJvWlFrMjRWZk55SXBkS1ZNU1M1QVpTUDZiMyt3UHpL?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7cXFNAwTksLDWADwz90hMu/PlEw5nYP9ML2MIpA08wlpDVh+TJAPW30l+N9dd2AdgaxS0J/rhK0F0vYeK7Q58A/38ucDUG9rzGCIZQ9y5+jR69Q3WCrpm9AW+0tFsYc9a8eZXFF9Q1Vxqc6BcYlYFoxQsAHa1hchHbRdkkLQgntVhhO08cSJv7pM3t/TFnHDW1+Aw0IajwNJ4N8DSRa55YoegmbdlJsLBRmFZso+Gmc64XIhKeMG5Ua8XKFltaPQFakuwnJtDyrY9jXmo+wnQy61MubwmNJOm8IYsIF6P8f+N9aQ5YHqVOMW3ggFddwupMjBz1ijVbwPnJailk2txnCs8xbMApe9PZVmQQFSKXZY7QziTaVHJzGIVeKY0lEqPAvqChosqfmbP69j2bI44HZfdicakmsz6zFM2QWEhwzunNnfyeFWp8eUGA7cnUtussCQfWUzpj1j3d/hZ6V4QhacsqOyFU9mZmoLJQMCxttg25qfh+Tm9s+fMNSyjt2MjQtw3fNjZqdT/Bmrib5oIx9j+lZf/FMa+OkH4QDS4P7gBUcxV8aD8az67sB6skVcqmF/mn4OkfG+EYVuN1D7uYpxmcWXFHrlJVMPEN1/weyRmE4bIDaMM+fb3b/7cbTNfvQbe22vSd6cEYEW7Kce/13d/gsZs2uv1SUuUcpMp6XxV++FqX3hoWwU0tTa55zNdda5Fo7K4v9uGqrKI1syUnbCCQo6CwtkHMrl+yR/1bRNpUAa/MasNkxfKiQlW1NN63zt/rkk9uRB2TcJN1Tt0CbhO0r+ChVPBBv7/adkdiyZfiWHPiUgsDNB/OfqK4q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018364de-6616-48bb-6792-08db86cc92b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:48:59.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9KmrVS1C0OeOLadZDTYYl8gPOpCyy61zoRtDfJHVTUBgGCuU+XLj+AWisv7tlebI9kCkOSIGRTk4pednVnPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6549

On Thu, Jul 13, 2023 at 04:14:30PM +0100, Andrew Cooper wrote:
> On 11/07/2023 10:22 am, Roger Pau Monne wrote:
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index 5b035223f4f5..5e5c8124dd74 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -423,10 +423,169 @@ static int xc_cpuid_xend_policy(
> >      return rc;
> >  }
> >  
> > +static int compare_msr(const void *l, const void *r)
> > +{
> > +    const xen_msr_entry_t *lhs = l;
> > +    const xen_msr_entry_t *rhs = r;
> > +
> > +    if ( lhs->idx == rhs->idx )
> > +        return 0;
> > +
> > +    return lhs->idx < rhs->idx ? -1 : 1;
> 
> The sum total of logic here is just
> 
> return lhs->idx - rhs->idx;
> 
> (I think.  Double check which way around the subtraction works.)

Since MSR index is a 32bit value, what about one index being ~0u and
the other 0u: the result would then wrongly be -1 ((int)(~0u - 0u)),
when it should instead be a positive value to denote the left hand
side is greater than the right hand side.

Thanks, Roger.

