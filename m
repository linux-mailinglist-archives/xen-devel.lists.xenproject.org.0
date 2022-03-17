Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD474DC47D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291507.494789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0l-0000dK-MY; Thu, 17 Mar 2022 11:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291507.494789; Thu, 17 Mar 2022 11:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0l-0000aQ-H7; Thu, 17 Mar 2022 11:09:43 +0000
Received: by outflank-mailman (input) for mailman id 291507;
 Thu, 17 Mar 2022 11:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUo0j-0000K7-QH
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:09:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc8f1d8a-a5e2-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 12:09:40 +0100 (CET)
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
X-Inumbo-ID: bc8f1d8a-a5e2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647515380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lfeyPSkSe0Jsl+f2Ot+4QHS7ZQQP6Mss8udTQ8D37jk=;
  b=YgVBeEdGlo1a4M0nokBaWdiyrpVh+vZEtqsVnnFqLPU53QhdGKwQe8Sz
   mfw4ncTpikywonH02j+nOx6PIscDZ6yBOc3VwpfsFTEN71alR+vozRB/z
   +TcH2bth8Qt8RVjsBMcdE+Fp80qFcjUV3T2R9JotzR7mHnb8zPBiDc+mb
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66412180
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:17lIz6CJMzfqLhVW/yfjw5YqxClBgxIJ4kV8jS/XYbTApDx31D0Ay
 zRNUD+DPq7YZGOnf9tzOt6y9koG6pHQy99lQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgh2
 tJ8i568QD0wP6nJutQHSQFxIzlHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgmtp3JkeRZ4yY
 eIbNhlzVhH8UydON28ZVJcdw8Km3UDgJmgwRFW9+vNsvjm7IBZK+LvqNsDcdpqVRMFWtkGCr
 2nC8iLyBRRyHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDHsv6biO6rHe+px8YXvhgCfciwTGV8/+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4O7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNtjuk0djj8hu+cWGJDT9b0gbQ8xawcRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8Z9qmv0oSD7It04DNRCyKFBaJpsldjBO
 hO7hO+szMULYCvCgVFfPupd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs+1yEr
 YwAa5PUl32ykoTWO0HqzGLaFnhTRVATDpHqsc1HMOmFJwttAmY6DPHNh7gmfuRYc259xo8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:jp/JwquZvmKdmnKJd7xxppmn7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qLOMexTwqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66412180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNFV2uhM0plfg7RVctUL964KvWj+H03331tOTTfNhss8TRLqb+cOSC0+Rzh6gcL8WMRGyEV9nuasNljgD0g+tFgwaxWiO25HW/mfea+ApU06EQOg1ppd0+I4ZNItV56k2hu5aE87DWHCYEcyQ5HTIEXiHDugtl2MWLnHXyyja1TQqCMzLGHTLotRgTf20RFXEqMl9nqSPxcSkuexaYb43mBfKt5xx63hgHiuc9BYiVn0TXmfA3pALiwMu95F5jkVA6wWRBc8nzNkTT6X5U+eF/EoXfqHqKE/uZ0xxkVB1WPod/CbdMFWemGhzGZKmJchN5AZSIFh+Xgo7HNnlmgDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3+aTgeZKg2AgprDOZi02cilZw8eZZMU3TEy+Ao1rUk=;
 b=Q//jYNhZfHODPLNie+A5fJ/LELLpBoM7Bxw7ei6+WMFvReWjatn/gIbkHPHYMiKLdUzTF49ZMeDgVXEnG1Sa2UDkZXuKNBmJtfjM3vjPLr/3mTJzpKXNFA5BZ00qSsVGJ4BrCfZuVt4TCX4p0IrHrbSHsO8TV1dAn1CTy91tTsnrTHOE1e5HV6UlYaXlLJipAymKW0Ppdg3a7RYbis+J1bLyjUizw0or6FV3BD7RjcuGdIBjs10PqpZvfys0i1ariV5wtDy7V/Z/n7pU7soA8emxrYdDtZtmqtAFL+wrNy0qpdxHUFd/DfgLTHjBzNJ0EctD90TTwfiyXJHj9WHxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3+aTgeZKg2AgprDOZi02cilZw8eZZMU3TEy+Ao1rUk=;
 b=WNu84WxGi2leEyM+gID+RarSZFVpPsIc7k9SDEY1sfE86+hw3JorWAxM8WwDJ36QW5WRbOQdBB6ZnNtQVN08AHyj+pBLJdJIgpKUfp807Y6wLE3Qqjly448JP/xYGit1qXEJF1d1w53slJhDXHuVek8SnWzrSMS3LLNFn8Ol2UM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Date: Thu, 17 Mar 2022 12:08:53 +0100
