Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60954CC2F3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283537.482588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoSc-0000gQ-UK; Thu, 03 Mar 2022 16:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283537.482588; Thu, 03 Mar 2022 16:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoSc-0000dO-RB; Thu, 03 Mar 2022 16:37:50 +0000
Received: by outflank-mailman (input) for mailman id 283537;
 Thu, 03 Mar 2022 16:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x0rc=TO=citrix.com=prvs=0543a3016=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nPoSb-0000dI-CW
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:37:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4174ee2d-9b10-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:37:47 +0100 (CET)
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
X-Inumbo-ID: 4174ee2d-9b10-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646325467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JrrrI241k8Wo7CKbJXvIeONuq03hVqv51NMo1BymAz4=;
  b=dl1gk6mb3R2qAL88HeFwnBzrwSpbqprOA+9r+uX4XHL50L8rEEjiAknQ
   txEE+DM73UZ/q5C1CerfVzoKOJGY7pzV7T7DaCY5X8PXqZpT5kjVX9Bep
   BCxbQ/nTK2K179K1djh9AvDMFlhyhRT+ArHWUiDJ3GdWsoTKHT96dEa1y
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64874675
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1CheXa0uVj9VPGVx4fbD5W9xkn2cJEfYwER7XKvMYLTBsI5bp2YAz
 zYdXW2BbKzfZWOheNkjbN/ioxlTsZOGmoNiGQU+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1xr529Dl80JJf2xrQwaBZmGgJRHpd/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHJNYUS/FRpyTjdBPAraZvCX7/L9ZlT2zJYasVmQ6qOO
 JZHNmcHgBLoSQcIalwpGawFx72Xr0mvQTZ58Fu0qv9ii4TU5FMoi+W8WDbPQfSASN9JhE+eq
 iTD9n7gHxABHNWFzHyO9XfErtHImST3SYcDDoqS//RhgECQ7mELARhQXly+ydG7l0j4XdtcI
 k4V/yMGrK4u+UjtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMw7Wz0sk
 EOIltXBBDpzvbnTQnWYnp+LqRuiNC5TKnUNDQcGRwYY59jooKkokwnCCN1kFcadjNLvHirr6
 yuXtyV4jLIW5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhit7eYqkaoqA+VXdq/FaI+6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+B2+yEPXqEnERVJcdx2g+ixXeAUqNq2WQrTKt2CfosdTjsa
 U7VnApe4p5PIXenBZNKj5KN59cClva5S4m8PhzARp8XO8UqKlfblM17TRPIhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLM5LDPBZ5qp9faTNii9zVCove+m05F
 P4FaqO3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaOPm+9/J90+wPkM/gstw
 p1bchUCoLYYrSeaQThml1g5MO+/NXqBhShT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKLU377SrTb3vNSGVuJPZIGl2WkuIIiyOyrUHi+ALs7pBgy
 1BhvyuGKac+q/NKV56HOKrylArq5RDwWotaBiP1HzWaQ221mKBCIC3tlP4nZcYKLBTI3DyB0
 AiKRxwfoIHwT0UdqrElWYjsQ1+VLtZD
