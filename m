Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9374502D5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225761.389925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZaH-0003nj-Q7; Mon, 15 Nov 2021 10:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225761.389925; Mon, 15 Nov 2021 10:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZaH-0003lN-M2; Mon, 15 Nov 2021 10:51:33 +0000
Received: by outflank-mailman (input) for mailman id 225761;
 Mon, 15 Nov 2021 10:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmZaG-0003lH-6C
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:51:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2138e3-4601-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 11:51:30 +0100 (CET)
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
X-Inumbo-ID: fc2138e3-4601-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636973489;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=xmicS4j3PpGxmK07M11vvvVk1yBjTw9RtlFkieq7KMU=;
  b=Iw9KrRhknjYt/LXITGrnyAZmODCqeW3dE7DopNO+sJ+T6l+IZSttnH+i
   bXR7LlamDMKR50L5lDcpFE6ZmkQwvhIuzH0qcPOlR+Zm8mvuT5j+WPDWH
   WpFDcOezsHMyORFMW66Cy+C/2WztuEBzkgYVPiO0YBRGmt2bhK+RhowKV
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JP+8AjZp3S+9GG2aNol4ZXYJxjzJtflFSsYmyU37w+hVMi/j6rB8MFLNQdBSLVD19sJdD+7yyT
 +qlidCq7TQZJpsN3fUIquPpvnxDjMltt0NluFY8pQetwQWKk5kzaguwKeA1gMagPb5yhuGp3CY
 ohcgi3NhC1yDhGzE5+LAjcXRn056B/qFsOCFEaAihcCUQmMc+0uuG5W6Fb04rtrSIkCSd99Zu3
 5DaF+Az0cfXHqT4zRsyEjx0+Q+ap3Qj7HKHIwWwhibonfPtetPGLhSykh2OG9ZrXYw6lBW1NH8
 KmH7gnCL/sqzbQw7jDHwzjn3
X-SBRS: 5.1
X-MesageID: 57343094
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TK1sSanmRb6O8LeG3IfTf6fo5gxRIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXz+OPa7ca2v9Lopwad/k9k8E6sfWydUwT1Bk+y82ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29c12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PhnkqyOVgsQBYH3iv0aciRRCyBnIaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpv3ZwVRaeCD
 yYfQTRDUhvZeBxSA3USUpslusqsikb5IhQN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkFMPSPxDzD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljM2fOpuDOED0y222LPTwjuQHmkdUjEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp+ZgPe1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoCDyJNwOvW0geBsB3iM4ldnBO
 hW7VeR5vsA7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVBCe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:bHBlZKruesxB2i/nJ6m85RoaV5vFL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPMs1NaZLXLbUQ6TQr2KgrGSpQEIdxeOlNK1tp
 0QDJSWaueAdGSS5PySiGLTc6dCsae6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+twKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+xLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfiWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrDXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MF40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIYLH45JlO61GkbKp
 gvMCmFj8wmMm9yLkqp81WH+ebcEEjaRXy9Mwo/Us/86UkjoJk29Tpc+CUlpAZxyHsKcegw2w
 31CNUYqFhwdL5kUUsEPpZ4fSKWMB26ffueChPaHbzYfJt3SU4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57343094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNIAHaz8mp9EHb7SjFmYSXurUgoliRHUBoq68F7RS/rnwJlBFUyl98brS45ellB+Xu9Yc4zDkX/x+8wTO5WkRLPTGpoX3/ZiPRWQBBUcHF8YhmDhZipCoj/rgjAt3AhTZ/kivxHkINaCpC9K4UrsUSb9vnQBnW+qP42NA7FOTA5pFjHGqhiKvTj5fo2qWd9lbRQqj3bM7r1MVDTceq+EvBp1YxSJ2DEOWyw/FUwY2uzEQ8esRD+yABnmoKVX+6+5jKHo8Y80tWB3C/RhjeF6EsmaMgIznL1DKuXLf7ntCHunuHvgJyF4RiUbblK7d2t7EPmlYHz8pYF2+To+qqc2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcvpshRC/FuPBzT0ZYy1uTBjK0MC9lE+kjC+8FRS8tQ=;
 b=nELmKuP/jXziq9cgXj6vgN15rGT1olwCTbqod6uJEl6jtPkAHlJh7ikqsrNLXNt6xQQ/9kqhO+OM1E/gMSh6gJO2NCtT7/otrdwoAogVSYpVCn3dqOWtydIsfJcbwdIiSxlY2MJV4Zv4dkewcRWo4f0Lr3h9mUk+QiZBnDYnod9cI2hgfLkh4ek+02KD0tkfMiwAZxY32NpBfNmS7JC/v90Iorn/+WYjESq1P0lRn/yf3F4IS691wwiqVfEvAR1NXbLy6s5y7TOfjsuMiuFr8lEip04286mCiDS6uT4SJeRzzWtlTZmz6yz18jei4LgAPS9yg7MtbeaW2RSaMq/QPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcvpshRC/FuPBzT0ZYy1uTBjK0MC9lE+kjC+8FRS8tQ=;
 b=O0olABJKefhhg14mTRfmjt1q7/RQD9ZsN6LU0tbWHooRs6EblcxWJBhGcK5VOoEJZfk8LFFBmQ8ecbcx/aUS0FMGFEWhnJTxp4nHCmoI82aruJNcSGrB7HMkZUE3Enj1ZRjicbGwjfkd3SzP5WRsX7aSi60VnLermNPWlYtyVPE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16] tests/resource: set grant version for created domains
