Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8F7BB9F5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613675.954374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolVD-0003SV-T8; Fri, 06 Oct 2023 14:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613675.954374; Fri, 06 Oct 2023 14:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolVD-0003Qb-QC; Fri, 06 Oct 2023 14:08:27 +0000
Received: by outflank-mailman (input) for mailman id 613675;
 Fri, 06 Oct 2023 14:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qolVB-0003QV-Iv
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:08:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0c90aa-6451-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:08:22 +0200 (CEST)
Received: from mail-bn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 10:08:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5799.namprd03.prod.outlook.com (2603:10b6:510:34::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 14:08:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 14:08:15 +0000
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
X-Inumbo-ID: ce0c90aa-6451-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696601303;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hLaLOttSCGaxBHvU5ne1YJj5o+FazEShSayYlL63IIY=;
  b=chtu6WZP/61w/UrAYyV8M/a7JdXNAJ4X151r7Puu1q2dzw1Ih3vwnp8L
   xqsHVnHsjXdP6Y0re73ZbAP6HvIH12/faJGnyJKfBhs7HyCnPfzCEiSjH
   a+g7GVv2n9cxNelLN7bI9KvXWuFYI/81dMNQrl3BWY3eIIx+/fRS4h3Wf
   Q=;
X-CSE-ConnectionGUID: 7wOtqKa1ThaNgP9muXAF1w==
X-CSE-MsgGUID: 2DumwwloT+6qGC9SqUeF4Q==
X-IronPort-RemoteIP: 104.47.51.49
X-IronPort-MID: 124088147
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:iZltVqBPX3sTUBVW/+fiw5YqxClBgxIJ4kV8jS/XYbTApGlx0TdUx
 zBOCm6DOf2NYDbwct4gPYTn/UwEu8XcnNNjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpflQHXht/
 KUkKDkrYSjSgv+G6ZziVbw57igjBJGD0II3nFhFlWucJ9B/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI/OxrsgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPfrir81raTwksXXqpIOKC96eFuh2HQmHU8I0wtTGa2j6WA3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU3313qudqDqpETQWKWIEaj4JSU0O5NyLiKE+iAjeCOlqFqGdh8fwXzr3x
 li3QDMWgrwSiYsB0fy99FWf2Ta0/MCVH0gy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:YXOYkax6W1LPUI8U0aWiKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:owqpBWHTdUJ8/4WHqmI462kIA+MsK0HdxVHfGx69FFZAZuSKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AZdY8LQ+U7LKtNvNZ3zXWf2yQf51E/qGxF0QKrdZ?=
 =?us-ascii?q?YouavZBdpBjqz0A3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124088147"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDxzHGUIETetSi1FVmaeuPlzepjY+iGfUw6C185mxLZqjKrYYj6t1m3xGxMT21dBrRbagrlZ8NDNln3cQXUJVrKEMIgj+YLkaAblj6OLx5QUKuP3E8yDbZnWRsDTcJ/98YomVLEHGPU0+Bvkj1Cqc0JPTMz68k0OBY/Vohxqd8cq6+Z8vLrSVXISraEyPNcE0x1aGPQZ04jryW0X9RZo+Y1u2sKas7BkDAb2i9yMxHMmVsvzP8GcJyNdWtSqUS6ewCNzj+4MVr33FZs1kf2S1SnPDqT8eCFWPaNibiwgkyalM05l7uoR+RtPemI9cd03rLyNmoZT08FeqLNHzCz9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+kbasoiMuZuVNyadTFreht3NdfuCowoZRPYdR7aD4A=;
 b=gqg6XeqCg0yJOT+Z6YMChSwEU2qzGWgjlsvWEYz8/I/C21eHaO+Pf3CAdP0s3PKSJTqqApgiE44N9QHr5kI0aSt68hfUw4usuQPFz7dNJ9dQZYIHXsZ27FBL8VyqKeehI+nv3PYIXdJa/FMIeMhJdVwmZLQc905aHkzMiVn6OffKV4FxW/wV55HudxtWPvz9aXUZrEGxmW2N8EEi2F0PTuIYg26HFDEGkqHj0Wj0UZ9KUEKTJhl0KEgi8WpdDJzjnw7nZoNA1BIUca1gUr00CB9/aezYZ3Ako7NRTMGB/j3h1KWLZsKe8wM63ru/xw6SZY2l5ShDQ/7OIHtmabTh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+kbasoiMuZuVNyadTFreht3NdfuCowoZRPYdR7aD4A=;
 b=Z3nXqCTpmmfdOFiV3scnzZZufVJW/74H/yuN7CNz0Sm4NBhbA4EcPyBJlckNUcSudKiYRBXIY74njF2a8tzZmEl1kRU7dZ17NKh/BNees5yQfnHYWYXzvtGLClmI24kYeM+xuL/BJA46lzY0IZlmpUNuCOQKzDT5L+gFW60x4J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 16:08:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] x86/memshr: Fix build in copy_vcpu_settings()
