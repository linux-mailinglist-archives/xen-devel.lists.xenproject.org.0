Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDB43368A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213157.371289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcojE-0001iG-W8; Tue, 19 Oct 2021 13:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213157.371289; Tue, 19 Oct 2021 13:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcojE-0001f7-Sg; Tue, 19 Oct 2021 13:00:28 +0000
Received: by outflank-mailman (input) for mailman id 213157;
 Tue, 19 Oct 2021 13:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcojD-0001f1-Rv
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:00:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86f81dae-30dc-11ec-8312-12813bfff9fa;
 Tue, 19 Oct 2021 13:00:26 +0000 (UTC)
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
X-Inumbo-ID: 86f81dae-30dc-11ec-8312-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634648426;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pt/YAwVnGg9nRt8KV7ozFdxbkmih+uN67ZqO4JrMHts=;
  b=h242+H0iXIdl+MNlOuiYmMrpazRJ+Ax8vD5z90atIqYEA9mjF1z2GCa2
   d9W601n2tGBwtDDdHDRml+whGTrtfnh3mXy42l0D+10a9cOf/dBSklcgE
   JZMoU0ZMZFAVsPMyFBx1vQzdAqFWeSK0CNlK8/Q7CSWfV+dnGbu+Lfbzh
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3Uyc+53rYmFPmdg9srWRkJxaUv1r3ZPPbHlZzqdOoDCOD+wIwxXHfi/jxpIX1o+RxIVXigMDiT
 Kv6VvHc4Tdt27ofIAE6Mq77ouuVY1nu0jsFtMJDS6sVSDdtbuCXS9rcPuZnxyogLBE19YG4NuC
 YF6d1z/ujxm9INBXeOVtqy1gYjzt1BGQKOZQ3QMCkdCNILmAT+qs0yMBFiWVNW7JjUPV99M/QN
 yMfl2KDHA+X0ikvRdD/ZMA3m8VJ/Xy/IdtrUESA0oZFqbkcgVjPysK/qi1cs7oPD/xfuVAYB3k
 QjseJnvfOv5kb5NcB70fdZUQ
X-SBRS: 5.1
X-MesageID: 55533627
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1x+jSKyDvmXoWvsF7HN6t+fgwSrEfRIJ4+MujC+fZmUNrF6WrkUDy
 WVLXGuOb/aNN2D1fI0gPYy1oBxUuZ7Vn4UxSABl+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7do2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Nty
 dROpJi3cxx3L/P0s/UcaQVdHRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFgWxr2JoRdRrYT
 8cpMjpDdEyHWjZKZFo8Irtg2+SIqkCqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlqujOLSmSLwWKoJCaa1sPVthTWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGrrQz9U+6St7HREOp/kavrx8mR99eKrhvgO2S8Zb87wGcD2kCazdObt06qcM7LQAXO
 k+1c8DBXmM37uXEIZ6J3vLN92nqYHlKRYMXTXZcFVNt3jX1nG0kYvsjpP5YG6mpksa9Jzj0x
 z2bxMTVr+RO1ZBVv0lXEFauvt5NmnQrZlJqjuk0djj8hu+cWGJDT9b4gbQ8xa0YRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxRMV8p27zoyT9JNA4DNRCyKFBaJZsldjBO
 xe7hO+szMULYCvCgVFfMupd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs8FyEr
 YcPaZHUo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwJzI8kJ
 1mxBR1VzkTRn3rCJVnYY3xvcuq3D51+sWg6LWonOlPxgyovZoOm7aE+cZorfOZ4qLw/nKAsF
 /RVKd+dBvlvSyjc/2hPZ5fKs4E/Jg+gghiDPnT5bWFnLYJgXQHA5vTtYhDrqHsVFiOyuMZn+
 ++g2wrXTIAtXQNnCMqKOvujw0no5SoWmf5oXluOKd5WIR2+/I9vIi33r/k2P8BTdkmTmmrEj
 16bWE5Kq/PMrok59MjyqZqF94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrtmkfA+6t/oq+MIxwhoBiyWPVGiC7cmKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y7TRz+wQlxnT8e8xcRfz6yJA9baaVVlfYkuXgytHIbopaI4oz
 I/NYiLNB9BTXvbyDuu7sw==