Date: Mon, 15 Nov 2021 11:51:06 +0100
Message-ID: <20211115105106.928-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d95b34-fb6e-4e99-b098-08d9a825d890
X-MS-TrafficTypeDiagnostic: DM6PR03MB5066:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5066CB5C58959AFFD641C90A8F989@DM6PR03MB5066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7JyS4inTzXDXA+ocyu3nSFUwRigFyvDMNxBHc4J4DAwfR0c9UXZMvRHTIXPxhkNJCi0gyGPSQsmhzucelW1/YLpHsTEFKD6M0cx0gHzgeII8VMDFf5VIZrzTIz2wlYYt7cvxnY49oexQ/ctX2S6BlqfzAL4VTQdRxUx2tIQZk3tk6sipQPY4B7YsJtbC5NNRQ73nO782+rBMhLWiGmN+V1HTfrmzBIyWJTCd/pqwt/WE5Vfm8uPMDjqMPuYytXisJedjCzGpUGyjXpl5Yr+xSc+TEludV/AxyidpRxjTp6EmO3bHpDw0wnPYPMe/kPwceboPbG2UxALMMWz4GrO4+SJMhwL8kKbWzQ0+1KEnId1fnOhHgu3yN+nIwz1RE0OLNgRVYtbKWb+odPn7+nrpV7Ufmcy48rZNLkwjR80vCPTN9dLGTsqhEeQU97mQwO4SRVI5Ura6/m689KilRTovo11lIvOsjpORPr9O6ONWdBHrIjTEGuXSAh4HEujM9ZWL0ZU7PXvVyPmn3ENgUvRmB5KFpIYoIS/hihNpJ6MKbatXvzqw21KCBLvS3EMYPdLEXUglKvbxXcKauu42/dD+vmzG+KY+BmIHQmzwanxpZwozRJyFoyCqo9/5Zefn2E0VJAL57VAEVdZTROIqCjPQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6916009)(316002)(82960400001)(4326008)(6496006)(508600001)(6486002)(8676002)(8936002)(2906002)(26005)(186003)(2616005)(36756003)(86362001)(5660300002)(66476007)(66556008)(66946007)(1076003)(38100700002)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmM5MFFwRythcEdadzhOdk01R0FPMzZmSm5lNFJkYU9SWjZsRUhUZkZsNTZt?=
 =?utf-8?B?OEszcVFKU3FNaEdERkhVc2d1NmNGUHNJektVV3hySXRVSnB2aE50bW1WMUxM?=
 =?utf-8?B?WG1tQ0VNZUw2MnNWWHVNVTgzWEpnK3lqYjVCbzNIeHlkWnNwbCs5MmN6cXBV?=
 =?utf-8?B?cGFDZmJPN3ZreWg0WGNhL3lISE0waWxlSHFoZ2NNVjhpNkx3NFQxdUFWWkVO?=
 =?utf-8?B?UE1xaWcwWFVlZTNvYTBuUkVNRUNkT1dsLzhBN2M0Ly9kRXMwTThnL01pODJJ?=
 =?utf-8?B?bVY3TU9pVUgvZGRCYXNWZVhuems4akhVNUlscDJlRHM4bm8yWXBvRjBzMkkz?=
 =?utf-8?B?azF2a0djR3NEVm9McVhyaWZGWXNvVTFOcVg4MlZyRlFTcEdCR0JyK3BBZTdW?=
 =?utf-8?B?Y1EvMHlONlZPamk4UFpuNUxMY25yMGxQZllsK0ttUHowOU5LaFBuUzBzRlQ1?=
 =?utf-8?B?YjQ2UFk3ZXErUW1iRjJ0aWlPWWYyZVB5ZWluTTJLS2F4Y1RodFZiUVU4bnpY?=
 =?utf-8?B?TDg0TXMwbEdDc2tmcUJOdTBxWFg1bDkvMEpudEZkQXhoQzZCcFdTMWN6bHFW?=
 =?utf-8?B?VG1rbmVjUTZSYzNuSGoxRDcxOVMvQzJlQmI5Yy9BMFhlclZreXZpZVkxZjlD?=
 =?utf-8?B?SHJQam9XaTBVUkJ2QXNweGVodkh1Y2Z4eEl2Z3BBcFRGQkxhQUlPemJuUVNS?=
 =?utf-8?B?YTVsTVI4TmtiVUNheS9WUG8wY0J0TVNhSjVBaGJFMXQycjdPZTBTRHRPd3VK?=
 =?utf-8?B?ZXBUSTdjUVNkQlVBUlhTYXpNY1RrVkJnK0d2YmI3ejZvNGZEVi9SNHAzVVhp?=
 =?utf-8?B?SnFzTVJYMURrWisyTGxSKzlnL2EzNzZHbm10WmVydTVwODNnVnBZZDUyL3RZ?=
 =?utf-8?B?c1g4aU1FOFVZRkR6OG1sMHhvSDBnbmFkSDJ3TmRrWDdnZG94bzZLa2dtaXBG?=
 =?utf-8?B?Tm5pdW9mUUpNS0lQNFY4blhnRjh2K3lVZ1ArVno3YmNnL0RFdXhCL2hEVTlO?=
 =?utf-8?B?TUJXaVpXYlVRbFpTSkZFeUVLa2JLb3JNdkMzMlJXeGR3Y1E4OEpBR0loVUpk?=
 =?utf-8?B?Uy9PY3dHUnJpdGE3UnVxN1JuUUg0WWNLdXhabU96Q01KSk5HL3EzaXNkc05U?=
 =?utf-8?B?aXNxSkxqQnZZQlpsYTNVSG96RSs2V2FnQy96WHc4TVRDZ3dKSktRVTd2UHFo?=
 =?utf-8?B?WmFITkxxTXBiY2U0LzNta29wdWJTUzFWbGx2dVFSRmswYnZPejh6RGZHUWlY?=
 =?utf-8?B?S2IvZ3FpamwxUXhVa2E5LzRONTRXSUNZb2RBK2p3RXZrNkdmTW1Ga1FtTFdG?=
 =?utf-8?B?c2NORURQdUlRN2E0V1dXM2o0Y3hNMTliaWlVLzFPVm5neXVpNmVWS3ZxY1N6?=
 =?utf-8?B?UWFITTN5T2JzSUpRL3VkVG1sRmZCNHhWQ1lSaStiL01ZNy9lY1hrR3Z6RXRV?=
 =?utf-8?B?SnJVQVRQNUJQa0w1dS9jMW1PdGpkeTJYYWVDdk5sUmJBUWpkRUd4Qmw2TkhE?=
 =?utf-8?B?c1RlWkdueGk1ejAwcWJzRkhYOGNKc2xlTUFSVWE4YktqTk1WbDd0TWg0dGJk?=
 =?utf-8?B?N09sTVFyQW9LRDdIRis1MnNyejRnU1FWZmpYS1VvL0ZuZEh4ZGYvMGZWbDVI?=
 =?utf-8?B?WnBNeTZmejJVeFlDT0J4dGg3V2h4VEtxNHRvdFFwTmJnWDFpOEVVN3N6M3hD?=
 =?utf-8?B?cSthM3BmSU9iRHZvZTZiS3NYQ1RtTXZzelhPZDRMMUVLZDZUNTBEWGJWTXdj?=
 =?utf-8?B?SG9pYngweEZvWlJqMWFxTGMzSDg2bUZrTzZ3bjJhc3pzSDBLY0ZmZHhzbUNs?=
 =?utf-8?B?YlRreVFEWUQvYTZtYUZwb1J4NEtNblhrMXpiSlpXZEhZbG1Bckp6YWJFS1dC?=
 =?utf-8?B?WTMxZWVzWkFGZUh1MTdiQWptOHdVcnBEMnhQZit0SGZHNlU2SjM2Mk5VWlJs?=
 =?utf-8?B?OUpIbzJ5MFk4czZtakpnQURpb1RkcUtpTCtIQnljVUpmWkYwaUIzVWxjbjhm?=
 =?utf-8?B?clNYSHdRdCtobzNibWZqRjZiQW1qbExGTStqWVVWRDU5TnpQdE5PbmtDSUNU?=
 =?utf-8?B?WitRZDFPakVQNUFtVG14emNLOHJEVXpWRjNYUVZDSjcyVGhLSHNGbDV3dGkv?=
 =?utf-8?B?TS9sRTBiZUFsRlZseWZjTDZDempPWnNORU5OSGF3UE12dlUvVW0veW94aWZk?=
 =?utf-8?Q?iHCYpN0tLymlv+DSfC9S2U4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d95b34-fb6e-4e99-b098-08d9a825d890
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:51:15.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7wd4LCoHQ49W5CqTKS07xkNFAwLEEUhWTaUSUxH59WnTeq1/pDkPimWElYlFcdogzWRksC1q/b/JOWukqFRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5066
X-OriginatorOrg: citrix.com

Set the grant table version for the created domains to use version 1,
as that's the used by the test cases. Without setting the grant
version the domains for the tests cannot be created.

Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

This patch only modifies a test, so it should be safe to commit as
it's not going to cause any changes to the hypervisor or the tools.
Worse that could happen is it makes the test even more broken, but
it's already unusable.
---
 tools/tests/resource/test-resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 988f96f7c1..658dd52aed 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -120,6 +120,7 @@ static void test_domain_configurations(void)
             .create = {
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = 1,
             },
         },
         {
@@ -128,6 +129,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = 1,
                 .arch = {
                     .emulation_flags = XEN_X86_EMU_LAPIC,
                 },
@@ -140,6 +142,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
+                .grant_opts = 1,
             },
         },
 #endif
-- 
2.33.0