Message-ID: <ZSAUyoq8pbam2nZ-@MacBookPdeRoger>
References: <20231006135745.1038947-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006135745.1038947-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0248.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c2f289-4992-4d97-d52a-08dbc675aef5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgHszvzZXVv29HcHThKjRR0bk6niHGZArmg7Sax1k0Cw/Fu0s2HYYhUyl69YEXn+Dx8HzEiANDx7g+CyttmeQnmTPlIPoEtmk0yebppbLH93x1BCKD0t1LIVBUkLnfsCLlGJmKFdp584nd6FCLAGxWsPtnQ7HJgOhbuo3jx32QCvlpYEvqKIasM7YJPU0RkYHTVcJGm+/WRhxH6N66ZYEtgqWCQAAlQsFmAENvlxeXc/HE0rJ4TI4VjKUtZd4qyzxusfLekexA/0U5dbMqa7WbZXG06fYcmQ3RU9NeYxWod9CqNRhHacgKP1VMTLeaOGsceUOgoZjeu0LQbkb27Vw8dMce2cIqWxQ1ehxMWUM4sBDynnwVV0uZuNRlng4mCLyb9wQ2s3sp4ta7vDJes+TuE3pfgXdcF+P0CNIS+JG0g4u3VWg0Ls45ObT2etQne2HxqKs+/EQ5WNyg1nDeAqmm3tOKV5HAmPlo/p5oFhPpPghY85/mvtOj9IVs09CO310UzTAOQ7yslSxgbttnCboCAVknGlW/C/evAqgZgKb6bXHVPfw7k+jIfgEx4nYCpK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66476007)(66556008)(6636002)(41300700001)(54906003)(66946007)(9686003)(6512007)(26005)(6666004)(85182001)(6506007)(38100700002)(6486002)(82960400001)(478600001)(86362001)(33716001)(316002)(4744005)(2906002)(4326008)(6862004)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTgrNmNKNm81TDd4ZDlzTmpLVklZSnhnTEU3cWVsVGtlY2VWYVg4Z29LbmVs?=
 =?utf-8?B?eW5hWmQyQUNCcGpCZDdsa2hUU0ZYdTIrS0FIVW8xeTZLNVpYeGNzQjVDNE1F?=
 =?utf-8?B?VWFaWjB1Ry9ydW8rSWV6Y2JTREZqZXJCdldFY2JhRHpIQk84Z0Q0dTE1aUZz?=
 =?utf-8?B?WCtkOGtIaDNzUHFtRnhtWGtPS0tsbWdSZUVWRnlvVGZJeU1IcHI3VEpiQjJB?=
 =?utf-8?B?OU1oMEhlb1JXZVE3elFJOHRzOW5COHlySGNPZjR1a2JtRUhJSVoxai8zNm5Y?=
 =?utf-8?B?K283dllNL0lRS25ZQTVxanFEVTYvdEkrb0hJTElxUFVyZTFwcExhajhGSWkx?=
 =?utf-8?B?eFFOSlpURFRDS0dFR2Z6bS9PTGxJVGY5Tm4zbGRWbUR0TXB2ekpaT2lBRzMr?=
 =?utf-8?B?V1NpK25Vc3R5M1U4cUdwd3lPbHZSMUVleE1waTQraUtScFErbjhqSDVPSVJY?=
 =?utf-8?B?WWlqZDExMkM1dWpoZmpYWHUydDl1dXU1c2pkbG82MEExZWUyekw4REdZZGlp?=
 =?utf-8?B?WXlNdTNDSzdkN05QWFd2a2d6YmM4Z2ZiN0h6MDI4dHNOYXg5YlRCK0haUXpk?=
 =?utf-8?B?cWNISDQzNnUvYTRoQk1oQ0ZsR1YyS2wyYlo4b3pXL1B4ZTlsSGMzY29nbkky?=
 =?utf-8?B?SjRvTVFUR2crRnowam54aGZOa3RCaE1mMjR4VzltemxXTkoyR241QkNBUVQz?=
 =?utf-8?B?c2VjTzJkSTlGakk1ZkxiNUJTZDN0TW04TU5IZlE3djhQbHYvL2NnVGtPUXF0?=
 =?utf-8?B?SFRXenpCdjFRYWFBTGRHRHhUS0V4bEg1MDB6KzI1QmhRZHVLQUpWZjd0RGdB?=
 =?utf-8?B?dHZia2JVelBmL241TGVQclVMeEIyTXJpN3V1dG1aMEJOSU0vVHlDU0dJNnhM?=
 =?utf-8?B?RnZ0UndjbHlFV1k0STZYWmF0NXo1VVpYMnJ6d0tvQ0gxYkJBVDVqbTY1YnRj?=
 =?utf-8?B?WlFIbkJITG15eWkzdCtNS1RVTDl4VTRvSlFWRmFtempoM1NxUzQ1eU5Kd0Nm?=
 =?utf-8?B?bmlFN0dzTnVFWHFhS0RyVE9haHBtZEpkeXlYTFpybHdBb2d5cktrUUJCNHJy?=
 =?utf-8?B?WHlCeFhlM3FHWnBEMlhGcVU2b05UakpEZWc1cDl4RUlKNkVzaGxmT1RCM2RL?=
 =?utf-8?B?RHFMbzQxZ1piMXhCNU5LeVBTNjNGMFYveEtWa0pNRDl4Y05hbUVhWkF4K2tk?=
 =?utf-8?B?Nys5TWtQdzNQNHB4SGtSUkt4OTRPcURXbFBqditnMlZYa25keklUanJ0c1RY?=
 =?utf-8?B?ZHQvZ3VINGYzVTdMRllEZFloSzdUSTR0cC9qTkxtUHZuSktvVUhYZG12TlFm?=
 =?utf-8?B?MjIxbHN4eG5sRm1wVXZVcndLdHhDWnBsbjIvWkhra0hxeHFRblFtUlV1Mk1a?=
 =?utf-8?B?M1UzZ0xKeDYrQUxURjlMSVF0cGFlOCtTMWJXdlRGNWpOMUJpSTN4cTVwa0xh?=
 =?utf-8?B?dWNKbFgvNjl3MkJHYTJVLzJlM1gvRDZ4SDFySXMrUDQycCtwU2FMNnVXRExU?=
 =?utf-8?B?L0tmSjhiUktyRDIvVmRtQlNNNm5pdUQ3QW5jaWU2aUkxNDVsTERuQ2lLUTdF?=
 =?utf-8?B?OE5lL200SFU3WFZQNWFSOGV2cXBuT0ZEN2V4VU82eHhDbkdLRXloUlZ0ckVZ?=
 =?utf-8?B?NUpPY3JJVjFDdjFZSDNyL3NQdjVVbUM3UExRb0dzcmlQejEyZlFwQTdqbjlv?=
 =?utf-8?B?OG44ZC9BNVJmVHhJNklzTmJtZDdFeVptUVhpQ1YybElRZFQ5c3JFOGJHeTk3?=
 =?utf-8?B?WWJBNWUvYjdqOUhvNlVuRTZ1S3UrRE42UXE3RFRHczhWVGMwOUJDMk5aUDU2?=
 =?utf-8?B?WVdrdkJ4aU9HRXRyUHRjR252Qyt0Q0NGZUNaVDhjVjBoa1ZYelRtVkUrVHZD?=
 =?utf-8?B?OGZiTWRWWExRMCtqNWo2NTd6RENoekcwTzl2eVVmTDN4ZHBrV2Rhci96U0Y1?=
 =?utf-8?B?Mk1mdk5pUHVtWmRvY3RaUDJEYzVCbTJVUUxmaHk2ZXg1VjdiNVExb1dXcFk5?=
 =?utf-8?B?YytLdmdlUlRrOHRWeVZPVHRPYXpWcE93QWU3OFJKc3l0QWJudEt4UlRyeWg5?=
 =?utf-8?B?M1lwREcxSDZEekNuU0o3VXJsMDJDTU9vdTZZL2dRQjJ0S1JuTVVicGdIMTk2?=
 =?utf-8?B?RkNNdEpuc0hRbTZCU2x4NWxuRUk3cHBkUEV6N0tLS242ajdKV1krOUpqT1Jj?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Tx0wMj28AiQbYmGd0g1/KxC8eLMR1IqPMKyJS4pylbyL7K9sypZlojADySnjt59/ag6WNH1uyxVNoQx88XJAIBPSCwnevJNB9JDgi99ii5+LQ0SPFkuzp3tzBlvPOnPM7MxDmuPg8jb3lU0/Kyt+ODQGrTpFPUgHcFPRiOi72aBTGvKVAHpeQu7ZpYecwQjCDENgMbVb7Pp5ZPcYe9Cb4jmmbvSBmhZyEQ+8BW+chYwk86tRdsqa09b4/XMuvPpNaICaEYBNCXVKjxo76HHV2kew5v5UAnV6evU8g2P80YFFXe+zvKdIQIXUTzhuRFk+wUPZ4vmXr9ONPh/E1Iu25zuFafgNKLL52MgcnZIDLJnnIYS3eltdAaehdaOmuPPz485Em78DBn80FRHhR3ty/fs5DpXgyDHOPk7xKoWPT7X1v3BYRtV4EKx7rzPoVRohrXx4iOdhgtjyRw9afmFAeLUQbo3dYMf81439Co4fp7amxMCTXLy5WE34feQwr3MzeIgbRtuUtOw9itP3QFxhSwYAqNMRpSs8Gj2iD7foB6j/Rrudch52QPF/ZHmjVzX3kRopVPzseqWousCj6SlnxuZtdriKnTuq36JKZoAwC9d4kllpFtgfJ92jl7tBxTlIEUY0HC4vw7EmjKMsZnpqCbnyvEEe0EZYLJWc2gbMxVnUnm5hvUFWyeGfw9grDoHVED4z30D4XrLkGh8pfYt84bJBsiDcX+1VBsiog35hUbk1T0UTHQ+HasCujd5zTjWLzqeJg8HaZI0sPynUAULaebkMW60Enf295j2p2JOVBm7WzaP5aYQw8+w5pckOUqv1kHYjfh20hspRm/21YikupCM2dei/DL72IlxlLzaCti5pdtpTMqdoWLJy9J+XE9g
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c2f289-4992-4d97-d52a-08dbc675aef5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:08:15.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeuStyh6LRgxOLSCKCpplp5qaaywkgNC4vzntu7MCXmy9qPPW/2mpwMFRJPVWa+c0IX3uYN5YAnhjK+5Me6ipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5799

On Fri, Oct 06, 2023 at 02:57:45PM +0100, Andrew Cooper wrote:
> The last user of this variable was dropped.
> 
> Fixes: 295514ff7550 ("common: convert vCPU info area registration")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for noticing this.