IronPort-HdrOrdr: A9a23:hOnR2K9K8h/AjgWde95uk+F1db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M740uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pUVFb/l/1rwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMN4YDaxfzOGzGu/HQ0ckiPg==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="64874675"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWbOiKvGt5QnP1dmaIabT9F2+ILTJz9TgwZkpcPvuADZdXjlaHNtAICIbhG77QhxDFwzDVNO+teLM7Y0r/tV53oTOBEExMduH3q2WFSip76krOD882KJ3UW9foR2AH4jo3uc1BR0tIz2kieDHhmdrBvmG2TOg6/H38/Fn/kJ1l3oKQ0XzdPBLTrMScWbjqYLsKvyKPqPWIr/2LECiB1HYyvME/VlIqwMZAXjt202cn0U3YfhBF0x5gb4oWwP8EKy08Fi/11GsA5emiKIGeGQ/R2tOZFD29AwZ5uoTWjN8nGDuoCCojyKsymBL/U3Z3g12BK3A4aJSdcKBtKO8+SR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrrrI241k8Wo7CKbJXvIeONuq03hVqv51NMo1BymAz4=;
 b=O+hWio//x8UoVJ9z/zy+PXIMOY9xcA7rARAxFG+1Xk0L8bKaovcSuBe1K7PKaQ4fkbeg61UC8o5L2ywz4PVm/Ce3Tn3IYKUkJcvoNL7Az2b4XGXFCbvjMueMnXrzLHIZDd4D+jMArl8dISSXFGjWpSRTSX6kxSBkxplV2TQIrGKQlyER8yrq/RJdLUr+WuiAMS3L3Df+ei4g6YAJ/8bibGCTk83UB2s06f11kln/E5GHBA+MHSEp+c+yUVHj7uiVgTPdgnq9KegxqJyhORyDjW09DPL5p7zplILKLHqyCJrtIFflcEgjtbNsMtxlFZqK3wF+S09m+ljqs1Hm7cfacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrrrI241k8Wo7CKbJXvIeONuq03hVqv51NMo1BymAz4=;
 b=gfu8vhX+hJxGZwJMoUugPp/nRd3VWQGNb+6jv+kyVR5x7kVj80et4SxXUDSHXxz919O/HuKEb8g0qXmGSCWgKld0ybAbhVj5TWj34+Uk9+5fwRgBJFU5KId20IkPHIvgdLLOtvsmwraDKOMWcZv908pi8Xa+EAkU2DTGjAcjEw4=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYLkaMjdZBkrS3CkWZwGsOatNz36ytiXSAgABT+oA=
Date: Thu, 3 Mar 2022 16:37:43 +0000
Message-ID: <67296830-aa16-4231-69ba-f07d2b1a4b65@citrix.com>
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-2-jane.malalane@citrix.com>
 <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