Message-ID: <20220317110854.39050-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317110854.39050-1-roger.pau@citrix.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0338.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc3440af-383b-4fdd-e79f-08da08068f91
X-MS-TrafficTypeDiagnostic: BL1PR03MB6102:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB61024246B0F5ED7B0F6A12F48F129@BL1PR03MB6102.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3MN4TM0zmkjgQeCjSMfBMt6DAUrBtHRRXo/RCeO6/1aOXelvLnGEfd738hdO9EI6vbaGRe81b9djajenVcbtc3DdmE2L65l+JOxGR/Vist3uhq+eghuiP3aqVIgyfs4i1HwMkSV/H3y7XGykLkdfwrQXlC4mVXwH9UeGzdg1wLZIFg+86MGq6gH0KICybZWtsjByphjBK6lowoN7xQEuPZ5p0n04Q+R9DP83G4JLNtx2vk5QrvBt5BoQlfNlsSOvqkM1I9RboRYFuY0efyZMOUtal88cyaiQByHjD0QpXr8PndP/3AjQltqHKFwMYnNFpe5s+ZXhkXY82Liil0wdCKB2Zd8/puIRtJjuaVf394SCOxK/EFxUE+1Ro/mVnzkBLJ6hM9rVmKwDXrLCq/vEdKkHu1Nw6QXA9ExGahuCRHFoIUplwgc1yuQvmJvHQFUQpuImg5L/5Wmj3MgF//u1UVBdoLc4aRwpagXzu/O2VWKrFbYz4L1CmgsKOqxEujrnkIC8FGipNdR/u0b01rzofknZKs8rPbKM/FvNf2MOXcFhOQhGnQnQWQ+VUmfws3lnaUCDqmQmpl4o2z47iwLxAFTbvHy9ottBzuM0nPqrhw+Fufjt8PsDdIY1drTEfbCcFjN5ylni+xisq+4w8406pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(4326008)(508600001)(8676002)(82960400001)(6512007)(86362001)(6506007)(5660300002)(6666004)(6916009)(8936002)(107886003)(26005)(66946007)(66476007)(316002)(66556008)(186003)(36756003)(2616005)(6486002)(38100700002)(1076003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxhTHhjeEV3UTBjd04wVHZHRE1zYUI4NUtXUmg5a0x0ZlMvWHNyeWpubzBP?=
 =?utf-8?B?c3I1OWRQTW0reWx4V2s3NDQ4R2l3NjZMdDZHekw2Wm5peVgyVU1sb1c1ZEIv?=
 =?utf-8?B?cjBBNzliVjFadnBBMitoaWtGaHJsVnFMYk5USDMxTjBHZVF1R2E0MGhNT09s?=
 =?utf-8?B?aTQ5MTZhMUpJa1oyWkhDZDZFQURtYWlOLzVVV3pFcDdEY3VGdWR0UXExMlpO?=
 =?utf-8?B?WTU5VGRDeDhYYkZoRXB2M2YxcEZwSlByU1FXTEN4ZitVRG9oL0R6Vmh4V1RR?=
 =?utf-8?B?RVJ0QkowMCtoOEk0MVBrK2srMThjVmU0NGdVc1FNMTZVb09xRXNxcjZnSFJ2?=
 =?utf-8?B?a21XVHVlbFJiaHhoTHQ4SDhNTURQWjJxdFlyRktJM0ZWcG00OU4zZnI2ckpM?=
 =?utf-8?B?L2h6N1paMmZXZXYrMGVzUlUxUkt0UFdCc1cvTDdvMXdzOTNWWkNlNGY0UUJs?=
 =?utf-8?B?RkpZWEZlQ3puaHc4Ryt4T2kwcjNGYnVOOUcwemdjS2w0aG5WUGt5TkFsRVll?=
 =?utf-8?B?SlQwN1NtWTFHdVA0ckZkeHFHODgyOS9iaWVDNFpJbVRNRFhYR0tZL0JmVnI4?=
 =?utf-8?B?d1VxQ1cyUlViQ2dZMHdQTkFWMmZKR1pNNTVvejg0RUZhUVozZnJOOHcxQkl2?=
 =?utf-8?B?dTl0U0xmc0Z5WVBoSmtJY3BUM0xScERTam9TZjloanFqdGxHOU9IUTNZUVlV?=
 =?utf-8?B?K1pVSHZpMWJQZ2ZKRzYxN0JQQjM3T0VLaU5IajZZcklxMFRpZnNxVGZuTmdB?=
 =?utf-8?B?WWkxYzJkTzlSM1lPRFp1RXJkd0FpcEVmSWJwelUzRVlyQkpBbUs1K2lzTlg4?=
 =?utf-8?B?Qjd3VWlQZUlzYmZjdjNoMkxYdEJGaFBaYUo0aEsvZjVZUkk1RlNJai9tcXZC?=
 =?utf-8?B?cU5SMTVQZTIvbENyNVhRZ2h1MCtZdzZYUTZUdnNXSld1eW1kZXNZNEY2cXZC?=
 =?utf-8?B?OTQ5WXhpaEZFVWdDd2t6V0RDUm5vbjhlYVYwQmNTdjFJUWZGYUR2aFhRUEVW?=
 =?utf-8?B?L21kSXcyRUwzdlNab2NnVU9oazNFWWdyQ3ZHL3pjSTZOM0dlL2srN3Vnc0lX?=
 =?utf-8?B?Q2J4OWV3L0hzd1JXbW1CbVN2YkV6VlFVeWk3b0h3WGJvYlRDMXp4QWJlYWRw?=
 =?utf-8?B?YjFLOGxuNGIwbVQzYk5qWnQ0dnNNVnZjbURsMkE1U2xTVzlaWlF3Z0J5NUpB?=
 =?utf-8?B?TXdUMXdrRlpTbHFsT2Q5Y3NhVHRadklibGMzTE9Hcy95ZUdhRVhXclVvblUw?=
 =?utf-8?B?TG5sRlBSZlkrMGFrQy9oNWxOWHVzYWJtZnM4cjZMREYrN1BpNG9sZUkyU0hy?=
 =?utf-8?B?VmFtYS90Y20vTTJDMnRad2JwNTdCN0IzSFJPM1lUMVFBbXFPRTBqcU12c2ph?=
 =?utf-8?B?UUsrelpvSXIvajFOb25UQWxndzc5SEpGanZscmZhaEFwNklMTnBvNU9ZUUg2?=
 =?utf-8?B?a09sRjViTUJDTnVNc21EYXhPMldrQXRkSllkSzVSVlBkVW95UTdwUlVMZmt4?=
 =?utf-8?B?K0lkc1pobGcvejBvck1zQjhyaTE0M09aeFRBcE40WkZPbURMVEVQTFBNbVd1?=
 =?utf-8?B?Q0lsQytid1ZTb3Brb2VUR3d3L25DTWVUdEFEbWZKRWk3ZjlmekRjMWxnVDZV?=
 =?utf-8?B?QlRPdEtIbDI5RHlzY0lQM3FOdnR4Zy9tTlFjd0FiYzlVbXhTNzZFaFFyRXFP?=
 =?utf-8?B?QU56Ui9wd0FFN2NXZTZzL296T0tJeElJN3B5cytvMTB6My9mWHZJc2c4K2RY?=
 =?utf-8?B?dERVZ1MvbTA4ZWFsQjdsQ0ZXbEVlNm5RcVNuclNqTzRoUE85VS9aVVVQL3Zi?=
 =?utf-8?B?cFJUQlVHS3lyQndxRjAwU0dYVVZmVDN5ZS83bGU0UTdGd3lIUTFFMGlqSTdF?=
 =?utf-8?B?WkJBWW5ZY3dYek5naE5VbVFXK2lIZkFpTXJaYzliU2J3b0R2WktKcnNiRUJH?=
 =?utf-8?B?MDVLTmovOU1jRFpVZmJWdWpKTzcwbFlUZU5udzhCbzQxQzF5WDJyNW9lbGY5?=
 =?utf-8?B?YUFkQjFkMDlnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3440af-383b-4fdd-e79f-08da08068f91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 11:09:09.9437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc+CK+2MSOgVS2bcao+2/hv6wVF46xYU2kfGFsneM7V5BOvrscHhtDqPvCvg42QHMjBkH30F/4dJ88K42EshEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6102
