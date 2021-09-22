Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934434143A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192243.342625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxW9-0005iT-Ky; Wed, 22 Sep 2021 08:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192243.342625; Wed, 22 Sep 2021 08:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxW9-0005eR-Ck; Wed, 22 Sep 2021 08:22:13 +0000
Received: by outflank-mailman (input) for mailman id 192243;
 Wed, 22 Sep 2021 08:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxW8-0005Fo-2t
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:22:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ebd5d20-1b7e-11ec-b962-12813bfff9fa;
 Wed, 22 Sep 2021 08:22:10 +0000 (UTC)
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
X-Inumbo-ID: 2ebd5d20-1b7e-11ec-b962-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ElWsU4ziXSiPMiGxXcaqusDkCKlRzfSDrCEyvckfErY=;
  b=VbBpVbnNzs19xm7HwCZ/RyzaTscS+lBtQvUmqP78O8bwQsGMCTWU2pl/
   hwRiZ80g75jIWqubPa3cjrUIOQEr7D70JDHib6WapVyCy+IkOfdPt37rd
   0PhMGFBe+c9i4QZumJFgLDaO9FYgChHCFlMy7x47cKKO2kZ8YshxOwTnU
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uDlN0FMrWxkQnIxn6+J++S9bhU8sC2M7mS2WehoftiQEH0+rdN+CPOAHN6r4MNPV4IatFOWEcz
 wq3oBquWAwJsK6nyjDgVx7bazsmeTGc76BmUgH2wmnJh6l4Gq06nXbNsfz7wnF3AJ+63uX7B9P
 U8PVSVz9sq39D0iEL48o5DyJQCtXU1frn87g7LobXc1nex2yViQbsXOTDDe5mLABEaloRH3Ye2
 MxzjTX99QkLnvl+MxkvxlMjFMC3VrJI4KGCXIRUPPChsXbWpkpgOhl17JQFx89miCRgMwyer+F
 0H6mI3U+7UVgSGSjqL/Fbmxi
X-SBRS: 5.1
X-MesageID: 52894211
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q5+Xm6tv8luKKsDQIdxnSBZTQOfnVG5ZMUV32f8akzHdYApBsoF/q
 tZmKW7SP/3ZZzfyfookPovi/R9V75HUzt43HFE4qywwFywX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj5buV10xb5D1ots4Uz1bLT53AKF25+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25oeTKqEP
 pNxhTxHNkT7bwceJXMrBrkOvsyilmL5UhxdpwfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9QvkXKoCGbv+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtjiXTWorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhpdm3G2Z34YCsc0249pOXkyy7BCQlMjpXDcMbdjfp8+UPsalq0EmVF4Y9TPbs5jHmMWqvm
 GHR9UDSk51W1JRShvvhpTgrlhrx/sChc+Ij2unAsotJBCtCbYi5bsSD7VHB5J6sx67IEwHc4
 BDodyWYhd3i7K1hdgTWG43h/5nzvp5p1QEwZnY1RPEcG8yFoSLLQGypyGgWyL1V3iM4RNMUS
 BWL5VM5CGBv0IuCMvYsPtPZ5zUC5qn8D9X1Ps3pgi51SsEpLmevpXg2DWbJhjyFuBV8wMkXZ
 MbAGe7xXClyNEiS5GfvLwvr+eRwnX5WKKK6bc2T8ilLJpLENSbJFu9aYAXRBg37hYvdyDjoH
 x9kH5Li4z1UUfHkYzmR9ogWLFsQKmM8C4ywoMtSHtNv6CI/cI34I/OOk74nZaJ/mKFZyrXB8
 n2nAxcKw1vjn3zXbw6Nbyk7Or/oWJ9+q1M9PDAtYgn0iyRyP9734fdNbYYzcJkm6Pdnkax+Q
 c4adpjSGf9IUDnGpWgQNMGvsIx4eR23rguSJC75MiMndpttSlWRqN/pdwfi7gcUCS+zuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGo1605OcABLxnH1wC27
 QfODEdKv/TJrq807MLN2fKOobC2HrYsBUFdBWTas+q7bHGI4mq5zIZce++UZjSBBnjs8aCva
 OgJnfHxNPoLwARDv4ZmSus5yKs/453kpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCqotAJLGEGML5C1pAdgMqY9OK2ewQhjSPv+8+J1/35XMv8beKOamI08JgVMCJwGNJDb4Y