IronPort-HdrOrdr: A9a23:WSX/Sa0nMMgccPHcFlzvnwqjBGIkLtp133Aq2lEZdPU0SKalfq
 GV7ZYmPHDP5Ar5NEtOpTniAtjifZq/z/9ICOAqVN/OYOCPggCVxepZjbcKrQePJ8SEzJ856U
 9hGZIOc+EZDzJB/LzHCN/TKadc/DGFmprY+ds31x1WPGVXgzkL1XYANu6ceHcGIzWvVfICZf
 yhDtMsnUvYRUgq
X-IronPort-AV: E=Sophos;i="5.87,163,1631592000"; 
   d="scan'208";a="55533627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CExH5B6C5JQIyT3IWVJRiP1JaFERt2YODdHXcu+L3a8trlMLRkZp/i0Zffw7/2eyI+vReEQuAnfw39q+NaC4dWBJr17i/Y3D1ScB/Oel7ZUx+GVgnGgj/NJsgBR0vGbwLbOReqy5lAHrEG9v7me+46Ffw1C3jo/dAPasXFwI/HCP4gFnqDD7STS0mCq2UHXIHCEBC/bGjEEWpIxL46hw7Ms8r04AtZBBli+lScTaH7884ICPgqxQFDwxEPc4+q6CDUh7RWScXnA1FLcakOdz3qpNhfHkexd59WWMUvCWv+6XkAHH/r+8zuiKguu16PwXvOugeW0OizQNSAIJtN0wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3X1oRj1GZ0yX3GnlWRb/uo3ksPXk7NCfOQI2i8YbCU=;
 b=dSioBWjvPyNZ8wnfGWVNt5SJy55D2CaFXvWvDhfsgEwFOzUcRhX6UsN2M7GetbbyDo0Z8G7NKRMkqX9AzGrHkjOnOVMuOutHO7qK8XXX6vEsNTLGB3EwahurYLvOZtn3ZiTXTIxPlorfN4lM+ixYMaT8PsyMJVfHe0uvs//jBKmz0QopOXRXnvRYcDIal76ZEgAkQFZuqHtrI24m+ZTcl9n38MHduzNxwJPpJIOtJvqHhqYQnpnq2TDrnp2kdSf3empSOJVx4hMkPCitAyJHJRnxburGYuSqoz0dbF7qLi42xrvmuTc4DDJfTru1oYEw5HMiL14vYIMfLY1XNTTbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3X1oRj1GZ0yX3GnlWRb/uo3ksPXk7NCfOQI2i8YbCU=;
 b=cV65Aj4FmDUThw4oVje6eTBIwDcxc0xXEYB+W92ZILYyOQZnXsDslDgB9NauCNPt6K2+e/YZ9K73rjEZl/STA92az0JNEeyKY5EDE6CUwzsrWCuOzrE9aMbhXprD+t4k899I458B+ibWULptNhN9l1k3GLQCTQB6LreL987bKC8=
Date: Tue, 19 Oct 2021 14:59:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <YW7BSjF3DD0jl74r@MacBook-Air-de-Roger.local>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
 <9e444a8b-58e9-ea37-0e22-474e430be5e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e444a8b-58e9-ea37-0e22-474e430be5e5@suse.com>
