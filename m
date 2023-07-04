Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A917475BD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558525.872706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiNj-0007mZ-5y; Tue, 04 Jul 2023 15:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558525.872706; Tue, 04 Jul 2023 15:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiNj-0007kU-2o; Tue, 04 Jul 2023 15:55:59 +0000
Received: by outflank-mailman (input) for mailman id 558525;
 Tue, 04 Jul 2023 15:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGiNg-0007kO-U1
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:55:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 417c260d-1a83-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 17:55:55 +0200 (CEST)
Received: from mail-bn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 11:55:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5100.namprd03.prod.outlook.com (2603:10b6:5:1e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:55:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:55:47 +0000
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
X-Inumbo-ID: 417c260d-1a83-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688486155;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nmQaAiz6QSYVhN3X8b4uV8a+ul+In/2wS/ajFTR1y/Y=;
  b=JkCY4JPbD4C9xVThP12bNaSWnk4S0MCTXlvJ7N8oEsz+/LLzUdMlUFwu
   7XWW+I8zeIbnkeh9yPm7RdBN7Fntlmber8UuiEAqvHzmVZJU+g/7D28HH
   IEF37wwKd4dboVLZRS+83s46oxKTdP5nBMqR3BDyC8TWaGx91/zT5imET
   c=;
X-IronPort-RemoteIP: 104.47.51.48
X-IronPort-MID: 115548631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7GkDDKmF/ATInQknzuW2Ko/o5gy3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCj2Baf/YYTSmf9pzO9+x8xsGuJDcztUxGwE+ryg3QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5AOGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cAZFxscURexvej1zb64RdRcpJwHceC+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxH6mBNJMT+TQGvhC0FS4lkECEwIqcVKdo76AkE6zYIl+J
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAXInUFfjQsVhYe7p/op4Rbs/7UZtNqEarwhNusHzj1m
 2qOtHJm2+VVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5T2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:hyUpT699CFfR81n5qmFuk+DiI+orL9Y04lQ7vn2ZKCYlEfBw8v
 rEoB1173PJYVoqN03I+urhBEDjex3hHPdOiOF6UItKNzOGhILHFvAE0aLShxHmBi3i5qp8+M
 5bAs5D4QTLfD1HZBDBkW2F+n0bsbu6zJw=
X-Talos-CUID: 9a23:FhMVZ2D+k8yEIzn6ExVmy2UFJccXSHeewXvTLHKIKz5NFZTAHA==
X-Talos-MUID: 9a23:JkGKaQSziSwX1KE+RXS8jRoyGdZz/JiKAWYP1qwcu8S/bg1/bmI=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="115548631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpAZq16RbVrdp8UY3a7h5firUB3C4VrruZYunZDVXwKvQaF79h/1rdNPiRRyW4vSnt1P/fKcgZ8d+HfxFmrbn8QjTY0nvK48iRTDe6sMofUEDY8OELLUPmEJRjkgw0ARNznmN6TSaBOQhknJPGyoqA5L0vYk8rh0+4cFApFPWbXk1dOYl6x09Smkat9idS1BbKtX6NKdTMuxjV5t1C9+40B9vNQq9Te3hX+CinxfkxU/Ul1aW8Nf1GpeJG/ollAvKhIIvENEKneOWS4o9OfzM1+pUYX+alKW2lbofHja5GmONLHBIj3cCb073s3ZET19jyaP4Wfa1VW/Hkmp2AYM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YXhD+nWazyqIPf9QUc22wSfzJIADbl523pHct1rSbI=;
 b=YfpE7BDgLR1RJcQvN3pzuEx4PqWzH0wZY3xVLPnUX9ufHeLEzsGRY0JgY1Q5LODIrgmkgIN9iSRvMpNVUgHBt54yL3MRohU2nhjE2wMH4goeNNNirSiqKO2IzrZOzud6dy1R6HgSx5Cmmjux/bPYizJyHIQBRix6oWqrFOqcEU5avM1F10IRX7OIQgKjom8DfEJoPP98vqKkM4kvAyq0XElkVdrY5upWuz8m3P9yUQPHur1bjHmVUYzvhSNApSh6SIHf+C2N7u8RGXYxKnXEkUJiamD2MnAX4u9kswz+d0qS/6CfdksrVfX5O8HtIsqgeqyXdPq7qEu5nlikrMb8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YXhD+nWazyqIPf9QUc22wSfzJIADbl523pHct1rSbI=;
 b=CI4jNtShMEBE3CcYRPaVKGfQfTCL27h3VolNzkkSo1Tfy++oK7s95zvOINV7gkWT5fA2f4DCr7Fuo8XFTuEdB3TVC5zOnLwrTkyW2XbNDijBQiP6/n8WiczdcKVQDnLnEMzOG1EojtHy9AGfm9dXDwZq66rfN8ZzXiQ7zI03RVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 17:55:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Message-ID: <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
 <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: afc26fe2-f393-408b-ae2f-08db7ca721ee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8TLOJMouI+F9bQewc5dsWqTNclJ6i9lKBtUEjEkhUL0ePe9LGsEX46rQm3xn4h4E6rjtYeADwxZYosw02NrTPvpoyxZE2WOqk8ihBfbq09g0ZR9DznjT+/8fF/cRfxxiHfXtK/5vrJAZap4TsoHtEWMJcbc+lhNz9ZUFHQnJW59w70TEcyg87Uvvbo2upkJEfAALWYotnhzyTTWVOFu0iVWqplxDvFEJeED1Ac8Kk54WPtkv/wszTmvIt6bcJrX6shPX+2BC3/nbwkyDvhcyo2vsPY1qtcGpLUg8ZhWiOjc58ebaDuvabzL3rOtu0fANC5zK3QAKkhrX+afn5X0QX3LZawWcSQL/Jp4vi9dUWulxC3JZR6PyJyb9KfTnDC6mKkx+9MTcyES+B/guKJA/uUv++0qesZM6Ky+ZyA8DOIhPQpc7Xu5nHGeguskylbANogByJo2S3C6zIWnrGdmag55LJ8XpB9xuZu4V67cSdoG96D8vZfxa0X+fPIu5cLEKPh9z6rfM5gfpwE2FLP9LvXFgzgRAUo9eBpBCiHxP+78a74sl8dz/UsX91aufXVmx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(26005)(478600001)(82960400001)(6666004)(9686003)(6506007)(6512007)(86362001)(186003)(107886003)(53546011)(54906003)(38100700002)(6916009)(66946007)(66556008)(4326008)(66476007)(83380400001)(6486002)(316002)(5660300002)(8676002)(8936002)(41300700001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjNXOHI4NGhUU1VnUFBNUGxUQ2ZvYjJpUktNNzNJYkxZRHlDSU9XWFJBdER3?=
 =?utf-8?B?eDNqNTBKZ2VaeUNjS1VONEF3WFpnN3lpTlF3RXJqZFk0UkFFdWd1bG94UTZh?=
 =?utf-8?B?MWVpUHdqZ2x5YlFVK0ZVM3FybC9IS0szVmMvNDNSc2RXV2tpSk9sSEMvK3Fk?=
 =?utf-8?B?V3d3bkdOcVFyQk44dG90Tno2UGRXZE5BZkM3Ry93ZkZ3QmhRN0FFNlJReDJ5?=
 =?utf-8?B?a2xBRzFFLzN2b1FNcFJ0eHpkRHd0S0pEMHlXSG1HZzV0V3kwdkM1V0pVQ0Zj?=
 =?utf-8?B?VUxFQUgxMXU2ZXh5RXdiVlJsTkVielhaU05TY1hINjdnUFUvanBrOGMxVnRD?=
 =?utf-8?B?akhlUDFlbHBWOGJuTUFOV0Q0MEdXWFhUak4yNnhIcVlPdzY3MGtaMmVhRExn?=
 =?utf-8?B?VWk5ZTBmUFFDMEk3bDRtdkFCb0QyQ1B0QWJvOE90ZWpsVmtMYTQ0SDRmY1pP?=
 =?utf-8?B?K013bHFwOWo3VVNEM2M2bUFmblJ0NFVyY3oycGRPcmZ2eGV6YmwvZjJwWURP?=
 =?utf-8?B?ZEVXTDZrR2FiK1JXdDUrWmFaVVJVbFUvSnVVUXNWNmtlWXo5aVF4ZFN5RXBM?=
 =?utf-8?B?Vnh0YnhPaS9wbDk1Q3F5Q3l3UGQya3Y5eG5Tc0NCeUhZWTc5MTgxN1YwVE52?=
 =?utf-8?B?VmsxU3V0a1k4RmRMN3QrN1h2RllxaGMrQk91VlNXbVZ3Z2hCbjVPNjlZQ0U1?=
 =?utf-8?B?VHlNUWdsU3ZEY2lhKzFQck5tM1dzMzhVWVFZaHRwNUtiVTJVemFzYThHN3M1?=
 =?utf-8?B?cTc0QmxUN2grcWtRV1NyYXhTVGpLWER2aTJXYk1RRXBSL1VLUXY1bHBicm9W?=
 =?utf-8?B?Zmg0M25hR2lLa0lieTQveXZxUnUxTHEyZkNqUVgwck5qb0czTnBNOVBROVNi?=
 =?utf-8?B?MGEzZjJNMnpleEZVYzVhVUZ5MG1VeWlEL1FFdjZ6OXBYZGNEanpEOFNuK1M0?=
 =?utf-8?B?Znc5QytMS1lCN2F6YWVmbXFhM3BRTTBtano2WUVBV1pHaGZQd2FCSGprZnND?=
 =?utf-8?B?MHFJWVdKeWJFM1NFRGJoNXdQNE8xQ0FDdTJwanRadjlDaTFQaVZVUHVUK1JM?=
 =?utf-8?B?Y0ZjMWlJV1BmcVpac1BkMm9rUTZZQU5aTjhRU0gyOEdxM3VUZm04NnUzdU1K?=
 =?utf-8?B?c1dNZEdsOXovVlA5YnE4a0xRSlpqS2NKSis1ZmlENTQ2WU1BQ0hCa1ppUnFk?=
 =?utf-8?B?QlVmWDlMWjNweU5sMW5qMkhCb1A0RjZkb05WeTR1TDh0NzFjUXdWYVh6cnNx?=
 =?utf-8?B?dFlkVEx2bUcwNnpWNkQ3VVVtbDdCWm5FcWJDTkJIbUt5bHpXRmZqTzc3bGNF?=
 =?utf-8?B?aDFJL212cEJXRmhDVXlJZTlhdTlYWjhpRVNJVFcyOVk1Z3dTRFpnelJoV28z?=
 =?utf-8?B?WDRDMXR6bUpsU2tiUVlsMjhjRzBZaEdQNmhGN2IwVTFWb3JXK2t3K2Vkalha?=
 =?utf-8?B?L2d6Q2dCT1VEU1Q4V0hIakRsdS9jaURuVWs2eFUrZnJydXJ5K0NwK3NjUnNG?=
 =?utf-8?B?ZG1xQ2ZiQTdkVXBXZVVzd1dCNlBDcFErVHRjWW9pMXM5UGZUVzBjN1VRL3py?=
 =?utf-8?B?VnhDZ0hXaVJ0U25vOTkxYy9Yck52OTJSSUZuWkpVY1Nnb0s0cGFJUVBuYVRz?=
 =?utf-8?B?OHA2M2s1dFQvZmEvRWpQL3UraDQ5R3lYMktxcnQ5VVlRNkhjVTRuQXB1ME1v?=
 =?utf-8?B?ekRSc0FueDh1b2dPb2VZdVdFWEgrM2pSYmlmcHh4TGFSTTFkZmh2eHVCRFNv?=
 =?utf-8?B?QlMvb0l2OXh4SjlKeVBEdzdYQURMektOSkVSM1lUcklmczB2ZlRLNXNGbEtI?=
 =?utf-8?B?SFBZR3ZXK2EvS1owM3Q3WkhhOXlPMkJCYmc1eDJXMkUxazd0QXZBejU2Slp2?=
 =?utf-8?B?dHcyMjZoZUdoR1VGRlE5b2NvalNmRU42bFd4dVlNaHEwVWRyQnVyZkVURDA5?=
 =?utf-8?B?K1JZMk5Yb3lFbldoNHFrNkNmRUNOY1czTS9sang0aStjME56YkRDb05BMHZz?=
 =?utf-8?B?dUhxd01uakhBUXpUd3QwTWZ4RWlGYWRiUXNGNE5NdWpqZ2hXNVQyZ05iM3Ez?=
 =?utf-8?B?aGt1dTUrTHlVWlhqSE1XVFVUMHJoTHBLWkZnckMzUllpcXg1aGcvY0pwVnpF?=
 =?utf-8?Q?mAbsqFJWx5rPTxlXWulODA2p0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ClmpYMbLSCoIIC1+jbmSp5qMjCy4fVrqInZ1aS0bZTgBYYtIuTTlZcTG1XjtED/bh5QnWIYVFBxp4TrQAlfnKXx7qpeksPWfD0L8lf80vhh6h9kzEIHW2fUPXRdw96V6avCfg3O5R1XvYqbxXgP6xRs4hwHLSvCxV8KiMWATYI7EyWnGIq0qpnKLQjw34PP5m50aGFSpHB7r+1ReKdqTPB/xM9gYgiGAtgngnVRHkZiLsTQ3Qs0u9kgsovp0MYamdAoujyeGDkCTczGclM4bFyj3kk1jayBR9q6j/FyUVxgbFruhuPu5eeWPA1F9i/U7B7qd18xdihYJI3+DRNOxujw39hO5FOD24j91KBCqwb+f8He8UoKYUkgdnm2IQp7r7e1+MLrWZfF22KbpxYO2agKjpmHKUXHrzdcoThPfUBMcPlLre+lhWfBBPhLjs1lTzcW+fiskQZnhGHPNzeR+KOim6ACwdbuhUPwTs/AYwL3827IDiRTA3nzSV4c2NcLnMvAtZ8L2lRKpWo3Hn7r91FnO7fbDOs6HBkTpRU82Gvt52fnsM+Z3xILK5cGQIUArKEUr6cq5uqsRLFWyaL11a2uIun9Rx/RTGKFphtriQqceAZcCQMGfmvsYSkx94M3p6B6PvHmj1yMuDYYf519xpFzz32A4Br8HMHUoiOJwF/ak2COO9rr/XOnVEeBQ2EYxQYhQMRGAWR+MLOqbpLQd6olK80e5a1C2l2kiNPegL7iTcadCUZqWDQZM+jj4ECzCD3iaG15SwHZJ4+vnU7fSS6Tslom178hc/5TZjFk48RiNP1h6bchUNH6ek95iD1Lc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc26fe2-f393-408b-ae2f-08db7ca721ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:55:47.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCmAeB0DPYKyLXfPYZOABkfYCwNBkmaMg8Mtw/VpFmWMFPcyJV4wreqfCRJF+c+wvWtBFDeR0CMGrDHOGc+hbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5100

On Tue, Jul 04, 2023 at 05:42:33PM +0200, Jan Beulich wrote:
> On 28.06.2023 11:46, Roger Pau Monné wrote:
> > On Mon, May 08, 2023 at 04:46:18PM +0000, Olaf Hering wrote:
> >> clang complains about the signed type:
> >>
> >> implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
> >>
> >> The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
> >>
> >> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > 
> > Can we have this one backported to 4.17 at least?
> 
> Hmm, while perhaps simple enough, in principle this wouldn't be a backporting
> candidate. May I ask why you consider this relevant?

I have to take this fix in order to build 4.17 with current FreeBSD
clang.  I think in the past we have backported changes in order to
build with newer gcc versions.

> Plus is the mentioned
> "potential ABI change" safe to take on a stable branch? There's not going to
> be any SONAME change ...

Is there any ABI change in practice? Both fields will still have a 1bit
size.

Thanks, Roger.