IronPort-HdrOrdr: A9a23:w50CJaBJtCr0lzPlHeg9sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MA/hHP9OkPQs1NKZMjUO11HYSr2KgbGSoQEIXheOjdK1tp
 0QApSWaueAdGSS5PySiGLTc6dCsam6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsLmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZQbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczPgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeo0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesWMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO61GkeKp
 gtMCjg3ocSTbvDBEqp+lWHgebcEEjbJy32AXTr4aeuon9rdHMQ9TpQ+CVQpAZHyHqRI6M0k9
 gsCZ4Y5o2mePVmG56VNN1xMvdfNVa9NC4kSFjiWWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="52894211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kT91xiZCymbi/a9eAObbML8TTh2rbWpJraf7GPxFkP7iRma1uLVMZm9WjovCipIeMRq5riIrDwo1f3fMSVtaU5VYgymtEE3YYlQAUJaktOOgsPJ8MZqImACm6tMkA6wBhr0ANZw/Ek67TGdR8hkIavRgmE+fEbvQY6rDj44vUWvLcKXHTpcvZacPlQyWniORf7oYU4VI+ukYJtKfsYNzzUR8gyMZRZhuAXYu8Koml9Bg53NpU2R0RUAAbdP82NE4cBtDVFKJ5+FPqkGtJ7zwm6EG05B+Hkg0A4StKB2ahNSxaA5bY2xs0BxQrpHqe1hu87u6EWVFtGi1knjmn6+Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JJ6k9ObCJZQ1HpQusAHVsZSz5HvaRNVf12lIJWSFRDo=;
 b=bpQsg8o/HPh+yIeApBcW+jvcIjrW9n6iOF3BLnWGBG7g1o/iI+C4uwdZBGzFT5mQldmHqU8bFbuZKP7jYMxV7iHYAYm7HWGF9OEThjKEn619rX2lRMviKvpDonKoPj89xt0W3KVwZuZL4uYhqefDAL8/aYMytNvM6ff9CKXmBAJZljzW/WOGNt35QZRibX/8+qlSKkJnbIITTEfKkpsp8JvCahLm+dOqDmTS8iCmnW8+lqZ61v5JZ1v8sugRVOANJll89DVZtSRWlkBeqyudPo7xHAHsZpTDxfyAOpNQiLbupbLbQ4wCISTnS+TukuRfDFd17whN4LwCwohd1qziCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ6k9ObCJZQ1HpQusAHVsZSz5HvaRNVf12lIJWSFRDo=;
 b=lQWMqYxbpJduJTmEUEOVfXegibdEMvJ5DoR9g3nqbGHbA5tTy+RbDT9URClKXR5vdGE9B/snE+paOPBucJyrqC/vqwb3IERAtWjzEvK3jp+gVf0GiOK/EAh167rzT6dv4D/bvWq9Xtt1WB99akO2YN3u74uUOt7kzwtcq73hrQQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v2 5/6] tools/xenstored: partially handle domains without a shared ring