In-Reply-To: <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea0eb93e-db34-4c1f-9d5a-08d9fd3423f5
x-ms-traffictypediagnostic: PH0PR03MB6429:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <PH0PR03MB6429517F0CEBF6C35755556A81049@PH0PR03MB6429.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sV+YFMA4HsTIKk2eMM/IkPCJ75Ik+SccyBB5lrJPpsmZVHzI/ZMocsiX8DiYf47PZJvDnWvBpXzhrNEdsH6CNX0ZWcHarjtD8PMarK51GJvgWRTNAAmq6Kra9AlkCiexOcmKO5J0xwNm4GJzuerFxoif4tVIKJQDZqKtHLj4QiQ0bHe0/v1FE7zNLAdFbTlUtYXMPmLLJqg7cBUnFw9u4X9tuQ2BdjGU533n2utNLjOsUT9v3SWxtWqSZsg4uDjaxojNqXdqtyF203UJLwJ6L3XVi5Dai30+EFmEgX1MxH4aYY5pk1n0bJFg9Vd5Hf+JruVNwEecbqqcI+U9lifqZwx68KMz8QhmWUaaSVi8njgNMfYwP+ATg/IpJhuT8gUch/EPqfDsmL3hvjbdcqivTGPlKM7fLVBwR84YZcktUgNeg21MyacYCzW5WOQSy6k7Qa6wVpFkByEOlNvs1yWWAP1C54NgWpWHlVzgNLj7IeE8uLhAy/lfNR8Ban4WxInow1aQT6uRHUTB6QUpad04VR5VexqSql42jjuYBQjqG2Un8Ies1kT6WaZzawVO5ABP4ZT10EAgRr4aa/pltZmyA48Ws4G1TmKP2IYpnozME+pEXMoa/g6tJm3JFllJutqe/2284om78k329XimyT/sackYoWLhApkV+9MAExkNAAtaYchQWUANFdsDCnVCveOrUHCnDMAtmH43n7Wqx3PKZ/5tKxPAw2NVMCo3dyo0cQRPQDu2uxMWvmEFoyu1rEqV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(83380400001)(36756003)(4326008)(8676002)(91956017)(76116006)(8936002)(6512007)(64756008)(66556008)(66946007)(53546011)(55236004)(31696002)(316002)(66446008)(2906002)(66476007)(186003)(6506007)(26005)(2616005)(6916009)(54906003)(86362001)(38100700002)(71200400001)(6486002)(508600001)(122000001)(82960400001)(7416002)(5660300002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFI0aW1mTG9mNDRXQy82V0daVTJwM1QyeWtmM0pYZnRPVzlzSXpMeFBmemNa?=
 =?utf-8?B?dFdKcnpkVGUwNzVXT1ZvMFZyZ2ptaG1BaHpBYUVMYldRUXRxWklWNVNwVGdW?=
 =?utf-8?B?Zkx0TXdKVUVxZEpUa2lOcHpWNDU0SEdXcFM5c0lNRHVsRlJMQlVva29XYnFX?=
 =?utf-8?B?SG8yR2tISVNUb0xkQ2ZVTFZ6QXFtZlF6LzJJYTZkeGhTYitJNlRjSCtWamF3?=
 =?utf-8?B?dU8rQm9kOHkrYk8vRkRhTlgvMWk1ZjI4UGJCdko5dXFTeHo2YVlGQkhVb0Zi?=
 =?utf-8?B?UDhoZENQTTBQY21rblhvbkhFTzRmV0JFdDUyZnJ0aUFhZlBvQXZzenJxSWhJ?=
 =?utf-8?B?Q3c3amdDOUpqMlU0V3hpbzNPR1JPbUYwN0pYQTg5TERBUXBMMUlodlpXUTBv?=
 =?utf-8?B?YU9UdFBoSVZRbWVEZkNHa3JCS0F2cm1KY2lvN0FXTTF4dnJ0RUVURDRzUmJW?=
 =?utf-8?B?ODJtbFJXcGRjU25tS0tPZ0NwTGNlQjJHNEYyS3ovTTNadTBiY05Id2tlekdE?=
 =?utf-8?B?ek16c0pMSlYvMGYwWUhrSGxNMmFTNi92YWFiQi9XdkZaSVZ1OFJqblQrZ1ow?=
 =?utf-8?B?RW1JQmVkTGJjUEFLb2ZGUUhpQ1NrVUFTakRQSTBWLzIyeEpYTDlvV05hVWx1?=
 =?utf-8?B?M0Q4MW5uQmVLZzBJc3kzZzdPeGc5SmhTeUJBWnZLUHZrOGhVNXc0Wk9neWhj?=
 =?utf-8?B?ckNYaXlpNVltTiszUVlFMFBvMEpyK1QyN2lOdmNNU28rUXVBclFQLzZ5V3gz?=
 =?utf-8?B?RDFqcFNmcVBvcDZrMlR1MlhRVjhIdlNwNDQwVitMSW9uQWJjK3NLSlczWjhu?=
 =?utf-8?B?S0NYWDZGd1hyRkE3Y1pMQ2F4S3hOSUVieDJiNnF4eE9FZ2Y0MHQzbmJaVjlL?=
 =?utf-8?B?TlFrUVJhN0pSaE9RY2RsK21TdWdJeVZSYmNYbUdlOEJSUkFlQWN4OGFvdEhS?=
 =?utf-8?B?M2N2VUZkK1Y1R3RocFRXb3NWdXI3RmpEVmpma3pXdlRCU005Z1k0Zm5jUzVV?=
 =?utf-8?B?RTVabVJ1ekphdXg0eGx1Y1NvMUhicms0ZnlRVXNvYTA1U1p0R1RxV1FYN0ts?=
 =?utf-8?B?S2VJL2pCUUdNK0FZZmNoT2pyVkVHQVBWSFlsZEVNUS90YTdDV0pkNFBBWlk5?=
 =?utf-8?B?eVo2WlJqY3ZHakRDNmJ6SVFMQkxqVkdEb255cFk0Yk9RMi9ZbHVXQzd0NGlo?=
 =?utf-8?B?YkxtaFl4RFJWS0JpZ2xjR3Y3RWRCTlp2Wk4wN3FtVXl6NkdtTEF5M3FreHd3?=
 =?utf-8?B?ZjcweWltV1dySXJsZmlVNm10SUJCUE1yQytCU0xJWjY0YW1BWDVJc1gzQTVj?=
 =?utf-8?B?OXdlVnplaVdybG9obmYzRnZtRGtWejFDOTg1REpkR0NVOXNFTm0zNmRJbngz?=
 =?utf-8?B?amhnbnpSNWNaclVObWhLV2h5Q3FBSC9BZmhHWThlQzVHbmZqZG5yNVk0cTFC?=
 =?utf-8?B?NldMWHR2eFZ1bGdQNVd4aHE0bFRNZU5JdG9yNWJYTHI3WmtGeEFMOFdJS0Ra?=
 =?utf-8?B?NmkvSWpFeFlVaC9ZamhpUjBicjliWXlCRnhjUVE3cWUzTHc0L2hKMG1RNUZ1?=
 =?utf-8?B?aHkzZUFqRSs4YnRORWNmR1JQcGdjYkw4M0MwTXFBblh0RDIvalZUUDVZQ09r?=
 =?utf-8?B?MTI3NFNId2tPUU1MMEc2dmFMMDJsQy9pOFJUZi84bWgyb2RNdWVyUGJCTU5m?=
 =?utf-8?B?OTM2TzlRNVlLdVZ2eDRnTjg4S0tNVnN0MEFlYkpoU3VaTWd4cE1KM24wYSs4?=
 =?utf-8?B?NDArOE9qT2tiLzVpMU5zMC9aV3pHL2NmVEtLWHpRQUU4S3NLdmlUckRteWpv?=
 =?utf-8?B?SVJtZVR3Tzl0eVo2a0J2eWRuUDNRU1FQN3ZUVWMwZDl4MzNWQS92d3JtSzBv?=
 =?utf-8?B?MCs3cnlxMDlBRUk1Y1ZKUDJXdFdmL3Z6RWdtcm5tWWFVMFh4U0pJU3pPMUs5?=
 =?utf-8?B?VjJVVkJKWThNUkN5dThPcXhoekhVQm10eUhnTFl0ZFJCMjBqYjBCWG1DaEQy?=
 =?utf-8?B?S1psT1Rxb1FFYkRONDB0b3B2RGpFQmpyU2JjVm04ZlpwSklVWnYyTzFVaFVQ?=
 =?utf-8?B?andvM2FYV0tOUktOWEFhb01ycWh3UWdnMjRVYUdLNERqS2ZYOWFETU1YS2h5?=
 =?utf-8?B?RGZVaHhhS2tnbElnU1B3NHJwOXFLZW54bUpzOWpjUWlDRERJek4rVEY3WnVu?=
 =?utf-8?B?eHRGNCszSXp2RlZLZFZydklOR1kvaVJBOGw1aDhzRHNyZU85ajVVNCtOZDRS?=
 =?utf-8?Q?FyloI7uY3AjiDDyGSYgxs6I5BZQLxpR9XV31fNIcvI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <890EAFE1E3BE754ABA12C001A22DBCEC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0eb93e-db34-4c1f-9d5a-08d9fd3423f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 16:37:43.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QMfyt/1eyudIzrGeAPecnP8YA+n1ht4RiLYj2vsGb0Wg2a4rIXLLDzg33KT2VgVO4ftxnph0cb+X/rDt4Sao9ZNy62c5X0Hc8EooZmyBk7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6429
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDAyLjAzLjIwMjIgMTY6MDAsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBBZGQgWEVOX1NZU0NUTF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeGFwaWMgYW5kDQo+
PiBYRU5fU1lTQ1RMX1BIWVNDQVBfQVJDSF9BU1NJU1RFRF94MmFwaWMgdG8gcmVwb3J0IGFjY2Vs
ZXJhdGVkIHhhcGljDQo+PiBhbmQgeDJhcGljLCBvbiB4ODYgaGFyZHdhcmUuDQo+PiBObyBzdWNo
IGZlYXR1cmVzIGFyZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4N
Cj4+IEZvciB0aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gtc3BlY2lmaWMgImNhcGFiaWxp
dGllcyIgcGFyYW1ldGVyDQo+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4+DQo+
PiBOb3RlIHRoYXQgdGhpcyBpbnRlcmZhY2UgaXMgaW50ZW5kZWQgdG8gYmUgY29tcGF0aWJsZSB3
aXRoIEFNRCBzbyB0aGF0DQo+PiBBVklDIHN1cHBvcnQgY2FuIGJlIGludHJvZHVjZWQgaW4gYSBm
dXR1cmUgcGF0Y2guIFVubGlrZSBJbnRlbCB0aGF0DQo+PiBoYXMgbXVsdGlwbGUgY29udHJvbHMg
Zm9yIEFQSUMgVmlydHVhbGl6YXRpb24sIEFNRCBoYXMgb25lIGdsb2JhbA0KPj4gJ0FWSUMgRW5h
YmxlJyBjb250cm9sIGJpdCwgc28gZmluZS1ncmFpbmluZyBvZiBBUElDIHZpcnR1YWxpemF0aW9u
DQo+PiBjb250cm9sIGNhbm5vdCBiZSBkb25lIG9uIGEgY29tbW9uIGludGVyZmFjZS4gVGhlcmVm
b3JlLCBmb3IgeEFQSUMgSFcNCj4+IGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgdG8g
YmUgcmVwb3J0ZWQsIEhXIG11c3Qgc3VwcG9ydA0KPj4gdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2Vz
IGFzIHdlbGwgYXMgYXBpY19yZWdfdmlydC4NCj4gDQo+IE9rYXksIGhlcmUgeW91IG5vdyBkZXNj
cmliZSBfd2hhdF8gaXMgYmVpbmcgaW1wbGVtZW50ZWQsIGJ1dCBJJ20NCj4gYWZyYWlkIGl0IHN0
aWxsIGxhY2tzIGp1c3RpZmljYXRpb24gKGJleW9uZCBtYWtpbmcgdGhpcyByZS11c2FibGUgZm9y
DQo+IEFWSUMsIHdoaWNoIGltbyBjYW4gb25seSBiZSBhIHNlY29uZGFyeSBnb2FsKS4gWW91IGFj
dHVhbGx5IHNheSAuLi4NCj4gDQo+PiBGb3IgeDJBUElDIEhXDQo+PiBhc3Npc3RlZCB2aXJ0dWFs
aXphdGlvbiByZXBvcnRpbmcsIHZpcnR1YWxpemVfeDJhcGljX21vZGUgbXVzdCBiZQ0KPj4gc3Vw
cG9ydGVkIGFsb25nc2lkZSBhcGljX3JlZ192aXJ0IGFuZCB2aXJ0dWFsX2ludHJfZGVsaXZlcnku
DQo+Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuZSBNYWxhbGFuZSA8amFuZS5tYWxhbGFuZUBj
aXRyaXguY29tPg0KPj4NCj4+IHY0Og0KPj4gICAqIEZhbGxiYWNrIHRvIHRoZSBvcmlnaW5hbCB2
Mi92MSBjb25kaXRpb25zIGZvciBzZXR0aW5nDQo+PiAgICAgYXNzaXN0ZWRfeGFwaWNfYXZhaWxh
YmxlIGFuZCBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlIHNvIHRoYXQgaW4NCj4+ICAgICB0aGUg
ZnV0dXJlIEFQSUMgdmlydHVhbGl6YXRpb24gY2FuIGJlIGV4cG9zZWQgb24gQU1EIGhhcmR3YXJl
DQo+PiAgICAgc2luY2UgZmluZS1ncmFpbmluZyBvZiAiQVZJQyIgaXMgbm90IHN1cHBvcnRlZCwg
aS5lLiwgQU1EIHNvbGVseQ0KPj4gICAgIHVzZXMgIkFWSUMgRW5hYmxlIi4gVGhpcyBhbHNvIG1l
YW5zIHRoYXQgc3lzY3RsIG1pbWljcyB3aGF0J3MNCj4+ICAgICBleHBvc2VkIGluIENQVUlELg0K
PiANCj4gLi4uIG1vcmUgaGVyZTogWW91IGNsYWltIHNpbWlsYXJpdHkgd2l0aCBDUFVJRC4gVGhh
dCdzIGEgcG9zc2libGUgcm91dGUsDQo+IGJ1dCB3ZSBuZWVkIHRvIGJlIGNsZWFyIHRoYXQgdGhl
c2UgQ1BVSUQgZmxhZ3MgYXJlIG9wdGltaXphdGlvbiBoaW50cw0KPiBmb3IgdGhlIGd1ZXN0IHRv
IHVzZSwgd2hpbGUgdGhlIG5ldyBjb250cm9sIGlzIGludGVuZGVkIHRvIGJlIGEgZnVuY3Rpb25h
bA0KPiBvbmUuIEhlbmNlIGl0J3Mgbm90IG9idmlvdXMgdGhhdCBDUFVJRCB3YW50cyBmb2xsb3dp
bmcsIGFuZCBub3QgaW5zdGVhZA0KPiB0aGUgY29uZGl0aW9uYWxzIHVzZWQgaW4gdm14X3ZsYXBp
Y19tc3JfY2hhbmdlZCgpIChvciB5ZXQgc29tZXRoaW5nIGVsc2UpLg0KPiANCj4gV2hhdCdzIHdv
cnNlIHRob3VnaDogV2hhdCB5b3Ugc2F5IGlzIHRydWUgZm9yIHgyQVBJQywgYnV0IG5vdCBmb3Ig
eEFQSUMuDQo+IFdoaWNoIGVmZmVjdGl2ZWx5IGlzIGluIGxpbmUgd2l0aCB2bXhfdmxhcGljX21z
cl9jaGFuZ2VkKCkgYW5kIENQVUlEDQo+IGhhbmRsaW5nIGFsc28gYWdyZWVpbmcgYXMgZmFyIGFz
IHgyQVBJQyBpcyBjb25jZXJuZWQsIGJ1dCBkaXNhZ3JlZWluZyBvbg0KPiB0aGUgeEFQSUMgc2lk
ZS4gSSBjYW4gb25seSBvbmNlIGFnYWluIHRyeSB0byBleHByZXNzIHRoYXQgaXQgbWF5IHdlbGwg
YmUNCj4gdGhhdCBwcmUtZXhpc3RpbmcgY29kZSB3YW50cyBhZGp1c3RpbmcgYmVmb3JlIGFjdHVh
bGx5IG1ha2luZyB0aGUgY2hhbmdlcw0KPiB5b3UncmUgYWZ0ZXIuDQoNCg0KSSd2ZSBiZWVuIHRo
aW5raW5nIGFib3V0IHRoaXMuIENvbnNpZGVyaW5nIHdoYXQgeW91IHNheSwgSSBwcm9wb3NlOg0K
DQotIGhhdmluZyBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlID0gY3B1X2hhc192bXhfdmlydHVh
bGl6ZV94MmFwaWNfbW9kZSANCiYmIChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8IGNwdV9o
YXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSkuIA0KVGhpcyB3b3VsZCBtZWFuIHRoYXQgb24g
SW50ZWwgQ1BVcyBoYXNfYXNzaXN0ZWRfeDJhcGljPT0xIHdvdWxkIHNpZ25pZnkgDQp0aGF0IHRo
ZXJlIGlzIGF0IGxlYXN0ICJzb21lIiBhc3Npc3RhbmNlKiwgd2hlcmVhcyBvbiBBTUQgaXQgd291
bGQgDQpzaWduaWZ5IHRoYXQgdGhlcmUgaXMgZnVsbCBhc3Npc3RhbmNlIChhc3Npc3RhbmNlIGhl
cmUgbWVhbmluZyBubyBWTS1leGl0cykuDQoqIGFwaWNfcmVnX3ZpcnQgcHJldmVudHMgVk0gZXhp
dHMgb24gZXhlY3V0aW9uIG9mIFJETVNSIGFuZCANCnZpcnR1YWxfaW50cl9kZWxpdmVyeSBwcmV2
ZW50cyBWTSBleGl0cyBvbiBleGVjdXRpb24gb2YgUkRNU1IsIGZyb20gd2hhdCANCkkndmUgZ2F0
aGVyZWQuDQotIGhhdmluZyBhc3Npc3RlZF94YXBpY19hdmFpbGFibGUgPSBjcHVfaGFzX3ZteF92
aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgDQomJiBjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IGJl
Y2F1c2UgYXBpY19yZWdfdmlydCBpcyBuZWNjZXNzYXJ5IGZvciANCiJhbnkiIGFzc2lzdGFuY2Uu
DQoNCi0gQ3VycmVudGx5LCB0aGUgY29kZSBvbmx5IHNldHMgU0VDT05EQVJZX0VYRUNfVklSVFVB
TElaRV9YMkFQSUNfTU9ERSBpZiANCiJzb21lIiBhc3Npc3RhbmNlIGlzIGd1YXJhbnRlZWQgYnV0
IHNldHMgDQpTRUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX0FQSUNfQUNDRVNTRVMgZXZlbiBpZiBu
byBhc3Npc3RhbmNlIGlzIA0KZ3VhcmFudGVlZC4gU28gdGhlIGFkanVzdG1lbnQgdG8gdGhlIHBy
ZS1leGlzdGluZyBjb2RlIHRoYXQgSSBwcm9wb3NlIGlzDQphZGRpbmcgY3B1X2hhc192bXhfYXBp
Y19yZWdfdmlydCB0byB0aGUgaW5pdGlhbCBjaGVjayBpbiANCnZteF92bGFwaWNfbXNyX2NoYW5n
ZWQoKToNCg0KICB2b2lkIHZteF92bGFwaWNfbXNyX2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpDQog
IHsNCiAgICAgIGludCB2aXJ0dWFsaXplX3gyYXBpY19tb2RlOw0KICAgICAgc3RydWN0IHZsYXBp
YyAqdmxhcGljID0gdmNwdV92bGFwaWModik7DQogICAgICB1bnNpZ25lZCBpbnQgbXNyOw0KDQog
ICAgICB2aXJ0dWFsaXplX3gyYXBpY19tb2RlID0gKChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0
IHx8DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF92aXJ0dWFs
X2ludHJfZGVsaXZlcnkpICYmDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9o
YXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUpOw0KDQogICAgICBpZiAoICFjcHVfaGFzX3Zt
eF92aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgJiYNCisgICAgICAgICAhY3B1X2hhc192bXhfYXBp
Y19yZWdfdmlydCAmJg0KICAgICAgICAgICAhdmlydHVhbGl6ZV94MmFwaWNfbW9kZSApDQogICAg
ICAgICAgcmV0dXJuOw0KDQoNCndoaWNoIHdvdWxkIHRoZW4gZXZlbnR1YWxseSBqdXN0IGJlIHdo
YXQgSSBjdXJyZW50bHkgaGF2ZToNCisgICAgaWYgKCAhaGFzX2Fzc2lzdGVkX3hhcGljKHYtPmRv
bWFpbikgJiYNCisgICAgICAgICAhaGFzX2Fzc2lzdGVkX3gyYXBpYyh2LT5kb21haW4pICkNCiAg
ICAgICAgICByZXR1cm47DQoNClNvLCBlc3NlbnRpYWxseSwgdGhlIG9ubHkgZGlmZmVyZW5jZSBm
cm9tIHY0IHdvdWxkIGJlIA0KYXNzaXN0ZWRfeDJhcGljX2F2YWlsYWJsZSA9IChjcHVfaGFzX3Zt
eF92aXJ0dWFsaXplX3gyYXBpY19tb2RlICYmDQoJICAJICAgICAgICAgICAgIChjcHVfaGFzX3Zt
eF9hcGljX3JlZ192aXJ0IHx8DQoJCQkgICAgICBjcHVfaGFzX3ZteF92aXJ0dWFsX2ludHJfZGVs
aXZlcnkpKTsJDQoNCnN5c2N0bCB3b3VsZCBub3cgY29pbmNpZGUgd2l0aCBDUFVJRCBmb3IgeEFQ
SUMgYnV0IG5vdCB4MkFQSUMgKGZvciBDUFVJRCANCnRoZSBjb25kaXRpb24gaXMgdGhlIEFORCBv
ZiBhbGwgZmVhdHVyZXMgdW5saWtlIHRoZSANCmFzc2lzdGVkX3gyYXBpY19hdmFpbGFibGUgcHJv
cG9zZWQpLiBJT1csIGl0IHdvdWxkIGZvbGxvdyB0aGUgDQpjb25kaXRpb25hbHMgdXNlZCBpbiB2
bXhfdmxhcGljX21zcl9jaGFuZ2VkKCksIGlmIHdlIHRha2UgdGhlIGNoYW5nZSB0byANCnZteF92
bGFwaWNfbXNyX2NoYW5nZWQoKSBhYm92ZS4NCg0KVGhhbmsgeW91LA0KDQpKYW5lLg==

