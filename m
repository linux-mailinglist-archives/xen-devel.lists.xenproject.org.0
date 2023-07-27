Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AB76543A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571090.894094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0K6-000292-0M; Thu, 27 Jul 2023 12:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571090.894094; Thu, 27 Jul 2023 12:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0K5-00026R-To; Thu, 27 Jul 2023 12:42:29 +0000
Received: by outflank-mailman (input) for mailman id 571090;
 Thu, 27 Jul 2023 12:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us1z=DN=citrix.com=prvs=565118259=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qP0K4-00026L-4h
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:42:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08cc2772-2c7b-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 14:42:25 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 08:42:22 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 12:42:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:42:19 +0000
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
X-Inumbo-ID: 08cc2772-2c7b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690461745;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tT01BO+6pZ0K95n2d3qfa/Og89jetBzBgBbkoOt+KEY=;
  b=V65QnHGLFl+ykihfVcmW1P6C9LYUGtfmn2S1rG7sKn9N+e6FKtnuG3Gt
   VGXthHkyxF0+lQa7Wnfoky3SlGcLmcMZaX2UefImdBpCQmIppK2NgecjA
   fB+9XTQD9Q/v4hOswVx3aS3o8jYVfntLadLK8kzEMYI27wN5V/ljtr3kR
   A=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 117515624
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+gKot6kchDMRalz5mPHExqvo5gxRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDGyFb6yKZjTxco9xbYS29k0AuMfRyIBjS1Np/nw1QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5gCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cElcR9WUyKRu8e34qyXVMU8lsV9I9a+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieezWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqkBdtPSufknhJsqFSx9l4PB0EYbECcodKgzXXjRclOF
 GVBr0LCqoB3riRHVOLVYRq8p3KVuw8GbPBZGeY69QKlx7Ld5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaHiwYLnQLYyMeeiID78P+u4E4jh/JTdFLHba8i5v+HjSY6
 zKAoTU6hr4TpdUWzKj99lfC6w9AvbDMRw8xow7QB2Ss61ogYJb/PtP2r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb5FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:JYNnsq/5Ch1ycsOCKC1uk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:GGzv8mywo9IN2RxYIzfnBgUpJ5kKKUDv3kv1Im2mJXhFGK2UF1CPrfY=