Date: Wed, 22 Sep 2021 10:21:22 +0200
Message-ID: <20210922082123.54374-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f82e8c16-cf70-4f15-cb8d-08d97da2114f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4015529B4ECFEAD1C7476D838FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igH50E/luNphf9V4ruhaktmmNQDXPeRdax/TSCxF/Y1Rf3nkCjgohDXioeahUV6kvOgfSmx3cRvA1iYeV2ESeuSyz7P2iyvAzT9GYYnvgWTELX4qyQD+zUnKCGV6l4zhCipI6lCzMCEHbET8EgQAgRVtxyKbpFH1y1dTg8z6I4vjI8QzU3Lph0YpAwIgPy2rfiCL91rwffm2YzKOfrDmXBDne6CuRs81CxROG+cZ9an50IKP/svtfd0m4UjWkPn4v5FW2XYqgjanF1Odo7BxIX84a4m/EvlPQ3h+XZAKWnkr2CZjGc+6A/KefwE9n7Xb/QhNKuYfRGuuayKSA7j6aAFPWSi3t8cDVX5jpRGn7GrnxJCnhPXvq0f7YGpv09lq8JfW2ulNQSeFKPdmSMYm6YNRO1Vo6PMR2HHMk7Jkx2H2nj26KrwAFX6Y0NgdH8EwN08aOgfiaTDmxkIMMmrXXuPOm0r6tRd/8sALQnBHf2yjOJkSeax2c0JZtXePrJYlP4wKvkxIbzuK/9zwVxFPDoz+nLdJXohdDiQL42JMdAue7to6h5DLjRP/22RzbwX2KTbaDeWEYn7MZ3w68bfYddnFvu4AXtzb51qcyYd0792UiDi0H02W3QTLLhIVumAnaOBqSxUwlaCL/UwXEjocZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZJdUgyWVhxQ3g2ZVQzMElnNlM3V2VPaXF0YWdJbk1wQ0ZvTHJKSStoRXpl?=
 =?utf-8?B?ZlprR0JmbC85S25EaFBMSDZ3OWJjby9POEpXRzJkQkRxdDNIdFovMUg4cWt4?=
 =?utf-8?B?SVkyT21yZXREdmYwRG0zUjZjai9oOW5FVG9zZUczK0pWdnROK3YxSmc2N1Vj?=
 =?utf-8?B?M1hTV1kxZ2RiUW12QTNOditVUlZoQ0lOQU92OFNQTEI1WGNMUVFCWXhUU1ZT?=
 =?utf-8?B?UHF2eVowMFZEQTZSVTNISE1hbUNaTmZ2Y1QxYzRpcWdWd3hSUGlibWtZdmpk?=
 =?utf-8?B?ZVVrQlE4TlFib1Y4RjNnWFUxWlYyckZUdnVjNlZZODBCVmx3LzJ0VEJiZlFh?=
 =?utf-8?B?bGc5ekpPSXNiY3ZRL0h4cGhydUVZTi81VHFGOFNYcEhVOERhTkxxNS9zdWNY?=
 =?utf-8?B?ZkFSVVJCMkp4Ly9WM1NhYjFkRUUxUGphSVpKTk5HWVZCZ0l0YmhMeDZIY0pF?=
 =?utf-8?B?bkVVR21UMmNkK01ZT2Y1NVhwK1Z4RmhzYTJnTlo2MkNzUEpuM1JTaURXNXNU?=
 =?utf-8?B?T0l6cXE5Zkg0Mjl5Z3lnVTNEVVBwQ2x6OUlNRUlNOUU5ZUlmSEpRRjB3UjJQ?=
 =?utf-8?B?dm1GTkNqTjdYNmZnNnJ5ZkpCN2N6R2tCdnRmRTY0QytDdGxmQlhKU1E4ZjhS?=
 =?utf-8?B?cW1OWldQN2tjQ2w4Wm9hSVU1S0JWOFdMeDBYa0FRVDdTeUoycjVSTGZ5RVBF?=
 =?utf-8?B?V3BLUDdCeTM4dWpxbVFtQUg1MzV2L1pUeEU1VzFGbVdNT1lrQThYMERqWlEx?=
 =?utf-8?B?UlNmdjYvSFNkTWhvN0QreTFpYjlrZDMycEdrbFBnZXl6aFo0Q1hvMG1PWDA4?=
 =?utf-8?B?YVBzTHlwTjkrRXRDVWttcExSTFB3bmRoOWIzakxUd2hjMU4zNHFjSE54SEl4?=
 =?utf-8?B?Zk1STDg2QmFjS0ZSOG1wM2hkYzZKWVBHUXRsRGo0cGpaUEU0NXBrOWRsQm5P?=
 =?utf-8?B?TE1WNlVCUVVGS2xBSkRyUDBNSHpxY1gwdGJHRlZ1MGc1SHBEWHltVkVVd3Z4?=
 =?utf-8?B?d1N0aDlBWW1RblJ2OVZZQ3JtVVhBQ3FyU1BWUEphUXljSFM0d0ZpdHNJczA5?=
 =?utf-8?B?ZElOTmZYVjhhUVVybHVUMHdWdjBrL1pZUlVJYXBMME5rbSt6ejJRV0hjb1lH?=
 =?utf-8?B?UFJabHVQbUN1d2czRjVHZ0c1RWFFcWY1YkdwQUFGS2Y0bWlaazlveTFTd3Nj?=
 =?utf-8?B?N1NCdjZZL2wzOXhISmIwV2J3emlnN29yVzk5TUtma3l0Z3N5Qm1SaGJ2NDJF?=
 =?utf-8?B?ZEpoYjNMd3hrcXhtU3NUVVRIY25BK2xMMWozeGpQUG5rR2p4ODhCN0JnK0sx?=
 =?utf-8?B?bDdHeDRCb0NCK01Nc0MwMEJjMGxGNHVIQkplanZ5dUIzWHVVRWZ1L3lWb1Jp?=
 =?utf-8?B?YmhPMVlLVDA0VzlldENSQWdtY2xaNnpTOEhLaERrUlM3MXpPdWkxeGo2ZDVz?=
 =?utf-8?B?OVdrYkxOTFhwY3lkMU1lcE1UVUh1c01uWU5RdFJzc0xkVnJTTlhOSGxOMDZh?=
 =?utf-8?B?VXY0dEF4STgyNml6RFJhWjJwMW9tdnF3aXlWVU1pR2M3R3hOK0FBdU00Zktt?=
 =?utf-8?B?Y3EvcDIrNitUdDE2bFVCZEZTV1YzeDdjM2MrTjFtbkE5WmV5aUdOV2gxcVNL?=
 =?utf-8?B?L2U0YlBBMnJhUElPUmpVV0ZRVTFDaS8xL2pwUVRjNFJIWDc2b3pMU3NzbUh4?=
 =?utf-8?B?a25jblRidnVPSzVGdlI1OHBSSVp2WFpqczYxeDcrREtSdHNhOTNPZDkwVkxt?=
 =?utf-8?Q?flKobiLpyFgOZUcjOZ7YjvSHw4+iWmquSo94dNo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f82e8c16-cf70-4f15-cb8d-08d97da2114f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:22:08.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxwx+aTF73ovA/gYHZFT40uDNvvWyza1h+VCtGI90bpEYFFwJSO5V2eoOrp/lGK3/oaOBamNBIB/hA626cmPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Failure to map the shared ring and thus establish a xenstore
