Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4565462E5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346344.572124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbOQ-0000Q9-Va; Fri, 10 Jun 2022 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346344.572124; Fri, 10 Jun 2022 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbOQ-0000Nv-SO; Fri, 10 Jun 2022 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 346344;
 Fri, 10 Jun 2022 09:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzbOP-0000Nl-N8
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:57:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8cdd1ce-e8a3-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:57:23 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 05:57:19 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5532.namprd03.prod.outlook.com (2603:10b6:806:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 09:57:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 09:57:17 +0000
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
X-Inumbo-ID: b8cdd1ce-e8a3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654855043;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KlzvoWa3mz/UGVKcI0VBG3vbP4TrYEIwUnKBu3qNbnA=;
  b=hLQtMnhWCup0cus/tXyMnb1amXIHaQ9Tq/caSWGNxnnelZ4PbVwFmRCI
   BRYhVvERFcGZWWnJ1GFyRcO51b8F/qZublQm9pM0JTV5Jra4HHzVi3it/
   ms88BOLexsP4O1vj725Rm1gqtBx5i09AYMvO/IFJobHZzN2PQ+/4BJsWp
   U=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 73152418
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q6pmeqKy9qVYkwj/FE+Rp5QlxSXFcZb7ZxGr2PjKsXjdYENS0TADz
 GJLWWHXOP2OZWr1fthzO4jn/BsG68LTmt9lSwBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Ncw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NdL65qpSA4mArD3mO9FWilUPTt6IKITrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvqUjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKmLmcE8QL9SawfuzD96ggu1bfUNoTUfcCnav5xk3e4u
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwa2N5Q+cXzEAVmQYN4Jgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:jICWmKkVC5Mdu4nrpo3E2IsJFk3pDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,288,1647316800"; 
   d="scan'208";a="73152418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvouZJgs3TzbvE8MLxcsI3zfEuEa5VtXVNSMVtBP/933rt+OLn2n4ZsuYWKC1zPRosgnJd7Yd7MJIWdDP5ptZE6Q78eePg7nSqFi2lzGIc+YnkZjfX6ksgV7GJ9uAdmdKzj8h15DMAlTpWq/GW7HWyMn2SXx6g34m/6euTCShXqn+yBWHR7kKSLy4N/OQIgPoG/NoWTYOWnx+Whp5WUku8x7+6Zhba/VUfqfhhq0XJuvj85hxt1AUE9OAmENCBUhmdG7FeCuZ19nPyFjQZ4sw8f8Ljhipk4DF76Lqiu0q6fvmFlHRfCmfZp1q7ncYmRptayhDuI1yte6dRp48uISug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAdz/fKBfUohqW4NY8nypDWZFJbGBsWAmpP3H1gnypU=;
 b=OTcbfaJUa5MYfDsE6RhKfVu2Sd9/twU05qe4NyDdR+WhuHLIGzb0HFqmgOTSU45DfryndmRyqWlbUYpH2+6tG/mgpKFa1loNL7Tl7CbUEVwRH3j6wgoVNvzlvZDQaDvDjjgV+F16YH2/VncgsoSzD/xm05LSQ7Y6qOATaToxtQsnPdTBIzw0Z5+4Cm0qEPiHiHnDfbnyWJssVx7/d0nFYqYJ6aGqrQ4+K/gQQFmQbEwEla9lCrF4gIyM+HZcFvbW9nMqKcn37SUqtsNdkaIllxVGQeqMTAGIYa01fQT+ZGo6YBWkQ/iz87U1Wq2D3bN6uWj/Zn7f8SqGAQecZEOSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAdz/fKBfUohqW4NY8nypDWZFJbGBsWAmpP3H1gnypU=;
 b=uuIVgR5s3Im6XLxm45KJUY/0DqgNdnFQij4l9+Y5oXtpihdFRdnCqGQUXXRq4BzRijTAXrkE3h+UjXDFgk6Z9bfHN8/fsBc8dXEFc1dNZ6X00jHGZLN1t/Ndv/AFPG9H8Izv/esMDDNzK3q2PKFfKwQF2cjqBhYCjAYevS5f0jQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Jun 2022 11:57:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU/x86: work around bogus gcc12 warning in
 hvm_gsi_eoi()
Message-ID: <YqMVev4YlUiRTxc0@Air-de-Roger>
References: <52090c8d-fa21-6f53-c33b-776c12338f62@suse.com>
 <YqLwpGXxCHy5HJpg@Air-de-Roger>
 <26f619a4-d0a8-7895-2017-cda17526b48f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26f619a4-d0a8-7895-2017-cda17526b48f@suse.com>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4888c09b-be31-42ba-d59c-08da4ac79a8a
X-MS-TrafficTypeDiagnostic: SA0PR03MB5532:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB55320BFEDFE70F6E65CED0B98FA69@SA0PR03MB5532.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bfmJ1PdiIleEaT0/y6oixTERvt8eXMJFBO/7CfZJQ2BUGbOkIWPoTtqkHGDYrugptfuDqOwX/QyERVlDwcG/zm8TnWYbj/tiwt2ehEFh033VOhPJfPCMWb9b0DSnIY/a9CQmjomqICMvbsE3OJMstNGbx40eBOkT5VbDFMSJQGaFqDcOMcbFWCpzkscECj4Uks0z7lnJd8Yls40wZ8DqkBWx+rC5OTel0N4TuipsSa/yQ+QA7We7vTaq+JNPOi1pM+pBZAgTVD8JuxMT1O1TAbYfeuyF/tWpdRWDYfaKX4kyhAk36YtXN4jISmL6smnnezSgx1K9BZJClpQcvOMKqZLhar/8epcV4bYiC8gtdQpgjJsZ/TVHNZp9JpmtKNxGDrySj0gvYVJfWxgesi/Z4ot62LxppgJmho/5W3rIL3MR61cV8AIe4q0WKyET7UXRzFTDWdMO3kKOi0124YI5CURAQbpMDn9IaZR5pj6D04/pHq6P3uZMyEErG6d3e10eM/We8BtZDK9ZRU4O5sbeizchYSgntheXIvucR8eN+btvAEWPaQHDiiOOtnnTMXexH6AWPK+0zcv6I9i7/agkntSzjDUCuRcFLX+MHHlWlKZe/lMstWCsSA6Epdb8V4RUpyqgEZn+LsMt6bbzYd+c9yptq6xRmHNK5v1arc5XiP2bExN3z1IzVBGTLxw+aaWBpyRP3g059L8IIO0T1JFMMDA/dgub2aOxOTl/cR9z4Hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(966005)(6486002)(107886003)(6506007)(26005)(186003)(9686003)(6512007)(85182001)(86362001)(33716001)(508600001)(5660300002)(8936002)(38100700002)(316002)(6916009)(54906003)(53546011)(83380400001)(6666004)(82960400001)(2906002)(4326008)(8676002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVFS2RSWG8yemZqSVpIL2dyN21zZnEzVEN0VjJhcGJxQ2pUVmRVTnNBQ0FV?=
 =?utf-8?B?Wmh5NW0xWExsYXFKalAzb21sV09kV2ovaTNvQmRLUk5sa3YvaTF4ZlRLcEZy?=
 =?utf-8?B?eCtNaVB0NHNuMHF0eHlPQkZkOUJMbXUveGt5NWkvSEZBNWFaRmV5QUpQS1Zq?=
 =?utf-8?B?andoeW0vRnFESGY1VHFySDhnUXpDZVltQkordDdHN3k5SEJDSlNCTGRFTUtw?=
 =?utf-8?B?Z1hCa3BQWEN0cXZFRFpSQXEwdDBVT0R5SmZsOTBHNlhyamNIaGZzbGZTQzQv?=
 =?utf-8?B?djBxQWVZL0pZK1BTRFozQnhaWXl2SlpoMXZsbCtsMXZnYi91NFlzbklPWUtD?=
 =?utf-8?B?bkIzR0t2Qmh4MTJBWU9hZnMzQ3Y5MFl0WVk2RlZMRHVnQnNiNWhzcUJNMWRL?=
 =?utf-8?B?MHJWd0Q2Z0cra0lPWVV1ODlpdnZjSGJwNjJldk9qci8yVlZPd2hMMWltZnhM?=
 =?utf-8?B?QitIMldzWisyclBjaHdYdVdHNWVETkt4YjZxMTlzMVZDU0x3a0t6UDB4ckdS?=
 =?utf-8?B?R2ZPbXRmeXM5eDRlMVA3UlI2U3I3VTgwZUNaWEkxUXRLbFpVSGJxNGdBbmda?=
 =?utf-8?B?QXIvcThGUHVPNytWQXE3Vy81dFF1T2FNSTRVTFY3bGVnbnpta0JaNWhveGVF?=
 =?utf-8?B?Q1JlQ01QL1FDZjRhellQWVZaWlk1WVNNR3JsOEQ2NWdQZG44SWd5b3pkYzVl?=
 =?utf-8?B?czRtMUR0elZ4aTZPd0ZhSW1yaHI3bDM2MGRXMTd6VzVub3dPYmpPQkZpRm1J?=
 =?utf-8?B?WjlDblBaaHZIV3MvMWFjOWpldEVBN1JUVFI1eC9WbkEzOEZGd2plRnM2NHgx?=
 =?utf-8?B?SkhxVWQ2aUVPVDZCRERFM3lrS1lsOVBuMGtmZTZNdUw5Z3E4NVFPOHd0RUow?=
 =?utf-8?B?ZjQ5UkRjREptekxsa3Z0bkc5SnA1cFh6SVFocXRFM3hQbVkwWWRLTzJrL1NP?=
 =?utf-8?B?R3ZDQjlVTHdQWUd5NjkvR0V5UXRqenoxWlFkZ2NDbmlTWE5DSkR6NUxvMzhF?=
 =?utf-8?B?aXQwdWR4bjZTaGNlTWhUTXpqS0JVU2t6ME9YVjQwSzJlRHFVTmdnVUhzZzJz?=
 =?utf-8?B?NHVWbmhlWDV4MDhkRXlPOUNuK3dHQzlPMGF1WHR2K1MxSkJXYWR1L2R2OFU2?=
 =?utf-8?B?dVdaT05NbGdjaHhjNDNZRlhCb2s2LzdYNE54VnFSajBEM2w0QW5vL3JBWGo4?=
 =?utf-8?B?eit3Q1NRb0xLMHZta2JmakN3a0Y0ODZUQ203ZldaSHE3ZEdHTmNndllTTFoz?=
 =?utf-8?B?QjZjandWZEMrK29CVnpNWmRjUmRZTXQ2K2g4QmtxT3EwZUdJeDE5d1NCdW1W?=
 =?utf-8?B?d25iTFBleGVSMkN6eHN2LzgwTHpONjJmQXBrZzZBbFpWRWVMRWNhSmo4ZWNY?=
 =?utf-8?B?TGZpWjRCaEcrVVY2Nkkyd2VWREdEdzh5VTh5UFBndFdXTGZucDRwMHY0YVhL?=
 =?utf-8?B?Q2JIVWZDM0dka3lKRkxCczBoaFNuYTZmSngxMFY4b1E3STlVZTMxditaR0hx?=
 =?utf-8?B?Q2dVRXBWS0hjMGZnS3JITWRrTm5jbFRLcGVMc3dqNG4vM1BPUStzc0hEY3Vp?=
 =?utf-8?B?RSttTjdCOE04eEM0Q3FrTGxoWnFUaTFYNW96Y3BQdEwrejVaQys3QjFHelhK?=
 =?utf-8?B?cnBQNVVKdDRJTUZxalFlMVFHZjQ2R042TUxZbDhjY1JMZ1U2OFduNDhzSFdr?=
 =?utf-8?B?bngxcnNZNlZRb2lkNXJlM3REdUR3ZEdaUnJDZC92cFFLNmpiZzU1VU1rZ0VK?=
 =?utf-8?B?L3FhNUU5UVh0ZTRucE1HUUpCcStZZkp0U3dxWngxN2FmNko2d05wR3NVdHNG?=
 =?utf-8?B?WWNZby90dUZNRFJsTFZ0eTZTV2h2c0tQdTRqR1JRZVpSTFN2b3F3SGYxSmpG?=
 =?utf-8?B?N3JTaXdPWkJsZ2pyaVpUUGRYT211SkFnelo1UStoRDFNL00xSStidlRkbFJz?=
 =?utf-8?B?TEpNdWxKRjk3dGFmZ1B0STl1MlBTOGhGQTdjZXhScTFQek9jbHBMaExEQncv?=
 =?utf-8?B?bGE2eUpLYzJMdjlJM3pVdm1TVGpwZnhFSTF3S3BnWENzU3c4TXZWQW1qYTZW?=
 =?utf-8?B?NEtSZWs5SnNJNVo0MCtkYUNCVnhGaFh4bTdKenpoUkZ6TnM4V01pZmVnOFE2?=
 =?utf-8?B?K045WXN0OVlaWndDTXhKU1pnWGNpMzkycW5ZWGpUdElDOXdXOUJHTGVrV2JG?=
 =?utf-8?B?dlJZR1RaemlQTWhvMmlSUlZoNlI0ZVhha1ZqWEk3czZ4dnpWZEN2S00wWGJt?=
 =?utf-8?B?NEVEQlYydXJKMVRVYzAweWE5MXF2dk55T3kyOUxsVVVDVVRTUEtoaFZzYWtM?=
 =?utf-8?B?VFA4Y1NQRjZORmNWNHlXamkwRVFxd0V3RlBrc2ZQcGdmZjIvc1NiSFlpaXFn?=
 =?utf-8?Q?5MG1+4BDgn78CJ4E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4888c09b-be31-42ba-d59c-08da4ac79a8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:57:17.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDwAt8gS7g8RhW4hc03u6+g3NFZxXt1Quu9w/mplT5Kd/hzbSXIMamhoRrGBFXYUehoNrQTRQRMujCiO4pKggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5532

On Fri, Jun 10, 2022 at 09:29:44AM +0200, Jan Beulich wrote:
> On 10.06.2022 09:20, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 12:37:19PM +0200, Jan Beulich wrote:
> >> As per [1] the expansion of the pirq_dpci() macro causes a -Waddress
> >> controlled warning (enabled implicitly in our builds, if not by default)
> >> tying the middle part of the involved conditional expression to the
> >> surrounding boolean context. Work around this by introducing a local
> >> inline function in the affected source file.
> >>
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967
> >> ---
> >> This is intended to replace an earlier patch by Andrew [2], open-coding
> >> and then simplifying the macro in the one problematic place.
> >>
> >> Note that, with pirq_dpci() presently used solely in the one file being
> >> changed here, we could in principle also remove the #define and use just
> >> an inline(?) function in this file. But then the macro would need
> >> reinstating as soon as a use elsewhere would become necessary.
> 
> Did you read this before ...
> 
> >> As to the inline - I think it's warranted here, but it goes against our
> >> general policy of using inline only in header files. Hence I'd be okay
> >> to drop it to avoid controversy.
> >>
> >> [2] https://lists.xen.org/archives/html/xen-devel/2021-10/msg01635.html
> >>
> >> --- a/xen/drivers/passthrough/x86/hvm.c
> >> +++ b/xen/drivers/passthrough/x86/hvm.c
> >> @@ -25,6 +25,18 @@
> >>  #include <asm/hvm/support.h>
> >>  #include <asm/io_apic.h>
> >>  
> >> +/*
> >> + * Gcc12 takes issue with pirq_dpci() being used in boolean context (see gcc
> >> + * bug 102967). While we can't replace the macro definition in the header by an
> >> + * inline function, we can do so here.
> >> + */
> >> +static inline struct hvm_pirq_dpci *_pirq_dpci(struct pirq *pirq)
> >> +{
> >> +    return pirq_dpci(pirq);
> >> +}
> >> +#undef pirq_dpci
> >> +#define pirq_dpci(pirq) _pirq_dpci(pirq)
> > 
> > That's fairly ugly.  Seeing as pirq_dpci is only used in hvm.c, would
> > it make sense to just convert the macro to be a static inline in that
> > file? (and remove pirq_dpci() from irq.h).
> 
> ... saying so? IOW I'm not entirely opposed, but I'm a little afraid we might
> be setting us up for later trouble. 

Sorry, started replying yesterday but had to leave and left the reply
open.  Then when I came back this morning I just read the code and not
the commit message.

Hm, so ideally we would also then move dpci_pirq() to hvm.c in order
to match the move of pirq_dpci(), but that's not possible due to that
helper having other callers outside of hvm.c.

We could always export the function from hvm.c if we gained outside
callers.  In any case, I don't want to block you further on this, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