X-Talos-MUID: 9a23:wa0N4gttDRKbGtdTDM2njRNSBttnv6qXE2cNuoxBgJSaLj1PEmLI
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="117515624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLOsyd404x6sfyyPc/1jB4AAvBV73sRzfIs2P9O7FPC0TK0J3Pgra977OXiU0/4k0WgzvgfsJlXmdkQfunfDo7mKGAKygDg6LfQzzKCQwgsduaNsueG9Bf6wrY0l/3gkHV2sbkC0BwZ7FT3IAlj2sM+B+5OUn2XbGnq4mgaUUQxK5tvQRA7DAUbdiZcWyAtDergEc/LrcFMrQQpWe/bB+QtEsNHvYPobG5gW/b0GtXu+tA0q++KnRV4z6P+397skC0KqVYVaXBa9mKv/3bI1Vn0Uma2y624F2hg1el9Aq1js+7eOlrQznzfICHwf7hm6MPFjEf3W7t9vikduVb8O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ3a0uXBdTHpYgXCnmACqT6AUpH6uOJ4f4rF7bN8EbQ=;
 b=YgbmDAuoijM6iZfkU613vxMbhhri25yLLrJK/FMYrGvh5zzh/UKuVwpCyoAcLqY8PC3L4gO13F+XLHpoA1Y98hV7MYeDUIKEykI7B5kJjbIiiJ6btI8Z/2ABQoyM4WO5lcOJYTAaPCBZKu2VY39v99qXR0oGRupBEPzFvHnsnVVinEqhi/Yo2BSJWMGWEecajleQtwX9VXZQDEf0H0rf/SseNhTfN9a4mssgsMQ7Rfdqi7q+2sEOUwl6FEeLNq006I+IM0YipLPdWarVOpHAS5Ss9gzInF+ZRF6K6Vd8uMNCNCMl5tu6Vt0158IeNQ37O+H/SbhgrZpjC587d/7VqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ3a0uXBdTHpYgXCnmACqT6AUpH6uOJ4f4rF7bN8EbQ=;
 b=kbSejF4+ouQ/nlhlooYm7jsnhhFV5+A578SvUC8rMksz/JzPVTBUWcMqLSsucEscypb1tHN4fhkfRXnRz8XZQWjWgj4qnXa57G8jZ1JaMNm/sYrWhH6kCHBhW9uyFwRJgnvF4a5o/NN1fseQk8z7GPMx2YYMr2iDupjdeDtUNlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 27 Jul 2023 14:42:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
 <87y1j2b296.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1j2b296.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: e24ee93f-0a76-448e-4a20-08db8e9eea6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jo7sapzQ6XOJY7XRhDK1c0utei3WbxqcNKeSMtrlU/7qaz0zwZykZxc4OVEVXabhv1/sS7gPRZZ2ir25HqH+O+GG+0M/gqD9pTYDN7PBRrUSS9xfPCy97U6IwCIDEx73MB5mhGB3VGwDXZWdOmozyCLJjRJ3ZERRS0xxudpcQ9RsZoTAmK8Wl6z0aLPTYDY+1roWvoU5/U5yfY1v3qOJeiWAXczwYHFe+wHBbJKMjqPyre4cI5gzIrTAf/X4cxeV4Tvw/2G9NzEBuNgbwJ0KURb5gjuZqbOinxzhTdF0jkcuvJR0xkEWsz8Xxbzy3HuGvVgW5dDh+E7hTVHOwpMN0y6J/AkueIF+zym1NQe+x9DIEOpEfoS3CW9cHnjbRXcLWwXC+FpeK1I3+YFu3eO+jwjGqoQF1+2uX3DVRlWJga4pdb6p+QOccaQhMlCVvVbbSVVGJUpy2h8q2b4Lq78/dMXAUErgKo99PDFw6J5nByX4+egvRMN+y/JRP1xBZmf30FANC03Np0zguqWTZUGRRNMS4v0v4tNChYa3+OowTQJPWZvojjn7rIggMAkV6msZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(2906002)(83380400001)(6506007)(26005)(186003)(6512007)(6666004)(9686003)(6486002)(478600001)(54906003)(86362001)(66946007)(38100700002)(41300700001)(4326008)(66476007)(66556008)(8676002)(6916009)(316002)(85182001)(8936002)(5660300002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHk0cjZpbjFaVDQvR2JZUHV5RkxUN2lsYno1VEQ2V0lkdGl6SmdjdDg1dTFt?=
 =?utf-8?B?ZWJ6OUpzZzRzQ295a0k3NFNySzFqOHFBUkhJOGh6S09CZEFqMlk2OERFQk14?=
 =?utf-8?B?VU9GT1AwUnVtd3dOL05tY1dzZDJJa0xyTGpBeG9TT2F1R1A2MTRraTRrZTRY?=
 =?utf-8?B?YzkxMVd3SDkyM3paZlNvUGMvOFd1Q3psRWhUaTQ0bjYzbkczR0ZsZHJXam1R?=
 =?utf-8?B?L2xvVlUvR2VnNklZb1FsWkdDMUpVMVdtSStOYm5qelh5cGZ6UHB6ZWh6Tms2?=
 =?utf-8?B?VTd6V3FXUjJsOVMwbmw2Ykc4YlF6SnhjeWUzZmVLWGluRERGcVBGdW9JOWlV?=
 =?utf-8?B?V1VLQ29JbjVkMkRIVld6dDBDZHdMbFphc3NpZWprQnFua3h1ZzMrTE0rVGFB?=
 =?utf-8?B?UkQ3dFE1aUhqWWxrSkVZZ1lwM1JzSS9yekhISTlIcXcrcE9jOXBKWmM0Nmps?=
 =?utf-8?B?cTZsZ05WeTVxbzFlVnYrZmtOQ2dPZ0tiS0k4bGs3RlFyT2lBazF0NitiMHBz?=
 =?utf-8?B?clBsblpTRnNtS05NSUJxYzcxVm9zR0hHd1IvelIzOStrclNXLzl0bkswdjFB?=
 =?utf-8?B?UG04dHNVblNRQzJaWEcxZVdJc2ZidTQ0TGoxTjZUTDdjSGVhSFJZNERQN3Az?=
 =?utf-8?B?Qkl6MGl3ZUZvb2hxREFhU1oyZ1pnbXhwUTlSSDlkWFBFNXBoZCtSY0daZW5T?=
 =?utf-8?B?bVpJZ3lJbDlZRG9jMUw5Tm04a1k1UGwybDQzWGpiSk55ZnFtbmQ1aE95QTBx?=
 =?utf-8?B?VkJqREFmM0Z1UERkK0VtZkNmUWhKZDhHalJrZFBTcVFGTnBpdWlTb0Eram5k?=
 =?utf-8?B?OVhvWHJJeXFJc1pCcXhXcmZ4ODF0SkJpOGNKenBqaFlTL1hiUGlra2JiazFO?=
 =?utf-8?B?REg4NUlMWUNMbkRpdm5vaUprb3Z0ajc5RHQzZU1nRzBra0NoMTUwM2xxRXUz?=
 =?utf-8?B?NE5VSVQ1SXZxMCttb2t6L3VXYWpoazlkNTAwbU04V3lsamFlZ01QUzNYcXVE?=
 =?utf-8?B?ekt1VWNIcGJabWhvSzlsMUloVDVhOEplWlJUYm9UOGJaMW5ad2ltNGhSUE5T?=
 =?utf-8?B?cGExMTFkTVNiQVY4VElaR2EwaUxsM1NSRFpNaDQxT2doUmtMNXBjS2d6Q0pt?=
 =?utf-8?B?cndQcFZHak90b1BTVzZjTWhwdWhGcWxBQnlFK2w2dnJiNGhlSTFDSWNHSmJq?=
 =?utf-8?B?dnlId0Q1d3FodHFCayttYkN6UUdOSktyeUREcEFVZFEyNFJXUVZQNVRVeElH?=
 =?utf-8?B?elJINWJXbG4yVm1JUkRxK1phTTBQWmdaYmlRVnNDVHFiVG5vbmt3K201OTBW?=
 =?utf-8?B?N3FCdVFjSG9rS0VyTzI0T2o4NDZ5aUp2WU5PUW95Qm90MWthNXA5M0F1VllF?=
 =?utf-8?B?NmZwOHRCbXlKenNVZjBzMlhKNUxobjFiZ2Z1RTZxdHZBK2Z1VmZ5QkNQQXBS?=
 =?utf-8?B?d1VPWnE4am5tc2pjZFFlYTJWZm00L0padDFlTU13Vm0xTDJoNGE5dXJYUG1L?=
 =?utf-8?B?Y2VUWk8ySFBGd2ZvQUlEekNyVlhWMWlJRGlFUVJ1a3hxbWNiekc2YkZiVm1y?=
 =?utf-8?B?MDkwbXNEazE2cXpoSVMzTTFHTS9EUGRRbnJQQU9oSHB2bE54K092WVlYMnRm?=
 =?utf-8?B?YVJsSHc5N3RVMlZzUW55cmMwWXBXVnVDSWxieG4yQXdmSnJXMjRhd3R5Nk42?=
 =?utf-8?B?VEtSVG8wc2JQSExVUVlGOWR1d1h4QUJEV1hHTXBCdG8xcHlkb1N0SStibHRE?=
 =?utf-8?B?RWJ0b1JySmlrODdUQmcvMHdMZE5POUExakZzVzRJcUVNUEVCUi9LQXBhVVlq?=
 =?utf-8?B?Zkh4eEM2YmM1bVZPMmt1c2p1NDdEQWczZzBzOXVDWll5Vkk0bkJ4ZTYxUVIz?=
 =?utf-8?B?NDRBTjd0MnJzWTlsOE1rSER5YWI5WlBUbG9IRnp3SU9xck9DZHFLa3RlUEc0?=
 =?utf-8?B?UnR4b2NCNTJIcGpYVktsdDFQcnl0aDZLdHZYbUxBUlJ5SkJTL2ZBZk9lcDZN?=
 =?utf-8?B?aTZjYmNRTk1SeFJlYXVWUm8wUDd5VGVSeENmRGpySkRCcjZiWW5aQml0cUg4?=
 =?utf-8?B?VXJvanRNVUF3WnZMbURrOHBEaE1zSFpNSGxJWU9wL3ZKZk9hQXVJZUJQemRw?=
 =?utf-8?Q?N/pI8DqP3q6V2VD8Ot57s3udT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T7sxg7XATzXl+h6DYW8QPJPisLOOwNY6UVuvhQbuZr4BaCRgS/v3Hbyxs/0frOAUY19qo1BrvmQ4ym4LclgaRP06gyNWir6Yjui+SrvOerqaEpATVSNjs1Toi3SGgqUdn7dbHz9hHKVQqIvnckvVVCr4+f9UECJPCi4qqvkuV1SkpI46BvLZeAy56AUnLKew+tjEK0VdN+GB9RzFH32RCFufkc6pYZheYb4aWNlg05PbbLWdBgMbz2Sd55rMRLJW6egci+3jmrH6BVzhzIkxpklI9WmGGBYqqm8t6RWH/t9sHfdxuq+53ZvcZZ3Px3l8H57XBLmqYGUCIS9Qc/LuwbA8/lutQzHH91mOt/xqMQwFl2k+LitzQeYE2hMu1NvQ4xtXZYUMTTJJ8tiLDmsA+PR1vFj/lSuUbr1HoqubCCI7+KOGd/+qkm8S2GjKl5bBaChoMz8de5NeisIyH5nfBbhVoEdTJzoyynMBbrlkORXf1+uy2fvDkYlsyvziR8JnKdj/p5yOe4eU73CJAwrzZNFUJC3wQroy/bXzGMeu3w/2RA1faqiGr6BwoYPDVD1IWK4l/P69uNrLCVTlleV6D7PlNJy0RyYWBJFDTiCS+C3i2X9XbTQR0PVBjn/18SkU3hPK8H/qDEstShVMsDktuWVbHinaVDDZX1dYAvX8fzFjWsFf9ZUMAJ0WnHnJmjS1u284Z6T8t2/fFbDQXiLquU/CHBS1wDBRxJzzpfQpcib7doWBkTSEk/ce/1bSY4ZJHuzPy/Gqc0lPenYz75TSUQnF6IbC/Tjab1DvYREgpwHTg2UMFbwCmQGXR6eAMn+8NeMhvw5Ma37497O1OKQZ0g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24ee93f-0a76-448e-4a20-08db8e9eea6e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:42:19.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dPyS9XohzHjnJvDr54179eCSuAXPuh2s0XwzFxdJEqa0j5M+IDgpVLySYrUdYNHHAsJT4LoPctCa6BkMQ1Ljg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520

On Thu, Jul 27, 2023 at 12:56:54AM +0000, Volodymyr Babchuk wrote:
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Wed, Jul 26, 2023 at 01:17:58AM +0000, Volodymyr Babchuk wrote:
> >> 
> >> Hi Roger,
> >> 
> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> 
> >> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> >> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >> >>          ASSERT(data_offset < size);
> >> >>      }
> >> >>      spin_unlock(&pdev->vpci->lock);
> >> >> +    unlock_locks(d);
> >> >
> >> > There's one issue here, some handlers will cal pcidevs_lock(), which
> >> > will result in a lock over inversion, as in the previous patch we
> >> > agreed that the locking order was pcidevs_lock first, d->pci_lock
> >> > after.
> >> >
> >> > For example the MSI control_write() handler will call
> >> > vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
> >> > have to look into using a dedicated lock for MSI related handling, as
> >> > that's the only place where I think we have this pattern of taking the
> >> > pcidevs_lock after the d->pci_lock.
> >> 
> >> I'll mention this in the commit message. Is there something else that I
> >> should do right now?
> >
> > Well, I don't think we want to commit this as-is with a known lock
> > inversion.
> >
> > The functions that require the pcidevs lock are:
> >
> > pt_irq_{create,destroy}_bind()
> > unmap_domain_pirq()
> >
> > AFAICT those functions require the lock in order to assert that the
> > underlying device doesn't go away, as they do also use d->event_lock
> > in order to get exclusive access to the data fields.  Please double
> > check that I'm not mistaken.
> 
> You are right, all three function does not access any of PCI state
> directly. However...
> 
> > If that's accurate you will have to check the call tree that spawns
> > from those functions in order to modify the asserts to check for
> > either the pcidevs or the per-domain pci_list lock being taken.
> 
> ... I checked calls for PT_IRQ_TYPE_MSI case, there is only call that
> bothers me: hvm_pi_update_irte(), which calls IO-MMU code via
> vmx_pi_update_irte():
> 
> amd_iommu_msi_msg_update_ire() or msi_msg_write_remap_rte().

That path is only for VT-d, so strictly speaking you only need to worry
about msi_msg_write_remap_rte().

msi_msg_write_remap_rte() does take the IOMMU intremap lock.

There are also existing callers of iommu_update_ire_from_msi() that
call the functions without the pcidevs locked.  See
hpet_msi_set_affinity() for example.

Thanks, Roger.

