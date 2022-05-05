Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D251C3E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322239.543489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdMu-0006uy-TU; Thu, 05 May 2022 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322239.543489; Thu, 05 May 2022 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdMu-0006s9-Qd; Thu, 05 May 2022 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 322239;
 Thu, 05 May 2022 15:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmdMt-0006s3-O7
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:26:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0d0c507-cc87-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 17:26:11 +0200 (CEST)
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 11:26:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 15:26:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:26:06 +0000
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
X-Inumbo-ID: b0d0c507-cc87-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651764373;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KB3DKBlrwn9GlEdbXfDbNV5pht+WhSuIoL9y6HhekIQ=;
  b=KGzg0MUIk0FSCB9puwAtId5arr8rCv1P/V2YTK7wmFj25Tk+DisfxUZM
   ZBPCkENbeSJwnO63ENJJGBNh/UL7wXb9kgJtf2LFJr2BwwpA7GI7T0j84
   Na80mvHNEcMqFeKgDZaVQFhkpkEkHHozGmZGUw/JjqsYn+P0isnMt5jVr
   E=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 73145746
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b4PMSq3rEALhnSCe4vbD5aRwkn2cJEfYwER7XKvMYLTBsI5bpzFUn
 zQcDTuEaa6CNzTxf91yOYjk90IPsJTUm4VjSFQ5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Tlce6QBdyDJfKhbpEUzN6HxhDEvRJreqvzXiX6aR/zmXgWl60mbBEKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82aBfmTjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKmL2AH9Az9SawfoFTLwkt6/rjRL9/WcYeGecYEmQWYn
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwKyN5Q+cXjcAVmQZNIVgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:oHUoZKmEuGQLIE5EO1O5VCZg1afpDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="73145746"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k29rgCUmlLcziN/ewwMQLsCuGfTiR7p0U1px1U+j3xFjCByOZzDXEtsX5n0gfjGO/Md7fQVJwGeL2N2wkPadGuIwLeVMdAlHp2xafJvffMmhsAKZhjuwXkKBUAB4kaPhEPXWIu0Hq4P+jt5yZPhvHwB9ql+ZDii0Ur7GDzJxQs3b1mu/c8kGoqovfcnpx/wMvHFL06JPyLi+VZ8kzHnX5RqKbozAwgXmwVmrL3Dfg+t2aXXFOOQi4rhu5YZAqDjZKyK6oev/jiIXyeNk7dTKhzLcRCsBujjgjP9+ju2GmTihoL4Tb83PSQ38Nlrpk6k1+wLcj0+vCl7PT/xjVkkrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/sS0UFMyGyYLTYuRV9TlNc2+7wqOivnI478LpcvgCI=;
 b=Jjezb63VkcG1k+0notYwCOcqfjGFLvkF0iCogjGOeToIb33ZNL+SNgsiJJlYHCJPmgG9yces2UrSYY2WsvoXYEP8euuBUgqIj5UbJ6B6nBTm3YkKPHyJXzd0iop/7Vic4jnAYcDQ2Zb/h/ootyH4pLSzqDFg/sYW+L1swcdP+4id9wCl95jRhSEgSmI/Bd7qRKzPjPzo1rP4SWyW9Lws9hPxqgnYlPwv+oAX1OQFKyB661Qft120MWZ5CZ7mWnL9ezR/WQAJoUxcgtsdoJAzQEDIlZmBAJGZSZ0up8pV1Cbps6OTiimyESsa+xTDfi678WAYqqZ70xv2GkMjtYF58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/sS0UFMyGyYLTYuRV9TlNc2+7wqOivnI478LpcvgCI=;
 b=JTEira1sXhDoyWnwJ1Guw9Xs73Z2dDCdR6S+Ke/MwzaP9DBOpsFeARzNxHCZYFXixQs7UeCLmBru80iPT4kMNv3wE32h2SQefE3uGsqlKaeRpBc3yQYSwlw3a3GoFUYfSPVURarWMrW9uQP95aOjHjs7tUmuii8VHpOWm9HvLI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 17:26:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 10/21] AMD/IOMMU: allow use of superpage mappings
