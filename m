Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8816BD602
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510719.788953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqdf-0000RM-EH; Thu, 16 Mar 2023 16:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510719.788953; Thu, 16 Mar 2023 16:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqdf-0000P3-BP; Thu, 16 Mar 2023 16:39:39 +0000
Received: by outflank-mailman (input) for mailman id 510719;
 Thu, 16 Mar 2023 16:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqde-0000OK-12
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:39:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d74ce8-c419-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:39:35 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:39:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6980.namprd03.prod.outlook.com (2603:10b6:510:16a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 16:39:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:39:29 +0000
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
X-Inumbo-ID: 21d74ce8-c419-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678984775;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4Igwr+PhT14ddqXJTKcC+d7miZR/SHZ/jqhKcQG2z88=;
  b=MOmwKwL73e6KzJNBIU4ZYqJnn7SHcHfeOFAgPTXEI0KASoG3p6E6XhYH
   szGmuZDPSmIE5SidiVM/9+trZMUvwSvukhavfDZ75W1jN7I6xhQnN8vBd
   2YGRmWWXTdA9DlQZB9FOiSIWF0w4r0PneAUDwcQcP3qLjrtz95gctsBQA
   o=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 101061098
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hihvg64zB/EiwgAXw3Vg1QxRtNrGchMFZxGqfqrLsTDasY5as4F+v
 jRNXG3UaP6MZmD9eN5yYIq/pk8Au8eGzIJlSgc+/C48Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4geB/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 cE4JDctMyC6hMmcmY2RT/dV1sYoM5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXqjBttKRe3QGvhCgkCz+0sUDQAtaEK9pv+XqlaDCtVcJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07s8kP0Kmq+EHdtBilrJPJUw0d6x3eWySu6QYRWWK+T4mh6Fye5/AQKo+cFwCFp
 CJdxZnY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 BO7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:3gKr5K8xJ2WlIW9fV+9uk+AUI+orL9Y04lQ7vn2ZKCYlCfBw8v
 rFoB11726XtN98YgBEpTn4Atj8fZq+z+8M3WByB8bFYOCOggLBR+FfBO3Zslnd8kXFl9K1vp
 0QCpSWZueAamSSuvyKmjVQ0OxN/DBEys2VbCvloEuFHTsaCJ2INz0JejpzyHcGOjWu2KBJaK
 Z0OvA31gZJFhwsH7uG77A+MdT+mw==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101061098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvQZOj89snpfhDIag1Z2RXTQ1qmBHyZbafwTpw6SBlQBBkEpsHFujap5OXU8RQNjkTRMEIPBqec9xkfO+La311+ksk9kQiO6QKp/tJ2X7a2svAwTfzr24qvfHd5IJmuNGGFTmEtcDw2TtfQi2wHxp3x7D6FMnDhjKpmRqBCG4tkzDYJLxkv1wTx7wr1MRpzNy+qActjYJjd61RY25jhT5cQ6Kx6brm0mT4z4N+quIXNZ5Ie9pdHQ665kkH0B/rW/pWELlx3E2mYqkCr3CERPCprk3GgG5iWL9HuRex+0+6f0fh0raS+NauIgQ9fPOKVB+mdYMw305vdpFRYvUliUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Y/IfAsZDMKUgAM9+PkH8rUoGUHG8O3E0KVlxvudLo=;
 b=ncDLW/kK5XTRP6mAcMBvostApCfKGPFV2F4SY5LiGP+aXa28OKVh79lYhoEpva3YucNZKenJd7bX/RrMwbLcZrzyX8slsbqeb6PZ9gZP3Kvnn8oZbWPh34RDKIiTfZXNZQaVg6/rQs2AP+umH5VHV+OSIWMLw29uWYwyd3wC2wnqekKyeyzDc7a+1O+nI9tpjrTQ4dqssxcresjdzmhehUyHkuXzkMHWtx9CuZkohn3g7sxQiFNwYeqnjymoke4ajg9PZE2n5NMApLCPiu3OkdjkHi9FYh5Jmpt8Ax5ZuDSRzf9Adctr5P6hebkUA58jEu5tFGLFpVPs2OE5Z1lafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Y/IfAsZDMKUgAM9+PkH8rUoGUHG8O3E0KVlxvudLo=;
 b=rs0mou4DhDGe3zvos+r+mBKViyl6KgVzhi7fODPfd/3ybEDjVfxAhE0N9w8RgXtq5XyBDsOq3JCjzKSOjTqNfSUKQn09zuRXFffTKjTSLYnSIVAx4iRd7uvDvVAs0r1+1MwTVEDEgVfQg1RyKYKvMET4vNR9SGsoZu4bBTWfX3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:39:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBNGO7/NY0VQQM/f@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
X-ClientProxiedBy: LO6P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: fafe14da-2ff8-4e9c-315d-08db263d0348
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD1H/mnDkjooex+w+PMfoHb/uNnC8O/d+R2xhyIhFVurJ6rZ9bKWP+vVNiFQiZLZXsvibpK10buQu5KTkHkxEsS1sHy45g5dd2V59F2KtWoLVxzKK4jtfSBE6JTWgVy8nKGuHZkc5JEgbBm0L2fL4KKJcsqpHNg3Ezq4A83N9dXMGtfOj3uMBJTDRsQtyGgz3jskLugIqQQQCkzGsA0uVioxa1G/m6rP8WZrhrKTPA5uOV+LhEuYfmlCdEGbjqkZXSS6HUn9NrMmLjnkd03Qw9GxYxDuDZSkqZBlNFHk2Hxj200WxcoMO0PQwBNRvX85tEMOi2prJJeCOIo1TkC5Q5g9hEtl0Dou0txrBG582sJV1klLZAmsmZJYEGDst7Uu2PmC06xSotAHBpNpdpR9DVuWiWEiXncL5MYezfquz8/96al8BQnEQJNvbdoeSahfxjQfAuWAJ+367tLHGBYYZTAo9kgiUARlbz40/ObxaukUK5h6XZl9xp+CLKPi7NDBGE7k3XBUuPJkhZdzFALJJllnYjm33FDnagmv+vszqqpEmf12Yu496mt9f1Ox+oBcmLkZaYvQSBT4WYdcN8I0gYUYPQeVj1NL0TtCTVPNsW4GOST+jImpLDP58OGd+YW7AqzCnzH0jwi5UDkFxlzTlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199018)(85182001)(82960400001)(86362001)(2906002)(38100700002)(41300700001)(5660300002)(8936002)(33716001)(9686003)(6506007)(6512007)(26005)(186003)(53546011)(4326008)(6666004)(316002)(54906003)(83380400001)(66556008)(66476007)(6916009)(6486002)(8676002)(66946007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWNDMEVPTERWWEhHcHdlYXg5aWdPMUxibHZ3dEltdkFrNmRnZTdCWFZVai9V?=
 =?utf-8?B?Z2hMei8yNmZ2Y1ZaSFc3UlQxS2VkdmU4ZVljTmdnNzdDMmE5RnRCQWdYOTFi?=
 =?utf-8?B?aWx2emQvNmtBVS9BNFVzZkw3OGpObjhiYUw3N3RSK1pZNVdoaFhlZWVLc05k?=
 =?utf-8?B?WVQvZ3krNkFlcGZvb2xTTkVwRzFWbXVDSGo5TG4xRFdYc0xYeTlsWHdKOEVW?=
 =?utf-8?B?RHVoeGV0WCtRTVduVm1HQ3NMalNmRHBpd2pzdlExK2huUklnZDhySVpjQVJ4?=
 =?utf-8?B?c2g1M2lnTURxaXVmYldRdE5tUFk5MDZBdVVrdWxrc0RFQnVuNklCWHFqQTd6?=
 =?utf-8?B?bkFQTUxpb3NkdE9pbUlzOXVZN2Y0cTM5S0M0V1pmaDBFNGlpRDNadmFabVY5?=
 =?utf-8?B?MGxvK1JMWVpkcXhPTDE0Nm9FNndIYk9TOWpNaElSaHBsZEFwS0dBQ3pLNVlR?=
 =?utf-8?B?bXhKVkpGdHdBdTBBUmVTU2h3ZE1kcTVtZDJJeEM3K2Fkdkg3a2k4Yld1Uk1I?=
 =?utf-8?B?L0ZDbkQyUDJGeVJCMHFUWHpzOHR3UkdHaTR4cU1qT3hFUmR3WktBV2FHVnAx?=
 =?utf-8?B?L250aHEzVHFiQThXZUhRRStVbWxmSEJxOEczTnJZMGdBaDlEYlV0ZHQxYjNT?=
 =?utf-8?B?Y3NiMGwvb1I3WE1MSkc5QU5XQ1cya1JjY2UwUURRSHhualcrcjY0VitlVWRj?=
 =?utf-8?B?ekFDeG1HNE5UWDZINVJld0ZmcTVaOW5hNUtzYkxYcjlscWkrdGRIZGVFRC9O?=
 =?utf-8?B?QTB0MVo5MWVraUZIcnQvaUZlNnJ1eGxPZjRsekZHM2xOUEZKbm5rWVY1dHJo?=
 =?utf-8?B?dFYzVXZmK3lqOG9iSGZ3cFhZeGdGM3FrUlVjcjBSVDk5cjcvRkR0ajkzVDFz?=
 =?utf-8?B?VlI5Z3gzU2J3c1cveWpLY3JOYlpmWHJiU2x2eTUvbXd6YmFVd1BCb0hnN1NB?=
 =?utf-8?B?Wkw0NjB2RC90VU5mSEhqcTRhc3UzYTBLYzNaWUFSa0JVZTlKSUJkdmJwaGFH?=
 =?utf-8?B?TXNWR2VPVTlCNFAvZHBQZStSSGpDN2x3UnhZN0RNUTJVdDUwY0g2UnIxOWV1?=
 =?utf-8?B?dUJuV1QwTDJTb29VUzgzeUlOWDcxUTdCY1J0Z3hySVcra1p0Uk5vNVNWYk84?=
 =?utf-8?B?TnV3aW9iOG5iM082c1FZWTJmb2VWZHNCd3hlU3c5QkVzZmdHZG8wSGt5QVhk?=
 =?utf-8?B?MTBWckh5dkowU2hQaVlQQng2TnhTWFVSZE1scDh3S1pzbS9JT3NtVGRNVFI2?=
 =?utf-8?B?UHhDVWUzWjM0OXNOc29HZW9yV3pOR0VMNGZOdHlIMFBWcE92bHRnM3dZZjJq?=
 =?utf-8?B?RzZYYkwzWTNtNDFNNFlPYmpJcTBITlJYNTMrRmZSdmhqNkpMV3NmZms4ZWhL?=
 =?utf-8?B?bVRHcFBXd0MrUHVHTi9HajFUVy9FUUNaV1JiQVdLSjRQTjZaMWU1T2crTWFs?=
 =?utf-8?B?N0k1VGttUDV0Mmh3WmlXem9Tdnh4dDQ0ZVZqZHJMR3A4Y2FEdVFUVlprZ3FF?=
 =?utf-8?B?UkZHelZqcEo2d01yanpXZkZhYUxGaHJ5OWlJUWJkYWZEcjhqZDRHOE5Rb05T?=
 =?utf-8?B?bTM3UldUSnRCSkgxK0NyUmdLSFc0OEc0cXZQVUR6ZVpVblUxVHFRVzRQc0Ix?=
 =?utf-8?B?YlZ5RjRLL2YyTmdqeWwvbmNNMmkxQk1wUkl0Nk5UbUU3RVdKU3lRZG1ONktk?=
 =?utf-8?B?MU00d2R0UDkrSHk1bktOSHVBdG5FZVQrZEEwODVxR2YvWkp3bTJiREVRcGNx?=
 =?utf-8?B?T0VmUHZ1QUlHQU5tb0FDRmRKRWc5a1l0NjNMYys0RTJ2cldFa1FvbjJFUkxL?=
 =?utf-8?B?c1FTYjlib1hmVDB3NERDS2tEQ2NhTEVCN0k5bC9oUmJENk1KRDVZU2lIbXFu?=
 =?utf-8?B?bDVOMW9jZ0tLN1ZwVURRaDFyRENLc28rcFVDVTl2ZTNvb24zOTYwampFVlZC?=
 =?utf-8?B?MzdDK1lIZ0VzWjZlZnlzdTB5RS9FZ3VNSnVqRW9hQWRocnM0cEF2bHNZemt0?=
 =?utf-8?B?TjVMVktyd2RnWU5YbzdMVFhOS3JLWC96L3ZzTE14VUVNcVlKQmNBN3VJbUZX?=
 =?utf-8?B?OTlyRWtMZmhCQ2I5dnZRMEdaZDErQUFzQ0hsMW5iR1VHK25naWVzQ3ZvMkFQ?=
 =?utf-8?B?bjBLZ3AxcWRJVG1oRGVJY2s2d0xzdjhDVDJGS1ZrQXArR1RKdTVHVFk0UVpS?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UCdkAWKHmE9p5vHw9bb95cSbtQsb3scMMhUCAMdqI5Ld1bnTJyObCvEDXju040ysklYZVMQQcmE1ZCCsrSZz9mT4RDA4jsp3hOIZnbgLzc7qElWioO5vEnwasnIic7MbFErcq3iIP6c3C0xEevP/nQ4KSpPY5a4gWi4wWmu9V9n2AlgpRsHNK10nl/q0V4SekUBRxOMXrJPh2ApTx0X3usl18/Zfkvw6vBsGRMAt9pBJP/WS4okG0pZ9M9i/rPpQ+8Pkfpa4fTa1Qe1dPNWyFdsbh+QxoNhIiMjGuW318jaQ7InDGLUYlmr9gC60HS3bFMVuXzP6H8DsuNUnewsilmoQLk10co8UW1wKBYuz8x4MwgkLwbCPjUzqHSeUPjDI7xTayIr8QyfIWwU9swdlhzTuUPj9UPmvJls9BBEC1iR9KyGz2hYjTtGplkkXMQXuiAbRhmSNOHWNQYHvCqi16eggQNOarejBwmKcLjXSivVSnEXA4e0rviYOnsNW5oDEy6Kk9gwPeGA7RKjbeKEiqLRVDpQSIH2R+lnGPUAAZLbObPRbGcCCs4epdtRUz/IFmHqL9nRHMKCpNOe/ec5A+Pzs1rDfW3E4Ox1BCgXfKlIsPDlxi25Itqx0qAMsV3duSwkZYBWFA0gr/wcmKnFJoB8gRTB/Ct5sTQVS8WxtezA9xlXOBI1GbgSWA7KyYNYgH6Nqs7ZC6FbmHC7c1WUhULnEIVL1rDj+Z4CVzy+8WyJFhqUcT4WSl7GirTQTdc3LiuaBxD2v2GHYKTnzGzv2l7BdvBWgGG/dQXxZPhepgZwFxa2Xo+aj7csCBIOtgvB7LNJENCl4iplkHk+77eO5pL+pDobaRwYHds0t3IAOJC1Qz6Fyx/IM9STp/gZs6lnu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafe14da-2ff8-4e9c-315d-08db263d0348
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:39:29.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaI4OL2kTrv2IqKqJrjGm7accU4hJj0fTCw+jowv0cTL19MvWDjbSaS0E9p6ER0XFXXm4scS2V9n7rWdqTtfiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6980

On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
> On 16.03.2023 17:19, Roger Pau Monné wrote:
> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> +static inline void refcnt_get(refcnt_t *refcnt)
> >> +{
> >> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> > 
> > Occurred to me while looking at the next patch:
> > 
> > Don't you also need to print a warning (and saturate the counter
> > maybe?) if old == 0, as that would imply the caller is attempting
> > to take a reference of an object that should be destroyed? IOW: it
> > would point to some kind of memory leak.
> 
> Hmm, I notice the function presently returns void. I think what to do
> when the counter is zero needs leaving to the caller. See e.g.
> get_page() which will simply indicate failure to the caller in case
> the refcnt is zero. (There overflow handling also is left to the
> caller ... All that matters is whether a ref can be acquired.)

Hm, likely.  I guess pages never go away even when it's refcount
reaches 0.

For the pdev case attempting to take a refcount on an object that has
0 refcounts implies that the caller is using leaked memory, as the
point an object reaches 0 it supposed to be destroyed.

Returning success would be fine, as then for the pdev use-case we
could print a warning and likely take some action to prevent further
damage if possible.

Thanks, Roger.

