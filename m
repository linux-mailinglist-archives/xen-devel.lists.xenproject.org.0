Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4A49B6C0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260403.449829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8z-0003l4-U3; Tue, 25 Jan 2022 14:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260403.449829; Tue, 25 Jan 2022 14:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8z-0003h2-Pj; Tue, 25 Jan 2022 14:50:01 +0000
Received: by outflank-mailman (input) for mailman id 260403;
 Tue, 25 Jan 2022 14:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN8x-000334-Jk
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:49:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a9aab0-7ded-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:49:17 +0100 (CET)
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
X-Inumbo-ID: f7a9aab0-7ded-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VpIw3Iq9GpeagSxrveN9vHOVlpdiutzDZnZ/jcnm40M=;
  b=QMnwJdTN6254+JHPxTy5BI2aAUgWXZJvrw5Dwalf3QhRcmp0ykiyEqJo
   I5huauGS9or1XvT+WNfcRPD4dM3C8bppYxVPnAyMkNsedVjqAlUXuX3QO
   0HJEQozCr7YGDoZPb71tfSKgChpQpxVLKmVebtVPCaUkCiU8fVOh9qfeR
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KutWxlx6cZDbxosUtTTMvCbcP+A817KsCd+UKyrif3/SBhSu04DB5S1Pk/77mG4Ad8hWr+Uwpv
 c2XAna6ZZzRlCeYf0WRXzVcxCmKo9HQ0cP/DjTIC8mg4U3e67gW2fuFk2G5q5qKKH7fPY9XQpe
 qwoQ6bPZ5UaJXnI/S2JBjfqf0yFTAjI8ZI4nRDp6ucAG3vNdbXQ7QKScOLjVejTs5+dZtlC/G8
 QbihNus5HrwoYltSI5ijnrM11RbNxshHPW9j0JMpTZkG/DN+hruirG2/MTqyHVrLAD5LbF7iM7
 SYHcLFvPW9S3BYAhiawwqgZ+
X-SBRS: 5.2
X-MesageID: 62186664
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n1K4vK+PyaFYpYv+kpBeDrUDcXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jMWWD2AM/+IZGSgfIolad60/RsCu5eBmtExGQVk/no8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhh7
 /pd77uJQD4iN/T9k/szUDZ0Ky1haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhm5g2J4QQZ4yY
 eIHNTFSNEvHPCYWYHkaNM8Clu61gnDWJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT88yG2FjIjdzd4Y9V/hcQpaz8F+
 meFgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHVm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7EFjFtX
 1BewqByCdzi67nXyERhp81WRNmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hOI4V8Au8ANbSryBUOSX25XI552pUQHPY+9Ps04k/IUOsQhHON51H8GibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OSDJIZ9YbgrmRr1pvcus/VSOm
 /4CZpTi9vmqeLCkCsUh2dRNfQliwLlSLc2elvG7gcbaclM5QzlwUqGIqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937ys5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:YRZN+6uFYIXx8MelPqwtpia+7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqGr3QRqvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62186664"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlMh7iq6qrR0Jc28xd8xMJqvfVnuOvcqUypXjCjrjUf1xWuUspXySDMC4dZtmfd7iKz/7m+1hvQqMw0t0PF3JyFZerGVD2F812omdQOd9aLFK+zaG2wIg81AU07HjfEnpmriifcVSfccSohIBmOB3rWBVSFOjE5LFcoJzHtSXMEnmZS1q2F7Ruu9bnifpObs5AqzOjSe00sWEws+2GBhHiOi1dNK5fDRCyGXfuE5g7kJ7tDdV4vqt04KC7FdOzlZfEDHsedzPU7j7+eEPyt+Pl9NTUtsqwMS4qi9zlmRI7mtHPNIlTJhCtoIr/LfXK+8vcYQIOMXKA9TAUgCh1VPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ0k7g5jZeIdNY9/Tfsnttg1bIIKhfsWZFaLo0n4ZLI=;
 b=oahEqM1ilqGjNxMj8Rx0iBTC3DdEhW53Kvoocyu87tzeVNBLrd92OZWF2xgch6wahm2x6cDSyTRf5/E0zjAlnSjar2TQ1ZEvxbF1+1ZLZfdSc9p3PZ0E+P0NStRSYkT96LaRAzAU7CYF8pnP+33EIsKp8vdkh1yzxYf4/sGj27b0//fuYgbw/pFQkloIOJLAwMN0f0laG9rx9QTftzO69JeAguhstCQ2uYQbW2vfO/jp1DfkRtdCJnqz9sndnF9HV0g5glp36WoXy2DA5zNs+K2I3IdG2DastMy/jcMwVGSRLHMBrZze/Da1WovAnVc9jou9bp5Q0tCjwvzLVPy+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ0k7g5jZeIdNY9/Tfsnttg1bIIKhfsWZFaLo0n4ZLI=;
 b=V3DvSRB+QwN+NYGxiAbCYufEA57OYRVu14/GH4ZPgd1OYI+s9Oa8S+VbQs8b/jcBJl+ehhRTPnZ2QoUF/+9TGfYuIzIe/RAFIemQA8JoUUuSTIYpmUI60ea5fwTNoQBwrv9TT2mQSQfNg9pbrMSQu1IaeF06dbgk5WplnAkVN1Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v7 02/11] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Tue, 25 Jan 2022 15:49:26 +0100
