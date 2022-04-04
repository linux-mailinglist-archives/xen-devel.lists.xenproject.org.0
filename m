Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191174F180B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298399.508335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOOP-0005pJ-5G; Mon, 04 Apr 2022 15:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298399.508335; Mon, 04 Apr 2022 15:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOOP-0005mP-1d; Mon, 04 Apr 2022 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 298399;
 Mon, 04 Apr 2022 15:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbOOO-0005mJ-5n
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:13:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0883a15-b429-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 17:13:17 +0200 (CEST)
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
X-Inumbo-ID: c0883a15-b429-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649085197;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+I1G5mO7xQT6/YZPWM4BmaRCqxUJGEjSHTbQXe0kJts=;
  b=S0sb/xcQq+M3JcFZFNgVts3KUmIGVKsBGpcN4B036gG1Fo+R0wiju4H6
   J0XCGOrZM/1Qo41H3GXgpGCGHAb9gzQEUVAfRV3Tn9Jnl+n1gUsNmdIZs
   xS70cnMCd3k53Fkni3d46oLIq0Ftrb+3oK4PFZQv2zjTbZZ9O77LaQ7pV
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67383345
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:URozVKqIUNdT/kdr9lYe3OFxf9ReBmLIZRIvgKrLsJaIsI4StFCzt
 garIBmDOf6KYTT0Ldtyboiw9kgA7JTdx99lSwNuqSg8RixB95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y+q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOI/0nPo9bANhDyh4NJIc5KaYHWWcmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVCOWE0MEmojxtnOnJUMa4zh9WUr1LOKxQBlU+Vjo8v7D2GpOB2+Oe0a4eEEjCQfu1Xl0CUv
 HPb/Ez2BxgbMJqUzj/t2n6jiuLAhyrTRJMZFLr+8OVjxlKU2AQ7ExYRSUf9rfCni1WWQM5WM
 Ugd8GwvqsAa+FSwS9jhXzWxuHOeogMHQN1UDvE77weWjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thvrZ3JTdzVbI3ZZE01VuLEPvb3fkDrJbO5nDo6KlOTpEDf5/
 GqWtXcCmpY62JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BP
 RS7VeB5vsY70J6WgUlfOd/Z5yMCl/WIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjwXC5AUfg6kGHqG4/xNIPHIAhkmAs/orihkXyaPUe2PibJGd/pznPQBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KBkNsJJt0+94wIx7igw
 51IchIBoLYJrSacclvih7EKQO6HYKuTWlpgZnN8ZQ/4gid7CWtthY9GH6YKkXAc3LUL5dZ/T
 uUfetXGBfJKSz/d/C8aY4W7p4tnHClHTyrXZEJJvBBXk0ZcejH0
IronPort-HdrOrdr: A9a23:iR2rNKxWULF1ddbqVBG1KrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67383345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka3MBAbtqNFzGmsTmXAS1f/SNov7YAReuIMFlW5StEajHmVE8YyK36C9GuvG17KEqM0zn1KcSr3f7oCfYOnwEZaQ4GUMeWOqIlMUWU3DILQwcnfWhb+4PORtipwTb48oSX/XVWNcT8KcryILBEK0dB8FEIJztk/EcXWOg9ibDOq3E7dsHJ1O1aWya7+BiJ9RMZKuFNr69fLCa3JiIeh1dkP9zkcu8zhWY6O57jE7blDJ0iFdCLdEiq02KXLqnQZEG0OLnr61arMQnwtzjZu9biV+1jRXR8yABeXht0X0HPmYpvonb8visSx9wvybMfXhCDqLmyy0Nb3vdlsaaB5QWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgKBUul1ceWBKIm74hCd1R6uDpEodk9bv6wQWCNq7eA=;
 b=HrsXseQbv9SvB625vMS4hPri6lxXUG2o97iVRjANscBtuMXusL4gf5tYNqvbnW6rRpoMwS5Qc/HPYVFibEqUYb1kOzDYD4exyJ0Ag4Dx0EqupajQC2+8vFILVvviAxpDVp893aySk0Is+nrqX6qD+EKFB87uA6tsrgbSEtsBLE+oOd59PMUmtwPNFvnIVdic2ES6b1g6jIsBayd4Cm0YVSjZ7juw+ZyD16Qya170RGhHrY0ugrnA0dWy3vqSibEk3UCYredYRmZtWGtIfjjoJx03F509YerDpEwcNLrkjHSXFXGXmrc8HZsvvo90Aa2FDewlwjDK08GAXNBx7I0/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgKBUul1ceWBKIm74hCd1R6uDpEodk9bv6wQWCNq7eA=;
 b=wJ37k5e8hO6LWHBaCeTzDJhwS0J/oq1u4monQabShq4A5+z/DqseLDzlPnpCvXxObqESQxcV9f+lH4AoTRCh7Mlvdkmt3Al32ll7NA42U8VmZNFtk/CJyYYViFSJvpOm+EXlg5xMV1vdAbY0u9spqwI7HJ3w5MNvm5YOlVJs9Xk=