Message-ID: <YnPsiODVu4MFYz+X@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5866e22e-9f31-84ab-1df9-db84aa802944@suse.com>
 <YnPO/B9rzxkYrHkh@Air-de-Roger>
 <efe148e8-df16-f43d-6617-750f2dd058cb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efe148e8-df16-f43d-6617-750f2dd058cb@suse.com>
X-ClientProxiedBy: LO2P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d47ef0-2476-4eca-182b-08da2eab929c
X-MS-TrafficTypeDiagnostic: CO1PR03MB5665:EE_
X-Microsoft-Antispam-PRVS:
	<CO1PR03MB56650680D5292B464772FF4C8FC29@CO1PR03MB5665.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5mc+/cSrheqqW/KzCBrKvaZdnSmvdvHHp5q9EShXi/1oRUS9uMLe5Sf6d1daO7WovbLLVThuWvg85WYWe1PYSHsHpmQ1brzoBJ4q+GGdYke/wDSg7ooQBUKMV9SnkK8haTtDjS7jNEcQxFc5RxLz5cT1hia8nq2vd4TxQHNVVNgpGIZGnsD+tMNuZevI0/mhCqIFVDkfTWlXA7oajc/orGCqtdrZvxCSqkLFx5j31DXwGHc2ag0Cioh9RcA5bx+GJqPEqWSRJTPekXkVbgWJL1Nx74XDAcKWab9G6Ni4qWbCkJ7lspe0L0QO7PH8l0uP+EZ95WfogTTD89+aXwodr+oHwY8bseuhyBq0CK1I6ATqz5qgs/zlOwyIanFoX8FwqT9YJNW+o3u55MacMVawGZ+k0u3KKL2hqp1wHYKEpRNaBSZ++tEcIJNJEQCVCO9ehzSfc6OqiXdEbPvxCwuH2/u6UwO9BpGFj06SxMyk6nw5l+6WaB5Z1XQB5HYtKKzhKaShsO0CxLHdpwMgYgpmyTsku2b/k0aI4PCj7XCe7ZB/F1oUhMH/8fZ2uEdVJMgJHGxj5lh2MnEmppJTm/mMquImGWcDSYZ5nYza8KKGxXNiUE0Yh0nYIW7/LN3hQzuG0ovNBgHPPzOoS70Ateyyom5Gd+txxlZZ60FFD/ynnjd835VQxaW36vvyELdzNz9fFFlX8onO4QbI+nj+wKB4hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(2906002)(9686003)(6512007)(53546011)(82960400001)(508600001)(6666004)(26005)(38100700002)(6486002)(86362001)(316002)(66556008)(66476007)(66946007)(6916009)(54906003)(186003)(8936002)(33716001)(4326008)(8676002)(85182001)(83380400001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVJOGlCMzArSHI0ZDRBZEFiMTdyMVVyOTUzemtIZlRXd05Kb2tTRElmajgy?=
 =?utf-8?B?UzRrRE9RdnphYTk0Q1JUbFY0YWtyTlZyeFptcW9CTHFxZmV0a2dKZEtPc1B5?=
 =?utf-8?B?bGptbUFUSEh5dEl6YmxsV3hYazFQMEwzTTlGcTY5WW1LaHY5L0hFOG1TL1RQ?=
 =?utf-8?B?VWN4MGZuRnIvM2xsUFp2NjV6YW9OT1VySWREQzdocUhRUEFJRHNNN1dVQi90?=
 =?utf-8?B?dVl4Y04rbjNBdk4zZGx6eHR1K2FPbWU2NTFXZk5Day9VS3dWQ1VMZTF0NmJY?=
 =?utf-8?B?ekdQT1QxM3pWdnVZczQvKytCWjNXSEFwQklkQ2JmeGxtU3hiUDdJUlJsYkE2?=
 =?utf-8?B?anlPR0Q1YVdkaHBhOWxGZG03a1VaK3M0SHEzRkpuemlvcExPVng3N3doRHFY?=
 =?utf-8?B?bTZVVld2SDBVTjZXTmFiajJlNURSZ0VkYUJTT3ppK2M2NjJudDZYSFFhWnZv?=
 =?utf-8?B?S3JmdVViejVneWVZV2FQYUovcVNnQ2pWbk5NcVJkc2haRnVhWWxicU5LM3d1?=
 =?utf-8?B?REdtOFJIb3dMb0JUSm1VSHh5dmh5cXVBU3RVam5mcjNVcFowblpUOGZyWitt?=
 =?utf-8?B?VzI2eEk4NzJXSU1sR3c2OWhBYmdtNTYrVnlOKzJtckMxRjBzc3ZzeXEyNTc4?=
 =?utf-8?B?OFpSQnlmenpxT0JrM0ZEdm5vL1BXNG5yU21KaTlxTXd0cnZWMnBNMmhablBK?=
 =?utf-8?B?enUvN0lNS0lYaEVBZkFRcW9LUTQzZFdQVVJoN2cvZ1UzUXlHS3dCSU55NkVT?=
 =?utf-8?B?dkhTcWE3bzlETER3VGFhWmRoeHA3WE9ubEdvRWtEeENxZGNKdFdqZmczemN5?=
 =?utf-8?B?Q0V3RGcrcjhxNXZYb25iZzZTa2pzcXBnejZLN1QrRUxRei9qUG4rWHYyMlhB?=
 =?utf-8?B?ZzhOMkgySXVrT3JMVG85S0FkSURqajNWVzlKUGxtR21GNnZZeTB3MmR0SGRv?=
 =?utf-8?B?NjJsb094RVY3NGRUeWdxS1RnTTQ0NkVCdks3cm5zUElYeCtidXc0R2Z1dmtJ?=
 =?utf-8?B?NTNhaldwamFiVW5WWTZQMXFMZkZyb3VScHFreFp3VzJud0FsNWYrVVplVWZZ?=
 =?utf-8?B?cW15WkJDR1I0bVRFOHR1alIwTkJMbS9uTUF6TGVvWWNFM3gzMHBybndCVUk2?=
 =?utf-8?B?L0hpazFQUzlHUzZWQkV2VURrcFVoR3JPdjhpNkIvL3VQQmpCM3JjYWlQbDdi?=
 =?utf-8?B?dlJIWHNjZFlQbFZoanliZlNmekFIRWRhemtmM2wvNEhwRFpUM0k1SzNnNWh3?=
 =?utf-8?B?M3hSWWlEZ1ZudU1NMnJSQjFTcEp0WFR6WTN4bUxTd1Nobmc1TkVEbFZwb3ZC?=
 =?utf-8?B?c3Ava2RITmxaM2lGSVIyZElGc3RYVHJTU0Z1VFdoWE05bld0R0pNZVVmbjFt?=
 =?utf-8?B?R0NEb0k2enl3Y2tETE05ZjYvNUZSNXpSemJjNUZmZkI1Q2MzKzRLNjhZL05J?=
 =?utf-8?B?THNqUkpQU3JDTlcrU29EZDFPeE9lV1lZcm9oNDI5bnUwVWxaNDkwTE1LczVB?=
 =?utf-8?B?bkhqY3F0dEtRL2JxSnR4SnpVNkRJcGl0UVZFRHlmMFdZTzlsK0N3cFdxRVZB?=
 =?utf-8?B?VFV3SGljTmZMcHVMMVhWempHMWlJOG4yZjVoNDEzWkhmODZ6MTlGNjZqd21w?=
 =?utf-8?B?aWxlekthUjNwcEs3Wmo1aHQ5eERra3dxbEpnVHNrNktqcmZrYmxMY0wrdDZI?=
 =?utf-8?B?N0JXK0IyNzFUajNpbDF5eDQ4MFpEZVlLL2JCY1R6WVdlcnQ2Qm9zVEZOTDMx?=
 =?utf-8?B?czFqZ2g1eFQvaUlTNi9JVzRIZWp1OW1WWStPcjVYdGFIUjV2YzdNM2JnS3dC?=
 =?utf-8?B?U3hQYWFrVVFrZjZsMDRwbDYrQzhYSXJ4MmIrRlR1NVRlRFJUNTY0ZHZXWW1N?=
 =?utf-8?B?dnVmaldObGRyVGpPbW9BQVRETU52N1NBeFVaWWVjdHdqM0x2Q3dEV2tCS01h?=
 =?utf-8?B?TkthZGovTXR1WWhPK2kxVGg2Qkc4QUV3NDlkcDdqV1luZm0wS2VEL2tvUnBn?=
 =?utf-8?B?bVg2Q2dzVWtVdXpTRzF4S2pZY295RG03UTNkRTZjOTVNb1lpK3I5d04zeVk4?=
 =?utf-8?B?WlQ4TlhOb3ltTVFPbHJ5VjRab3plQVlaUmFmdHJEUnNDL1E1dDFNSzduWnIr?=
 =?utf-8?B?UlFSdHo5MUZpYzB6YWdQVUpsUk1ucDduRXFYTjNFSHAzK0FLSytGSUxHRnhD?=
 =?utf-8?B?eENrNjBkbWxWY1hjcVFJNzRyeGRjZ09UcDNuNnVUWFJDcWtIK0djak4xZ3pr?=
 =?utf-8?B?UVU0bGZCbFNGY3lFVlc4UStjYkt2cUQydVhDUk8wUW9RY0ptSWFpLytENnZs?=
 =?utf-8?B?dElvbGFVQ2k4WVdjSmlaM2MxRU12NHVsZWtjQWdCUngzQ0Qxd1lDazZCVkJS?=
 =?utf-8?Q?ogmta3BBwynTnnpY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d47ef0-2476-4eca-182b-08da2eab929c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:26:06.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwkJ0xvoyiVsmJWukqxMNNn2L5GiHvg1P58CrPTZD0hFoaZKD4VDq7cB9ass8/fGWf9Hr86rfTNRnOulXNFhOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5665

On Thu, May 05, 2022 at 04:34:54PM +0200, Jan Beulich wrote:
> On 05.05.2022 15:19, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:38:06AM +0200, Jan Beulich wrote:
> >> No separate feature flags exist which would control availability of
> >> these; the only restriction is HATS (establishing the maximum number of
> >> page table levels in general), and even that has a lower bound of 4.
> >> Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
> >> non-default page sizes the implementation in principle permits arbitrary
> >> size mappings, but these require multiple identical leaf PTEs to be
> >> written, which isn't all that different from having to write multiple
> >> consecutive PTEs with increasing frame numbers. IMO that's therefore
> >> beneficial only on hardware where suitable TLBs exist; I'm unaware of
> >> such hardware.)
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> I'm not fully sure about allowing 512G mappings: The scheduling-for-
> >> freeing of intermediate page tables would take quite a while when
> >> replacing a tree of 4k mappings by a single 512G one. Yet then again
> >> there's no present code path via which 512G chunks of memory could be
> >> allocated (and hence mapped) anyway, so this would only benefit huge
> >> systems where 512 1G mappings could be re-coalesced (once suitable code
> >> is in place) into a single L4 entry. And re-coalescing wouldn't result
> >> in scheduling-for-freeing of full trees of lower level pagetables.
> > 
> > I would think part of this should go into the commit message, as to
> > why enabling 512G superpages is fine.
> 
> Together with what you say at the bottom I wonder whether, rather than
> moving this into the description in a slightly edited form, I shouldn't
> drop the PAGE_SIZE_512G there. I don't think that would invalidate your
> R-b.

Right, might be good to add a comment that 512G super pages could be
enabled (ie: there's no hardware limitation), but we need to be sure
that the freeing of the removed page table pages doesn't starve the
pCPU.

Thanks, Roger.