X-OriginatorOrg: citrix.com

A side effect of ignoring such sections is that symbols belonging to
them won't be resolved, and that could make relocations belonging to
other sections that reference those symbols fail.

For example it's likely to have an empty .altinstr_replacement with
symbols pointing to it, and marking the section as ignored will
prevent the symbols from being resolved, which in turn will cause any
relocations against them to fail.

In order to solve this do not ignore sections with 0 size, only ignore
sections that don't have the SHF_ALLOC flag set.

Special case such empty sections in move_payload so they are not taken
into account in order to decide whether a livepatch can be safely
re-applied after a revert.

Fixes: 98b728a7b2 ('livepatch: Disallow applying after an revert')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c          | 16 +++++++++++-----
 xen/include/xen/livepatch_elf.h |  2 +-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index be2cf75c2d..abc1cae136 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -300,9 +300,6 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
          * and .shstrtab. For the non-relocate we allocate and copy these
          * via other means - and the .rel we can ignore as we only use it
          * once during loading.
-         *
-         * Also ignore sections with zero size. Those can be for example:
-         * data, or .bss.
          */
         if ( livepatch_elf_ignore_section(elf->sec[i].sec) )
             offset[i] = UINT_MAX;
@@ -361,8 +358,17 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
             else if ( elf->sec[i].sec->sh_flags & SHF_WRITE )
             {
                 buf = rw_buf;
-                rw_buf_sec = i;
-                rw_buf_cnt++;
+                if ( elf->sec[i].sec->sh_size )
+                {
+                    /*
+                     * Special handling of RW empty regions: do not account for
+                     * them in order to decide whether a patch can safely be
+                     * re-applied, but assign them a load address so symbol
+                     * resolution and relocations work.
+                     */
+                    rw_buf_sec = i;
+                    rw_buf_cnt++;
+                }
             }
             else
                 buf = ro_buf;
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 9ad499ee8b..5b1ec469da 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -48,7 +48,7 @@ int livepatch_elf_perform_relocs(struct livepatch_elf *elf);
 
 static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
 {
-    return !(sec->sh_flags & SHF_ALLOC) || sec->sh_size == 0;
+    return !(sec->sh_flags & SHF_ALLOC);
 }
 #endif /* __XEN_LIVEPATCH_ELF_H__ */
 
-- 
2.34.1