Message-ID: <20220125144935.44394-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a563ffa1-de73-47f5-b150-08d9e011f21d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568F810991D13DAF808B1C28F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRJtmmYiCiNso+noPRCHq1mcwjsayI1NpwyOhhpnmTtQMqXsoGiWltuni/XaPmr86i9zObKlPwaErIOrx5c/UoSrH3OrxclskJ0RNig9aXhLEvbIUGGnMPiO4IGQeis0yQp6uhYUueaL3ILt2hcSt4PXNEqwfK7N+OeUxHuXrfevExGgEXuCZYFhy8yNRsWWVSIt3dSOemrGsHS6EMCOAAlWMrENOyq8aQmwZ4PpU4FnBGpzVs4ZmIfhEYrRoB9AOzOZC4GIcnLnJOwtmov0W1B8SOtsmOMF2Fm6LVabSMhb6pvZYj5Htao4JDLVRXxPOsU3PpbbE7glo3BtqCsslRjKblWvRG8bZwivBQqmVa3nwclOUT4vgHuHVfNK3rDRXces+5D9pMZX0BtJc9xwOfO1vI8E6YWgm5nQIgXokhLWKRfA0aBYj23z4Pv/wWyWSDB30GreaeRiFkRVf9+QmDVFuPRaCoyBz4CD47am78PBQowwb0WFyVQ58y8zDIeIhjD7Wy4fMp04XREw/RPEeqjYlJHXhl6eCKMDEWddJ18bgwFaScziaYnk9XTSeayjwdfxZ9JmXD9M7HlgfrvoHXarNOtj4vzx+NkMXLAep+vIBugPJWJLkmzvFczCNW/y2kcR1RVdAbAy/68p5vJCbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0VFblRGWkcxUVlpb0FpUTNpL3VGck9XYjdnKzlKSXhzRFhpVXhvMXRiZm41?=
 =?utf-8?B?ZVVHNTlvNVJYWVM1RkFSN2JQSDBQTExFaDJ6RCsxRVJieU1yNDlUWG5EZmZZ?=
 =?utf-8?B?SStGOXNnQkVQd2JNYU1sSnBqOEdYTnVHODN2amhWSEVjQUIyUEwrMDh2cUZG?=
 =?utf-8?B?SUtsa3BlcjNEeWwvTHdKRm9QMjRNS0ZFcURnSTdzb1h0TkRIZm9sQ3ZYVUxB?=
 =?utf-8?B?VVhKNVk5c2FEOUNKQThhYVI4MVF6ZmllSGZXZU5OdGpHd1hIRHRiVmxvb0NT?=
 =?utf-8?B?OXBGNmhSV0RWaHpyRnZmcmhEZmFucURPNWdJam03UWk3M3NWK3BjTWdEOUpn?=
 =?utf-8?B?SWdFdXZNbW82eFk4YVZXT3Y4bGFjUmQxODJHeUpnaWZFR3dYRDFmZHFRTndi?=
 =?utf-8?B?U2prMEhrcm1JdUdVMlBlQW9OcDJ5NzNWdU9GNHgrcXhJYnlnRHdObFp3VkZ4?=
 =?utf-8?B?Y1JwS29qNW56MlRqWnFKazlkU0RXcnYxVm1LRDY4OWk2aWpvcXJ6eTZXcVRG?=
 =?utf-8?B?U2lxYllhNzZsWGdCNmxIUW56U0RtbTBqaGdSQlE4VnF4bHE5Y3NEZTR6WTlL?=
 =?utf-8?B?SVN4ZkR3RDBNT3pLU203RFAwaDhQVzk4c29PTDVhMitqQkxBLzRaS0VPVHdF?=
 =?utf-8?B?ME84U0lxaktPRDJPSGZRQkRCWDVFMnN3K0kvU3h3cEJ6UjNOUzBPQmIvZ0lS?=
 =?utf-8?B?WXVSdE5tb0xkcVg1cjBvWnhvb3I4a1VkKzZKSDFHbUlXd1ZYekJWWHVweFVB?=
 =?utf-8?B?OVB2d0d2NmNiK3VXcVB6VFBjUFEzdHpQbEIwbktIclJXY21QMGo2MjJhaldy?=
 =?utf-8?B?Z2ltZlk0NzdZVHRVaFg3eTFYdEtzUXlSeHNTN0JDWlhnM2VkbmM5V3RCQSs1?=
 =?utf-8?B?bDZCUk9wdzIwTXRNWHcwNkpWbTlMbnI5QVdGaWZreTQ2akk4bVh4R3diV1Fs?=
 =?utf-8?B?V2ZGRUhnRW5IUmx0ckR4Z1U5L3pQNFRqYmNnTUVtUzJ2aFVLQS95NnVlK1Uw?=
 =?utf-8?B?bDNicWd5eC85SjVUbU5HeGNoQzBhSjBWcllWZnE0bXRxSEk1clNnTnFCclB6?=
 =?utf-8?B?Zng1cFRjdFJPcGRMU3ZZNFp1MDFnQS9HdjcvbXF6Y3BDOUxqWmlFTFZFaTc3?=
 =?utf-8?B?SHJ0VVVKbUdFR3ZpcVZUTVI2a1FpcjJHVU5ZeVZKQTY5blVlN3drSUNJNlZZ?=
 =?utf-8?B?TkcwcFlpTUUyVUNZcklieFVmMlNiaXZ3QU9xS2oxN0o5ZDBHMTVBRmFiTUxH?=
 =?utf-8?B?b0FoK3FsU3pWOWNia2ovQjRiUXA3cExLdFhJMmtIcmIyUzVJWm1HV2k2OTZi?=
 =?utf-8?B?U0hSZXRYWHRTdFkrYmY1UVJ4b1NnWTJZWmpxelBKVnM0OG1JRUg0TTZHcFdQ?=
 =?utf-8?B?TWZadW5ZQ1VuQ2JGZ2swcDBBSU9XK2V3cTg0NUdJV09wcDJneHZva0dZRUFE?=
 =?utf-8?B?cHdZQ1lwektma1RsbnFBMEs4UVYxb1FLamZCeElFRlFrSFBRbWMreEszQ09x?=
 =?utf-8?B?UjBzU2pxQ3h4TVVGejU5ZkhTTzhPanhwcldHRVhpdVVuNGRXRGxCYkRlSWlh?=
 =?utf-8?B?dzh3L29LMUJIN3p3ZFB6N2VFTTl6NXhtWUZCZS96eDZScUFQbnFERXVWQUIv?=
 =?utf-8?B?WUpLbG4vVnZ2M01kVEozZ1FaR3hDUHNPd3d5NzJ0YlduSjA5UzQyTHlQQk8x?=
 =?utf-8?B?ZFF2dUhuMFhEc2tGWXQwM1pOQlNTd0Rxa0NaajY2NGZ0cDFwSlhsMHV1ZEh5?=
 =?utf-8?B?blRidzRTR3NEM000UzF6aVNlNmc0cmJnUG5SdmJNaDBBR1Y2MXR2ekw1YlFq?=
 =?utf-8?B?dkJGY1RzT2VhaDBzRnFLZ3I4enk3WUFrWWZFLzVyb1AzMExKUjRHMzZ6MHdW?=
 =?utf-8?B?RmtiS2dhREM2aVdXdm5ibXVJOWJYejBnMVFLMXdDR3BVMWlGaG1pVjRZdk14?=
 =?utf-8?B?RXpXbFBvUm8rc256UWQ3R1FhWmFGWlg1WE5zU2VEbC9uRzQzSmc0bHhKTTh1?=
 =?utf-8?B?T09WUlRDczk3aVVhb080NmtURTl1dkRKU29ScjNqc2VOS1lSVHhMdnJJRXhk?=
 =?utf-8?B?ZkgzUmJnZjRqNTVrc2FrcHNJNy9Ua21MWmdOWUM5RUFLVFpESTNnSWYvZVY4?=
 =?utf-8?B?N0wwLzI1Q3dxVDNDWi84WU5sTlBCQXdsQUJMa3pzN2JmVDNaYUtDek9PN0xu?=
 =?utf-8?Q?/j27UNBQzo6d+bVzHZqn/1Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a563ffa1-de73-47f5-b150-08d9e011f21d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:49:53.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZiwJMZsxq/zSXQx0yhlitCEv/3tHLDtyDU/ld3fjVHdFUT+3lw72ze3Yg2g0x5mgWXFxFJIk8n5FT+GDPTwpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v6:
 - Add newline before return.

Changes since v5:
 - Zero out parameter.

Changes since v3:
 - Use x86_cpuid_get_leaf.

Changes since v1:
 - Use find leaf.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..0a6fd99306 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -807,6 +807,9 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index b9e827ce7e..ad6b349680 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -855,6 +855,32 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    const struct cpuid_leaf *tmp;
+
+    *out = (xen_cpuid_leaf_t){};
+
+    tmp = x86_cpuid_get_leaf(&policy->cpuid, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->leaf = leaf;
+    out->subleaf = subleaf;
+    out->a = tmp->a;
+    out->b = tmp->b;
+    out->c = tmp->c;
+    out->d = tmp->d;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.34.1