Date: Mon, 4 Apr 2022 17:12:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <YksK9hIbJbOXkIYd@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97152026-f345-4bf8-ab7f-08da164d9b44
X-MS-TrafficTypeDiagnostic: MWHPR03MB3261:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB326128F1F7426FDB4D456BA48FE59@MWHPR03MB3261.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgv4E7DHPuQkqnyaccZiNKZ0dvLRTURIa6GCmPQQ+nQgHGzy98sG0IRasd82Zn18gMCsB4yN+DFd0f4QDa6eBC3EnT4tg2FuQR/4Ygyw/1AsWkfUjjooxWHhWJoN6Zzc4IRK6ZxWOK3DjvQlNQd/TmM+JeBJPmPB58fwELUwWjezDgJ0RmHgzFNc6guvMCrUPgcOF6KAxucL65zv3uLhCAgW0uTA/Qjo3I4w455mcLjG1pGC/A6fSrmACzOLJsO3C9RXQXZrnhoNnr5NCrC8UEhHpoFIIYCoyinEFLV6FUrWSgotJVtJJqP2NeNfbvmQ5eTJIWJBJja40YAKvaniq+R6wrUr9VFGc8/id0VbUBcXAV5ARGYltN27tQy/Hqc/5KJCpEnkeAW6o2O+L8OGlN6DLC4IB1sJ4sopwkMjEqcclr6E1cB9tpVykwqe+BhUcxLSq2aX5oqmmKZzv6RtQaFsYOR3HoymgVyKZpD0t+4ZqpExHDLqKaWyBHenQ15HL989GyatPDPPk4sXlxRiWgg8gOOojb7NTBynn0257TcxDqYiprdk2jpEbuXe5ChVOlRgt0GJ6B7fmc29M43yvcYyuTACQg/LbrJZQqWdgcq+9PAzohQg/5cYbE4vWO0CuG5tVCxg20i98fjx1p6xMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(5660300002)(186003)(26005)(38100700002)(2906002)(85182001)(33716001)(83380400001)(8936002)(53546011)(107886003)(4326008)(54906003)(9686003)(8676002)(66476007)(66556008)(66946007)(6506007)(6916009)(316002)(6512007)(6666004)(86362001)(6486002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVLQ3BmNnZtMUVKZUZnQ1NOempuNUprWVhDYU9qVHpLNkJENjV4SkpNVmVM?=
 =?utf-8?B?VHBMdUFZcjNqSXZnYnhJa3hySjQ1d3NDNUY2MEMyeFN5dzFqeThGUWQyR0ty?=
 =?utf-8?B?a25yVUpwN3g2RzFaRjY0THVJT3BZdzUvTGZ3WWkyTTBiaU9ESnZUdzlHTHlo?=
 =?utf-8?B?bXdrS2hGdDVqMmtHcmxhRlg4SW9GTW8vQWZ2U29qbnEvem14NzllamE5Q3h3?=
 =?utf-8?B?bjVaaEFqZlZYOFMvbVpvWVhsTGFpTFRJM296UFAvWGdTRXl5QURWSTZVQVNv?=
 =?utf-8?B?N1NOdDRQbEVvRzdsdmZIMVVOOGFJRUViWk8xaFJzWjZMN0t3eWhSejVlNTEw?=
 =?utf-8?B?eW5BVXEyblpkbDhhN245cjRZVjRobDNmd1R1Y2NKMTZqY1FNdjR5Q0pBWUZP?=
 =?utf-8?B?MDY4OTVJSXNmTGdMRWNFT28yQU5KdmkwdlJvM0h6eDJxYVMvNVlzUUFhZTFL?=
 =?utf-8?B?aXVDMHd6SXZ2dit5MzVVbFFxWHZUekxLZ3RtOWp6aWZMbGZtQnc2dzByQjhX?=
 =?utf-8?B?KzlXYWR3UyszNWZnNXZoSzBjNkE0WjFHQUdwYlBuZFNuNTliT24reThuT0NO?=
 =?utf-8?B?TldYc2pZQTRIeTV6QS9lT3BGeVdjUjBYc3U2R1ZXRElvOXNNNEdTSVArbUtx?=
 =?utf-8?B?M0hGQmUrUVE0QjZ6VkFudUFCQ3pFZlpoRFdXakpjbTllV3dwczk0Rk1KaGp3?=
 =?utf-8?B?K3hGajdZQUc2OUNwbThDaGxOWFp4ZTZoWHRwem1FRXNaeFBpV2x6ZWZHbVYv?=
 =?utf-8?B?U0M4NG01ZkwralVMTjVkVGZKZ0JPaHpFY3ltMHpVZW93Z0RGRUY4RnBiTlFo?=
 =?utf-8?B?Y2Z5M2lta09jMEtobFE1TGFyVk4vb2NhQytXWFpWQlAyY2I2TGp6aFRXSlZR?=
 =?utf-8?B?S015cFVER1Y5WTVkYVNRYXVsbnR6Y0RkWENWcmIyUFdDakFJRGNiZ3FSMi9G?=
 =?utf-8?B?aXZpRTUzMnNyMElMWXdCNUcrTWgzblBidmw5ZVkydGN5VlRONGZkNFcxV3Ni?=
 =?utf-8?B?U21UNGJDTDYxbVdHV3JUWVhodjlGOE9HMTNOdEhHSUhxNkltQTA0bXU0WHQy?=
 =?utf-8?B?Q01OU2FrWUFrTWxjZXRabURjVE5RQTVPNEhSWk9VSGs5Q3NUNlhFTWtSdTV5?=
 =?utf-8?B?MHZoT1ZPdDZJQTFDaEpLRXJIVGtJT2UzWGhDSXRWTmtGcUV5Q09jZU53Wmsz?=
 =?utf-8?B?ZVVpem5WVko3UUsvaEFHQnZKWG5zcXU2VFA5WkkwYjc0SElzYWs4S21BRDRl?=
 =?utf-8?B?V0JaSS9heWpNdG5vMGVVdTNIeVhoa3d5N1RKZFZaandoVzVBa0tEM1NCMkhq?=
 =?utf-8?B?WUJMNGtyaFpuNGVacUkyVDRFcXhJQkJOVjBnSXVwODZQUVJYTlVmY1d6K3Ar?=
 =?utf-8?B?amVveWYwMkV4eXg0NXVhbWhKQ2lDajRVamlmMi9YQU9yRU1lNkNLTi9KLzF5?=
 =?utf-8?B?M3NtYmxycmNWc1BseE53UnhwdVlPcHR1NU1Fd2hMc0JXZGt5U0pNSXZFVmZr?=
 =?utf-8?B?eVBMSkFsbTBkR0tXV09zQnhWV2w0QUNFZ0pTdW1Yb25HMnhMTFRzL25rWDd2?=
 =?utf-8?B?K0YyeldHdkk4WStZaXFrSUNFbkZheXJhTVpDK21LNWtJTjF0MWV4ekI1aTAr?=
 =?utf-8?B?VFEvZEdpTU9GZlNlbW54YUlXbVlyeE90WkcrczZ0dWJZTzYxcTA0YSt5azZ1?=
 =?utf-8?B?UjY3Tm9QUmZFc3M4NXI0K3REU21zWEthR2lWNGR5bEJuSGg4cWxXZTQ3RStn?=
 =?utf-8?B?RzRvQkRKWm9hcVQ5Tk4ya0VxVFZoOFE1V1RZNU9KSDQxRU1HWUEveUt1M1FO?=
 =?utf-8?B?ZU5YbjVoaXMvT2k0cGZIYmxabTBlQWRkQ1pPd1dGR0xTUTBFbmNCSC9zN3NE?=
 =?utf-8?B?UkE2SzJjeTZWUDlTdDZONmpOL1JvaURLdjZQQkdVa0w3Uys0aEZOZmZucFdw?=
 =?utf-8?B?aGhhU0NTYzNUcnNxQ3dkQzRpdFhQY2xlUENrd1BCZStVNlRBS0lzUDhKczE0?=
 =?utf-8?B?RjZRbkpYYkh5ZnpyZGlaaTc3d01FQXRoWXZmbE9ReTQ5M1RrbU9McmZYZGRo?=
 =?utf-8?B?WU05MlcwNmhaUGpkakJNR2ZKTkl5SVBBSDNvZmZ2a0IrYzNQWHNERVVhTDIr?=
 =?utf-8?B?YTE1bkg0ejN4MHpnQjZ4Rk1ORWFCa3AyYml4WFZZWitITVJJWW5QRWhDZE1h?=
 =?utf-8?B?NXVUZEFUY2tCWUxGaHZmb0VFTG82dEdNaFI5MnU3YW5jQ0t0bkZ0QkVmVUhn?=
 =?utf-8?B?NGlWRHkvaXBUdlhkVVRjV0duQnVzWDBQWWxIbWU2NmtWaEgwNjU2bVcyNVg1?=
 =?utf-8?B?aFZLWDcwSVFVNXN1YWFPcVYzdnRrbVpDVUQrRlFWL3Yra2owUUNxbXRhK1NH?=
 =?utf-8?Q?kiqW/5C/mKQQSyXM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97152026-f345-4bf8-ab7f-08da164d9b44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:13:00.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDEo51W8g5mdjIvhsjeUrl3AqkyELpvtgM4z/vEtn5QzmaNTL0nJQMAGHO563M2rHfC9c6GagSwFAj5mkD4Yyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3261
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
> On 3/31/22 08:36, Roger Pau Monné wrote:
> > On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
> >> There are now instances where internal hypervisor logic needs to make resource
> >> allocation calls that are protected by XSM checks. The internal hypervisor logic
> >> is represented a number of system domains which by designed are represented by
> >> non-privileged struct domain instances. To enable these logic blocks to
> >> function correctly but in a controlled manner, this commit introduces a pair
> >> of privilege escalation and demotion functions that will make a system domain
> >> privileged and then remove that privilege.
> >>
> >> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> ---
> >>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
> > 
> > I'm not sure this needs to be in xsm code, AFAICT it could live in a
> > more generic file.
> 
> From my perspective this is access control logic, thus why I advocate
> for it to be under XSM. A personal goal is to try to get all security,
> i.e. access control, centralized to the extent that it doing so does not
> make the code base unnecessarily complicated.

Maybe others have a different opinion, but IMO setting is_privileged
is not XSM specific. It happens to solve an XSM issue, but that's no
reason to place it in the xsm code base.

> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> >> index e22d6160b5..157e57151e 100644
> >> --- a/xen/include/xsm/xsm.h
> >> +++ b/xen/include/xsm/xsm.h
> >> @@ -189,6 +189,28 @@ struct xsm_operations {
> >>  #endif
> >>  };
> >>  
> >> +static always_inline int xsm_elevate_priv(struct domain *d)
> > 
> > I don't think it needs to be always_inline, using just inline would be
> > fine IMO.
> > 
> > Also this needs to be __init.
> 
> AIUI always_inline is likely the best way to preserve the speculation
> safety brought in by the call to is_system_domain().

There's nothing related to speculation safety in is_system_domain()
AFAICT. It's just a plain check against d->domain_id. It's my
understanding there's no need for any speculation barrier there
because d->domain_id is not an external input.

In any case this function should be __init only, at which point there
are no untrusted inputs to Xen.

Thanks, Roger.

