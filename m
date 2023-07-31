Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A94769756
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573043.897341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSmu-0004iz-6A; Mon, 31 Jul 2023 13:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573043.897341; Mon, 31 Jul 2023 13:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSmu-0004gI-3N; Mon, 31 Jul 2023 13:18:16 +0000
Received: by outflank-mailman (input) for mailman id 573043;
 Mon, 31 Jul 2023 13:18:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyhG=DR=citrix.com=prvs=569984122=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qQSmt-0004gC-4V
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:18:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b348a9b9-2fa4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:18:13 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jul 2023 09:18:11 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6501.namprd03.prod.outlook.com (2603:10b6:a03:386::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 13:18:08 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:18:08 +0000
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
X-Inumbo-ID: b348a9b9-2fa4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690809493;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Eh9JS1SrBDY5uy3QTv7zdeTIWuWQXr6sd44AVYXwRA=;
  b=C0tWvO0Cc0ZyMwCiX7PGMjHya5y6+Ps73jvjUn47FVuKS/969kCMQOMn
   rAHi2ZMyoe9lV8KyfO1HreoZtWALGNes4IjpzlWWz3zdty7/eLMAt1JgE
   URpxyKPYw9QIDwagwMHULXlAjX5V57j8gsIWeEhiTdrQdM5b14C4qdGmd
   k=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 116680187
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/STvSakqM7CICODrLlFA4Jbo5gxlJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCjjVMquDMDCnct0nO4vn9kpU6sCGzdBkHFFqrCw2RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5waGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aEmBQofVhaevdyrmZuAau5wr54TLsa+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC1WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTePmpqYz0AL7Kmo7FkNKckWQoMCDhWWXXOxwb
 HcavXYNov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDQceSgEI+cXk5os6gRTGVN9LGrO6ldDzFnf7x
 DXihC4/jLIXhIgV2rmh/FbGqzixqYPESAFz7QLSNl9J9St8bY+hIoautl7S6K8YKJ7DFwHZ+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5eEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:hf5rz68VEdT67md6J85uk+AEI+orL9Y04lQ7vn2ZKCYlCfBw8v
 rEoB1173HJYVoqNU3I2urwXJVoOEm8yXct2+ks1NSZLWvbUQmTXflfBOLZqlWLJ8SZzJ856U
 4KScdD4bPLYWSSwvyKhzVQvuxQpuWv4eSDv8+b5XFoVARrY6Zr40NCDBqBGEEefngkOXN8Lu
 vk2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3A8q5xWmqzULGEIaKQ2dCOeMzmUZ0bX0fP9HHNGXG?=
 =?us-ascii?q?lUE9SaLqJYAWg+qwxxg=3D=3D?=
X-Talos-MUID: 9a23:XE8McQZsSXGFtOBTqWGwoy9JNf5S7I+HD34i1q4I/JWnOnkl
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="116680187"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLC7TPCgdY1d+ZLk9M1XvV4S4ti4MOYjcubZVfjPAc1NFLik4wtq9c1zV9vTZnon0bLtZHsMBlcr4dGLp+mwxgw1hP4a1L1yGNqdoRlNA/gGhQ0eg2jbSeqNCXTfNZnsLvzGjg4BM+i9ak2qSvoxciisRQmDfj4+t3+lp9h3HfiJPWD1b1JNKDOX4Bi8gj5JIbptbZvNvn6YeG2vrUCyW+peIMl8k+T+4sdqGBJ92tSqnbPpiRjNZNtCiZnCp9IsXFUugSZKkU1E8D/UCxFfMdxYG9P3/ZacmgpiDo8QM7vosjeDMAaub//BReXDe7K2vFtfuNsz3pCydOWmPzc1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Eh9JS1SrBDY5uy3QTv7zdeTIWuWQXr6sd44AVYXwRA=;
 b=OuhTzx91k7/oSVTXy/O4aCJ4SwyPGl2FdDSJ2CKe67acl0hK7zM6yTK1cstQoioJ848QVCJraXr9hLLdhRcXJ22YmRIycptWCZldJ7cFg0Ksb1KQV9SEONFo8awM0HN3K5KV7XOZOWYBBIY0jS6fG5vhK16+vWhHhnnvYxqRTftra89JPzZvHnC6oW86zTyHiAfdYzJJjqawNL/Q5kPkCfcd6b+WEO/bIoTdcXGMGWSGeYRuege1Bdx+tkUptcrhp24Azbi3RBAqF16Fw9ipddN1ocOMm2M8OryGfdAdSpKB5NFzgWVZEC3O4oM4Pph5vViA0QOQQb66wMy6t3AA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Eh9JS1SrBDY5uy3QTv7zdeTIWuWQXr6sd44AVYXwRA=;
 b=DCcK4h1crglgicxQXvwl09Hi4MZF2f4NQGbuIhG1fgOcu1ZO0yBZcQOQ3lZEQSzDOUlSxc569plGqiVZagmCUTuWEFpNaFC6d2SEr1LnYEcWMKzrXzdECAdBbJgHX1b6EP7y1D8JqiaN8iiJaf7D7LPrtjYQYswl1/JxuvjjERg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dd9a7702-0c62-7308-e58d-197114a76eee@citrix.com>
Date: Mon, 31 Jul 2023 14:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: avoid Misra Rule 19.1 violations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <dd24472e-757b-a398-8ece-4e353a28ed1b@suse.com>
In-Reply-To: <dd24472e-757b-a398-8ece-4e353a28ed1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0652.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::13) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|SJ0PR03MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a2e2c9-d1f6-425f-3529-08db91c894fc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0NLc7xgDoVImESwHTgzN9tBofKHF2vq5fy+hHC1laJ0NL79y9YwVa1kCYWxmjbingy3qerEBd1HCYEEEG9HOTwmcKri7+0jtrrgYd4R+tDsGaZ4a5R7VH6toSKVUUmOyuY9iIewP5S2iSsJqDzpcs7VoGlrTG4YERhfYuMNFcxRz/I+p/aSko0fYhfy+kMXgFENThKjSgdfX/DlGz3xBAAcU9bpCOfAlK3yVbXN0yDKlsMA4yoyVbljMFS0lWKL9z4VMG/+ntMfsYOQSM6+8az50IvDT8kzq5wpU4PrxEJBU2OQJL0FSiV0uL86jCylFCw75edTj10rw3igo7KlGHMCeHiJvr30e2/XWnj8ACiLDnOp4a3P3doUuIffPvHixqN3u/xDSKesXQCyp5ciLmzZkuc9xkhrWnTGiZF61eyyFk4KDdbpmfXZVlPOkGipZ8hOrMoia12VRla0dea9Onx5YwjobsQT85873dcKnFm4MEZrTLeS6dYx5F2lzE62L44x6NaQ8kuNyIz82gbs//qC/QYGLt7ZnDVfeSIAMNvk+6eEeKs46154gVdDwpJJqm2EO3Dp9lUGf8QvLIw3kCgug4tSR7ujRUNaqpnS8UVBlIsaygblpA7lgQ+TVPuhLk0Hvy9oWqNYTWw3qgJpEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(6506007)(53546011)(26005)(2906002)(186003)(4744005)(6512007)(2616005)(83380400001)(316002)(66556008)(66476007)(66946007)(4326008)(8676002)(5660300002)(8936002)(6666004)(6486002)(478600001)(54906003)(110136005)(31696002)(86362001)(41300700001)(38100700002)(82960400001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDlkYm1kZ1RudFpMeTUrNFE0YU92WHJTZEVhaHN0ZkJkcUgwb09veUQrTGUr?=
 =?utf-8?B?c3VqOGJBVmN5eHdTRlZoSUZWMTJ4OVByVkRTdU1OcHR2VU1ndmZ6TUhhV3BL?=
 =?utf-8?B?azEwT3dLR1ZGcDE4cmlVZjBVeEtDcW5GWHVCMWxWb282WmludDltZnB6My9h?=
 =?utf-8?B?NElQdGM1L1JPeEd3QmtwOFBTL1NCNnpSN3l5RFdZQnlQemhQQWFQTEp4Kzd6?=
 =?utf-8?B?RndZMlZaMzJqaFlzT0wrNDViWnJNelcxQlRObGxhenhZYXE4WVdHdzMrN0xv?=
 =?utf-8?B?SUxrck9EYzZqbUpRbEEzZ1pFSU9hUXpsUDVCN1lSQ2hmNDNFSkpYSUZnaDBP?=
 =?utf-8?B?YUJid0F6WVpQOXhIanNMWi9md2VqZFdNcmoyN0g4Yy8wT0s0VjM0djcvdWZW?=
 =?utf-8?B?Y0toU0V0S1lJSU5JM0h1Ly9acXlXOW8wQ1FnaitEaW1sU1FySk9kWjd5V1Rx?=
 =?utf-8?B?VjdCZTdKS2pJTkpmWjhCdEZ2ekhPa29TRFFCTDFReVl0V1I0TEtJbmpCdG4y?=
 =?utf-8?B?K2xCTlprSUhqYkpZeW9tVUg5Wmt3di8yL283NVBzWUY0eXA2TEVNaWU3Vm5o?=
 =?utf-8?B?MmZwQWRoekRXdFVDVVVUeVV1SkI0NU0wV0NscmtBSFBxbDlsSzByYTZwNnpq?=
 =?utf-8?B?WWtaVVZubGJ5UW9EY2lKK2REclNWTlBwUzBhdi8zUHIwdVBGTGZzREZDVG4w?=
 =?utf-8?B?TEJldzVqUzFRRWdSQzQ2REt0anFCZENjNVl3cGQxdEh2YkRiU2VEUDRLM2c5?=
 =?utf-8?B?bDMyUUsxQUNDQkM2SjAzRGNCWGk5bFdvOUdMNjZ4eVZSRmRtZ1BFd3ZFM1hj?=
 =?utf-8?B?U0VGckc5ZncyUHRvN0RERmtzcmNXTzJHT0lxTjhpV0pwckxuckFaTGN1OWI2?=
 =?utf-8?B?V1dFMEVOZjl3WkhYMDlkeWo4OVJWVHJWejRzQzQwSTlIcGk1THU2U2hDSXpH?=
 =?utf-8?B?ZHM0Ym1oeVdhRS9aMHIwTTExaWpxZEFtS2w2ajlPOXJtNGprMFRmN2QwVFRz?=
 =?utf-8?B?aWkya01lUVJtcUU1dVVuOFgrL0g5MDBvclZKM3NuMXpXbjhkU2RkeGxaVERr?=
 =?utf-8?B?SlhmaDIxaW96TldGWHdOSmZReVUzT0VpMnUrdzdFK1RucDZxc0wvM1FKWE1F?=
 =?utf-8?B?cDR5RFZoS0NpQVJic0Q1QS83REcxR2pZL1NUNnlQd0dNUVRNc3M5VTNISCsy?=
 =?utf-8?B?cURLdmdKMnZpVFo1MWRjckpyblhGK2NBTXA4TWdzV2RXVVRDZ284NjVvMkFW?=
 =?utf-8?B?SVlaRkdZRTA5S3VuckZZdWJrV1lFOU9oTDVXaGZYc1NuWjZpc1FwVFVOb0ZK?=
 =?utf-8?B?dEZhcFJoUFM2aTVxSVEzZ2VPcTg1Wmp5NmJRNmUrdTZ5MEZKd3FQdHFSREkv?=
 =?utf-8?B?MDBmaWhlYkRkbVBPWlJjcEd0Q2J6dnplc1g1Z2RPcE0xNXc0UGEwcHFnVkJY?=
 =?utf-8?B?dnVNSWNoVG5lc3Rta2lTOGNwVENYdkJIMUNHbkhKVzlCa2RBQ2pZUXJHeExZ?=
 =?utf-8?B?MnZvblZBaEVDWWJaaVRDR1FWOTFLTE9RQURKM3ZEQ01vaFJlTzgyelRmd0dG?=
 =?utf-8?B?Q09ld2hGNmo4b0xsZFF4QUkrQUlhNXlMcGt2M3ZWVFNqbzFPZWR6clpPWWlh?=
 =?utf-8?B?SHpFL2NWUFBmWDU3R0I5dWQ2TGxKaUVuS0pEZjlVbEJic0ZXY21QbHllWjVk?=
 =?utf-8?B?MFIzWVhlNXdEMjdCS1k3d1J2RjVtUXRNcjJFdHVQeEQ2MlFyRVFHUTM2Yy9v?=
 =?utf-8?B?SVo1d2gwKzRtNzBzZzJZOWRRa0U3eXdwOXpDcE51Z1JlN2JRV3BkN29mVjZE?=
 =?utf-8?B?RVpBWkN0QUcwY1gzRmpZSFF5MUl3Z1VUc281M1J0M3I1UUNKUTd2a3BESURL?=
 =?utf-8?B?YS9pTVd6OWVpblZkREhFLzJsekdla0wxRTNjcWZHUFk5UTdhK3ZuU3dORFFO?=
 =?utf-8?B?Vmx0eXhBVWVjelczc2ZvUDh0TkdLak1QN0lYQzczNVZsdnNJb2xadTFiOVFj?=
 =?utf-8?B?WnBoeCsrUkw0WlZJc1E2SnpzSTJVdnZnN211M2JLYkVnWnBYSVNvZ1VDS1RD?=
 =?utf-8?B?b0dQRVhtd09XeVZDR1pwNXIxVnVsZURBQnlrTGRZSjl5SENKUVNBREY2NGZJ?=
 =?utf-8?B?UEFhSDRHQkhucExpUFM5SkFSN3N5UGlJK3pIOGZ5eEZGaWFFNEhRNEJIT04v?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EgRtMe533K8n/JLZNR/uIL+yu8AcKTGkobiQ0+Spya27TKvTcHnmlMUGM89fNDcdgyfFPVbFA2wRE745wCrKLPPFz6yU/ITpGVyNkOjbtGec/S4DId6ZIQQMyeWNSdYllOvejpmOugK3eXIYokfsAkxf82bqPfVHq63C3S4fv7iB8EoBqVx1awajhO52TiRdZgtoMeuzxj4GUvG7eXBkctz6eYdwub/XfLXlA1vbUOnbrxuv8EHqCb1ck+1pke26Rl6lj1GeYCPSNRFLiJTHojvNnncmIqTh3qir6JAHyKMpHKlG+Xe4Gp0CJuXzLN/rn6HD3M3hjFX9jzArs9nojqT+YOwuP552g4Ww2SMv01iDs8gLqVA8vvyu22vFlbQ1667Iz8Wy8GcB+sBFHzsZa3ksK+GgUpB6b3oTRvxN8+dmG5KRCq+HCfecG7N10MygKRunxFrtW6EtP6yTizjgpChBI92lVnNYTUlcoen0ZrBIzke2Di3whqPG09v6K1dWGsR3gR0eGKBi3h1I/75C5AWLynUIAf1qWhqSkfVp/WGWfHvjr/xSQ3T9ZnSob5LcPlfMVYFCbewcJE6iaXalDzXo2Hh319hV4h3Fq4pCtEgl2P8G02x173bYQCrgZR6XN57AsMhdYUFLBSVW3Upu7OM6bWAhfGFTpeq6J8bn/Q29Bk5HEqCMeGwcHbtwLUoTsNDKWMOxnpNpHy1W0eQsp2cPusLlCFGfUBuzf2D+w++N4qJgDz2VJ+KhuUGbz/5ABRhvzPd+9XKUZ9oCjqm943nyxd+VntIB3o+2EEFi7tvXNnhNMJoPwM7V1aYIyQq04pMJdZeS8ZO7V62f56E2Aj0reFDPbVrwjBNooJd4eA4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a2e2c9-d1f6-425f-3529-08db91c894fc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:18:08.5557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0yNXVFxbQeEz1SLgoS3PMCIgsyjXg9rJfNXXUWOsoianQBbeV7nOcd1LQyaE3tQZZjwhoqMd290WLt6vXiqVbmbpA62Hfrow7bLYjEDVLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6501

On 17/07/2023 3:13 pm, Jan Beulich wrote:
> Not exactly overlapping accesses to objects on the left and right hand
> sides of an assignment are generally UB, and hence disallowed by Misra.
> While in the specific cases we're talking about here no actual UB can
> result as long as the compiler doesn't act actively "maliciously", let's
> still switch to using casts combined with exactly overlapping accesses.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