X-ClientProxiedBy: LO4P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a763be30-2ead-4fae-a70e-08d993005b20
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB33708E35BC1614154CF1F1218FBD9@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcKDBAkgbkDch7KLRELtlKTHHQhA0etsCk33fTS9z0kbVARVSabAGDo15Ci3/eNnhVVm1vcyxr3EFkp+3DBTO/3BlFXA5C4BCV+UgBsKy7rBKKjy87KcdtWKLofv33hSA3bARbD7jptfGgFWFnuN3OHbMUDYdXjDrjWP1KsW1i/PA2PEeJdKP91vK9tj0S8F7O+YJIvgv1JN7RFnrBcflAHKTe+4HYOitJW5dn6U6Rnpbzoa4t105ofICnK3EWSM1EipH6o+hP1t9pO30tZM1z36mHYkeqPoae/25Kp8S9rUdEtc0eJo9Dprf/EeX7bSwVJAk8KfEZkddFVVZFpfdd/lYI3zGRAe6HLr9YhVXACx/w0KRFJM1D9gLtBSZSwsDSB9op3fUgRP9Xc3PeQQXX/gUD1i8+asx4qF45pArgmcoSj7wllaj2zTlnPsNCv3gjStmPLK4n0GI6xbJFXeMPg9E2cN42TEORId+BKFUKNCXMkfY0Xjw9VHOyJcXU2VblGy7uiX+cne0QkyrgeDhCJIN+HxRyrbD08PKWlo3NRh0EPaGmTIk85Xaxo2EU4VbEdSKU5kk/vXq4HSTf5OWjmpw110SDbAXX+LOVtBXj613h+G2tmeCiPAHKdbomKG7zTLm46YSK03leJZ50KoMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(8676002)(956004)(107886003)(6486002)(2906002)(6496006)(53546011)(316002)(5660300002)(6666004)(26005)(86362001)(186003)(8936002)(4326008)(66476007)(66556008)(83380400001)(38100700002)(66946007)(54906003)(6916009)(85182001)(82960400001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRGclNKZUpPODNnWDEycUhnOHUvcUdtQkZ4OWZQS3N2dS9Lb3J6K0lsK1JC?=
 =?utf-8?B?eERBMDJqTy9iTGFXaERaMkQrUjlhZDB3NWFwc1BHZDMyNnJqdkFhTXhITXBB?=
 =?utf-8?B?TlJBckdjZUNoY2RQL1Y5STl1MVduZGlzQkZwZ1FHOVZtTWw1Nnh0V1RXdDA3?=
 =?utf-8?B?NW1UMXZnUmVWMy9UMHMyOW41ZmpPb0JPdG5BUWtKVTVoc0ZndnlReFVjUTB6?=
 =?utf-8?B?bGJIZldoMFJ1UjNrOVFvNlVmTE9mWklPN0pVTHJOa0oyZFR6dWJObG1BS3Zl?=
 =?utf-8?B?cEZuY0RZRUZ3ZnYyeGI0Rks3aXZkbGV0Y2xtTjU2dDFFRzdEVHNaMU9xYXhH?=
 =?utf-8?B?L1FvckNFV1p6a1dYa0xkZHhONkZDOHA2d3lqLzJJK2h2aHB5ZkVlMVJaMzF3?=
 =?utf-8?B?Ry9kQW5tMkhHTXJpaGdNVS9UY0JndWRVVXRndHJoL2dSWGNtdjhjaDFVNjFN?=
 =?utf-8?B?SmNDZjh0RmY3ajFCQ0tRRzRYNXd1a2ZFUnpwYUZpelh4cG5EU1VXcXlhWFc1?=
 =?utf-8?B?WGxZNmFmMGpYcUZNeCtQQ2tmYWJVNkZqL1FDU0tNeXpncHdvcHpZd2lnU0k2?=
 =?utf-8?B?dnFjR1VVOUkyUi81a3NEb2ZxMDU5VHlHdUZJNUFFOFh1cHZXc01nejFSZEdt?=
 =?utf-8?B?UGQ1SmRZeWJKOTJiSURMSUNWTHUwWlErS2xzZmVQdEFiYkdsUEdCR05NS1pB?=
 =?utf-8?B?S2VYNWExZmMxMFNOaTdJc1lMaUdzZ2VIc0lhajhBdllwYnUrRTArRFFJTUcr?=
 =?utf-8?B?Wnl2cDJ2VFhaM3BtbXFGU3hTbHdFQ3FyWmNuc3NpSHZUYitPQUpmY3FaWmtu?=
 =?utf-8?B?a0o3VlM2ZHV4dFl0N1lmSU5ic2l0N2xYdzh2SGJrVVVoZkZmMWlKSjVQS0N6?=
 =?utf-8?B?R2pNa3NGQkFuODl2ZldUSTdnd1g5dUtqRTNMUjJuaS9EU0lGM1ZIWFpXdVlu?=
 =?utf-8?B?TG5sem9lMW9RQWpLeFM0NW1WaHZ0KzBJbWFtVTBuMnAwZnZhTGI2RnphSU9p?=
 =?utf-8?B?cGc1SGhXVWVGb3dSSTNQYkNmWXh5aGowK2s1RFgrNHNoV2IxRkRIdG5xd1Nw?=
 =?utf-8?B?K1JSZy9OL1hwdGVFbW9vYUNlM2RvWnAvNDRVSEdqV0taemxEeUEvMUgzYjlz?=
 =?utf-8?B?TXVFQnV6eUpXVzZKRjNvWVhHMTN1RUhEVDE2eGxVZFJJbm5YUldCRUJoTnZo?=
 =?utf-8?B?eXJVZDA0TklDZkJWN1lRYkV1Mko3b1hwL1VzOE4vbWRtd1FWK2RwREdUbUFO?=
 =?utf-8?B?YTZDZk1ySVE5UUlIdnpUdUJLOEsrVm1PZHdBdGhRT1hITGdmendmaUNQak5T?=
 =?utf-8?B?b0wzNE1qOWtFYU0zaURLVkhuZmFzTWtCa01SZWVnNnRlam10Mm52TWJDMGtF?=
 =?utf-8?B?a1RsY1BnY1VGOHQxa3JPY0MvdGEraXlGYW5jeUFOUEZreFFWNXJyMkI0MDcr?=
 =?utf-8?B?bW5DQW5zbjJMNmpEVk1kaVJYUWgyM1FpZjAyNkEyZnoya01IMmhaaS83ZTl6?=
 =?utf-8?B?UjhyZHNBRmk4M29oOE9UZldIaWJqei9NRy9JMEo5ZlFqKzB6TTRpRWN5SCta?=
 =?utf-8?B?Nkd2VS8vNnVtMDlHd2VqUWJmR0Z2WTdyN2YyZVZUZE1RVUNvMTFqRzl2aTU3?=
 =?utf-8?B?MmFKM0NnTURrQTJZczNQWG41cDJvRFNHY2U3VkRSMjV2dGx3T3BpMGNqRGtF?=
 =?utf-8?B?aWRRc2tQQjZtSklGL0xTcmJjWjRTcGJKTnBVSzRYOGU4T1FMeDlGalBQV2tY?=
 =?utf-8?Q?OkL7cOPat9a92zImxZxjRKvn2ZL5ShpWa/zm7At?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a763be30-2ead-4fae-a70e-08d993005b20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:59:58.9488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1neQRh316U+AW25BOYoLq55pDIj0znJCh0HlvdlRgrWDINbZw+SaqjaQUTf0t2XJpq+7fq88cKulnKFGi9b0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 01:58:38PM +0200, Jan Beulich wrote:
> On 19.10.2021 12:41, Roger Pau Monné wrote:
> > On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
> >> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> >> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> >> order violation when the PoD lock is held around it. Hence such flushing
> >> needs to be deferred. Steal the approach from p2m_change_type_range().
> >>
> >> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> >> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
> > 
> > I'm slightly worried by this path because it doesn't seem to
> > acknowledge defer_nested_flush.
> 
> Oh, yes. Iirc I did look at that logic, write down the remark, and
> then forgot to add the conditional to ept_sync_domain_prepare().
> The interactions with the real (host) flush are kind of ugly there,
> though - we then further depend on the ->defer_flush / ->need_flush
> logic, which is EPT-only. But I think I've convinced myself that
> this ought to work out.
> 
> > Maybe the flag should be checked by
> > p2m_flush_nestedp2m instead of leaving it to the callers?
> 
> I'm not sure this would be a good idea, as there are more callers.

We should maybe add an ASSERT to p2m_flush_nestedp2m to make sure it's
not called with defer_nested_flush being set then, or else it's
possible for new callers of p2m_flush_nestedp2m to forget checking
defer_nested_flush.

Thanks, Roger.