connection with a domain shouldn't prevent the "@introduceDomain"
watch from firing, likewise with "@releaseDomain".

In order to handle such events properly xenstored should keep track of
the domains even if the shared communication ring cannot be mapped.
This was partially the case due to the restore mode, which needs to
handle domains that have been destroyed between the save and restore
period. This patch extends on the previous limited support of
temporary adding a domain without a valid interface ring, and modifies
check_domains to keep domains without an interface on the list.

Handling domains without a valid shared ring is required in order to
support domain without a grant table, since the lack of grant table
will prevent the mapping of the xenstore ring grant reference.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
oxenstored will need a similar treatment once grant mapping is used
there. For the time being it still works correctly because it uses
foreign memory to map the shared ring, and that will work in the
absence of grant tables on the domain.
---
Changes since v1:
 - New in this version.
---
 tools/xenstore/xenstored_domain.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 9fb78d5772..150c6f082e 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
 	struct xenstore_domain_interface *intf = conn->domain->interface;
 	XENSTORE_RING_IDX cons, prod;
 
+	if (!intf) {
+		errno = ENODEV;
+		return -1;
+	}
+
 	/* Must read indexes once, and before anything else, and verified. */
 	cons = intf->rsp_cons;
 	prod = intf->rsp_prod;
@@ -149,6 +154,11 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
 	struct xenstore_domain_interface *intf = conn->domain->interface;
 	XENSTORE_RING_IDX cons, prod;
 
+	if (!intf) {
+		errno = ENODEV;
+		return -1;
+	}
+
 	/* Must read indexes once, and before anything else, and verified. */
 	cons = intf->req_cons;
 	prod = intf->req_prod;
@@ -176,6 +186,9 @@ static bool domain_can_write(struct connection *conn)
 {
 	struct xenstore_domain_interface *intf = conn->domain->interface;
 
+	if (!intf)
+		return false;
+
 	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
 }
 
@@ -183,7 +196,8 @@ static bool domain_can_read(struct connection *conn)
 {
 	struct xenstore_domain_interface *intf = conn->domain->interface;
 
-	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
+	if ((domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0) ||
+	    !intf)
 		return false;
 
 	return (intf->req_cons != intf->req_prod);
@@ -268,14 +282,7 @@ void check_domains(void)
 				domain->shutdown = true;
 				notify = 1;
 			}
-			/*
-			 * On Restore, we may have been unable to remap the
-			 * interface and the port. As we don't know whether
-			 * this was because of a dying domain, we need to
-			 * check if the interface and port are still valid.
-			 */
-			if (!dominfo.dying && domain->port &&
-			    domain->interface)
+			if (!dominfo.dying)
 				continue;
 		}
 		if (domain->conn) {
@@ -450,8 +457,6 @@ static struct domain *introduce_domain(const void *ctx,
 	if (!domain->introduced) {
 		interface = is_master_domain ? xenbus_map()
 					     : map_interface(domid);
-		if (!interface && !restore)
-			return NULL;
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (interface) {
@@ -505,7 +510,8 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	if (!domain)
 		return errno;
 
-	domain_conn_reset(domain);
+	if (domain->interface)
+		domain_conn_reset(domain);
 
 	send_ack(conn, XS_INTRODUCE);
 
-- 
2.33.0


