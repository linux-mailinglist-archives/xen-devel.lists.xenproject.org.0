Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BB413032
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191571.341653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbD1-0008K6-QD; Tue, 21 Sep 2021 08:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191571.341653; Tue, 21 Sep 2021 08:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbD1-0008Hc-NC; Tue, 21 Sep 2021 08:32:59 +0000
Received: by outflank-mailman (input) for mailman id 191571;
 Tue, 21 Sep 2021 08:32:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/tM=OL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSbD0-0008HW-FL
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:32:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06cd7690-4cb1-49fb-bee7-6ebe993dbe68;
 Tue, 21 Sep 2021 08:32:57 +0000 (UTC)
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
X-Inumbo-ID: 06cd7690-4cb1-49fb-bee7-6ebe993dbe68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632213176;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pKJ//icSM6kIxwhqySj9SS2NC5ckvqjD6UM0/dprF0I=;
  b=LKzc0CYUyYnIcfJFeO0YneM4o/PC+GsOaPZj/buF+OJ/QYenMRaaTGhY
   4CEdnybPyYGvg1A/MKlvcDZ38UKAupTSBuCpKz7h0qyAUwcbA+LMR4faI
   +LhBAhxDZ57NktEUW6w/AgPyV7nisAvcTuDvlbXuw0FbbW+V3Zhy7mDf2
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lbOyRzhIWoxEFJ33XLRwghfh2sZsDubz5uirx7tyQj9uG6kEXydFiPt0XzvaRx29YT4Z5iisCn
 e/s2uvs7z+D8Uk7jWWfXhkC80o0OvcOl227RgQtckZNCYiefAhdpYiIY2Q0R/vjktHgg8F4iMo
 FUdeEE/Obn11i7NoGXINNasi42zm7HeRayfiOJ1fuzkN5vnGO5UsH1HVshR2CKAz4W7rOBPROW
 yEGs40Lb5OMeleEJ+XfKJTzCDTuTuCkTeZrJIQwGj3Zju8o/VtaBrWcA4WTPnwvGW8g4yZksB0
 mRJHJ1SWoT/Qvfq99q+H1Hmq
X-SBRS: 5.1
X-MesageID: 53212629
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VGcNYatmoMmVIdepuNulQMYWF+fnVLhZMUV32f8akzHdYApBsoF/q
 tZmKTqAPfeKZmT3eYgnao+x9RkCvZTXyIA2S1A6q3szFStE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524HhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplqtuae1ovGr/1suEQbj5eMh1jArB+5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sURKyAP
 ZtxhTxHdCnYfxBfCFguOIM+nd7xhWGjLS9+pwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xB3cGZi5MbsQ8s807TiBs0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcbCiE3vt/HsrgZix/yadBCLLOKk+XqTGSYL
 y+xkMQuu1kCpZdVjPzrpgGW22jESovhFVFut16ONo6xxkYgPtf0OdbwgbTOxasYdO6kok+9U
 G/ociR0xNsHC42E3AeJSf8EdF1Cz6fYaGCA6bKD8p9IythMx5JBVdsLiN2dDB0wWirhRdMOS
 BWI0T69HLcJYBOXgVZfOupd8fjGKJQM8vy+DJjpgidmOMAtJGdrAgk3PRP4M5/RfLgEzvhkZ
 MbznTeEJncGE6V3pAdatM9EiuRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8Z0PKrHbfVo4RwnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTYETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:9duF8KE8c08H8Hc2pLqFeZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nI/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gtn8xT5cVzp/QtHNBA7dE6ML2K41z2MGHx2V2pUCHa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.85,310,1624334400"; 
   d="scan'208";a="53212629"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFDA0axfIaI7rTsasuPgc3kEVa39wN8wKXjiezigJhK2H4dhs/sjQqFhhQi6vUoJ4frlxERrNyWOTqBg7am3MGszQ/cx0MaGMMtOxemzQLMtmOIUentSMTpxtPKctB6CRrO0GjFvG6w1vNu3Wi9g9wfNqLXF+/r7t4uJ90U9QE2oLYIAj+YiR5w45rE1wtv+2Ci0aNT+zJw6eDTCNdwaKxi4zu7dE6WRnPxmGh7B9KnuOeFWjitlihTgaoKnEsczAV+j8PpEY7O6vbgeo1Y7C1ZU12VIB6bKRzdwJWx4QEdhuMHB8U9muNZBknZNW+v57rh+XhydHZ+QtBFj8wKfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aogi4k5fbzzn/66Kn/jw9xSo4g25SW0DWk2MbKqNI2s=;
 b=RlDKjSWE+7fN9XfK35mvDlI7fqOfq9paDLxUES+pzUD272zOp3jOtrcXUd9O/hcM/35dZNhDFZZ0KE/IVXX4VgQClwyVYDlARIfGwVfP6PA5XYk8CkBqjsNuWCqzo7KSXKi4yuuwbG7R336HK75uTidymmdUNXO7PQAK6dcrfSp0uQ0McpuGAHV9zVBuMTI8MH1aw58P6p9TnEvYioDfFkAnIpMOrDJloKtG2TrlhFqEF5y65fSyaRFlOPC+ChFExmifOpOGpLoxEyRiJtdXEny2HrUpR7ZffOx2oVbLQG1LxdupZUvHoUhbpBa63wxNstBYgR9gVLZd1EK5i96gZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aogi4k5fbzzn/66Kn/jw9xSo4g25SW0DWk2MbKqNI2s=;
 b=rdJNKXdXH8cQcCrJeISdXN/cHoV+mYfyFOt/qZRyroSF9aXlH/MEEWoKHDFfwYq9VOiAy8Buu7bZX1f25YaTEfW9KqpKyA6ZfxJ6pcc7+GsZBV35278osD0F8rHopHeG4L5W8VsBGc47kabS0hPBbPrefhaqvAnW4p7UsMj8EU8=
Date: Tue, 21 Sep 2021 10:32:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Message-ID: <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8722e957-8a02-4d70-6f9f-08d97cda63f7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB506676E0667D4B9BFF0BBEE38FA19@DM6PR03MB5066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+kT88xcWGfBLBx2ZDdUU+gNNuStOFZHlqq6H/56F0onmR/5KUloEuQEAG/UmpU3A8GGeYMKr0cXgLNNxMtbxEqiC5Z0n+bWo8XGYg4OfftpW4ZD7sU7ZW3PZegpcvg7l5202iv9QAYjWfJO/IetZGeOguu+kwX2/EGm4HMxidNAu4yn9ovw6kcunzsQIXR0HJIT3bDesGdHhzhgeGCFzH7iQvTG/HOVgw5lpxEPxpFIbZcQ20b4YaV9AOJR0Ei3p5ZGZHqvltiAZk1K7Q4357pD51hhsGpDyszn71lT0115c3H4cFi9q5Vcwbq68roKmZgu0q/kgkyoO6Folhic1wXCYNMZiMhcfY2tj4M/RwZcPsKznADReN2H4cdj5mEfsryg/+ASzsxbqnFDJcT39JdH29v3jm7Yhk6o4OMcMwbUa/vRbEWk+/bUIoiLb/d6XjrUKhNLa46f3KuJgkMh2MIFNah1s0PqXqZA+vXpWh2q/tODwQV+s/VxRAyiS8Hly4xeTqQojKUDzq+Gxy4NBiHSrOdA6Wyk+VoXg3BNVhMayUI+tzhPwLbQFENvsV6IfOtQy/UBnGSpDsGXAK7khfymAGWVVk+72CQ3n+q4Z1aArK5xZKVqQ9sV4tUpohPeLXiF4rk+CjAhWFTmmBGTmq6H0mHn5JPkMBdJpw8/jlq0rLfJQ8YEqwtdPvwtUOi/zb1aD6YU8utEz9OmXhRbaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(508600001)(316002)(8676002)(66946007)(4326008)(66476007)(83380400001)(26005)(86362001)(6496006)(6916009)(5660300002)(2906002)(38100700002)(9686003)(956004)(54906003)(85182001)(186003)(66556008)(6486002)(6666004)(53546011)(76704002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Q3QXRkUkFLY3dCbnV3b25IVWFXTENGcEg2blgrajU3RnNvZUNBTi9TL3Nj?=
 =?utf-8?B?RnNuK0g0VGtRdGoxYUk4Z1hJbXd4a21TSHFySU9lTjJra1hqL2d5T0xRRHAr?=
 =?utf-8?B?aHdLK3RxNGRkVDRQZFZoWmI3VFJsd0JqdkdMSTJRcXFDWmo2WTlXQnRPd3Bx?=
 =?utf-8?B?SHVtTzNzZjE0RGhCVE5kWTlWK0tjVGF2WVF6NlEvamZmK0JvbG5kbkp3bnhV?=
 =?utf-8?B?MjBERWhZSjVRaFpKMXdOcG5CQkNiczRCMVN5Ri8yQ01zM3I4V2pUenVxUGxi?=
 =?utf-8?B?WG1wRUVpb1IydkVFbytxWGFVcXdPYlJhWldJMTVkQnhIL2hjdlMyYzdDUjBW?=
 =?utf-8?B?T1dLRUtqWFZQZ3RXYUVHVnhrMFdiSmdwRklMWEVmVjdHMWJYNHpxUXM4bjRW?=
 =?utf-8?B?THhqcUkzamxKc2tFeUdRVlNIWlFxd2xKdDVNdExRY0E4UXBhSmhadTdZWVZ6?=
 =?utf-8?B?dVdLR2REUW9ySlA5bWdtc0RTVXJNalhkb3BycUIzdzhLTFM5RVJKaDNZZUNr?=
 =?utf-8?B?alFobXQrRkZsMFYrdkdxMTBYU29sT1VOaU1XUXVLYXJuMzBRN1g4NDVPNW1m?=
 =?utf-8?B?aFdEVkdMcy95MmhLMk5XNVlta0t4SFJ6bVROdDNsSCtUcW5yUUh0NTRnS1ZE?=
 =?utf-8?B?bTNTb0orSERZUVFvSGF6NGJsZDQ4SFM0Z1diK1JXTitiVlA3aUZ3SjVEdU5s?=
 =?utf-8?B?eEZTY0lES0VJMmRxQjN2ZDNTTTNvNkdrODJXd2E2Q1FOeFJ5Z3VKZEJKMTBQ?=
 =?utf-8?B?SXJ0MmNjN0NlQmJCSjBvWFFyU256cmh0U3lzNnBjTW1tUmRicCtTWHZ5eFdl?=
 =?utf-8?B?Z3ZSdVlPbDZGbnlMNkpsUjFyZ2QzbjZKdVQrZXR6SWhKM2VqTkY0OGNsZXgw?=
 =?utf-8?B?OW11U0lTNCtEbWdER2RyeldNOE0rOEdGNjJVNkh6cEZaY2Vqell5NkpWRDdm?=
 =?utf-8?B?blRFVUtDaGZkTG16WmNKMFU4T2lvQzQ2Z2ptUjJ2a2E5WmdLZmEyQXBOcGlk?=
 =?utf-8?B?WnJkUXJVQUEwZ3NjRjU2TW16RWRmQU9TTGdTZnRqRzJubHpiajBleTJGazJm?=
 =?utf-8?B?d0lPV0Q2Um1JdW5yZDlKL0NlZGtRR0E0d0RybEFORUtKRUZ3blh3UFk3d3dQ?=
 =?utf-8?B?WUs0UVZjVTlrMGxNRHZlZmNGd3RJWTRuc2EvSUNMTitWcjkyYzVPQnRZNkh0?=
 =?utf-8?B?MmlRV1ovMmFQUitDVDR4YTVCWWI3VmNCb0NuZzgyblFDK2xXeUk5U2JScGQx?=
 =?utf-8?B?RUVSL3lsTDFZb2FpRVIxL3Noek9aeDkxbUxUajN3UlZXR1hKM0dscE5WdlFk?=
 =?utf-8?B?UmtEd0JpYXA0dWlDczBmdjRTWmE0Wks2NDhudmxGWDdUUlByUUF4b2pkMXVH?=
 =?utf-8?B?UEVIZmgrdFNMeWtLNTM1VCtjQXlqMTIzR1VqckY2Ykt5eEtXVmlCSDhEejJF?=
 =?utf-8?B?c0Z0YjRFNVpWaDFUdnIrNUEwTDNhc0hrVDY5ZGtnWlZBRTUyYTZ4L1VMVUtY?=
 =?utf-8?B?OUlMV1JKTmNlcmFLMHM4MFFucVRnT1lVMkpvWk4yeDZpSzJNVTlVc2JEL0lh?=
 =?utf-8?B?NGFGYjBVbmEvTllSR0g4c3J2amtadHJWS3JpbmhiYWNDdkY1ZHFRRWRkVkVs?=
 =?utf-8?B?MFJteHlpa3ltTSthREhmUzhMVms0YzUvUXo3RGszaUcreXJSUWI5RmhWeG1p?=
 =?utf-8?B?eS9vU1VIRENXeXAzZmRkRTVZb25JOHNFdWlrQWdmZDcyKzFYcThjVHlnaHEv?=
 =?utf-8?Q?v3Xi5sYBdbCaozhhdds4fTQqv/uw/0gVhm9cY9s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8722e957-8a02-4d70-6f9f-08d97cda63f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 08:32:47.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhCNnP8q0fHiZRey8L4GXcLehbZ4ZYKTwv3yrmqD98NkugtCtiIxoPxhFcyZEP+GTjF1gHrZ8x9RK17nO7mWCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5066
X-OriginatorOrg: citrix.com

On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
> On 20.09.2021 12:20, Roger Pau Monné wrote:
> > On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
> >> --- a/xen/include/asm-arm/grant_table.h
> >> +++ b/xen/include/asm-arm/grant_table.h
> >> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> > 
> > I'm slightly confused by this checks, don't you need to check for
> > gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
> > guest_physmap_remove_page?
> 
> Why? It's ogfn which gets passed to the function. And it indeed is the
> prior GFN's mapping that we want to remove here.
> 
> > Or assuming that ogfn is not invalid can be used to imply a removal?
> 
> That implication can be (and on x86 is) used for the incoming argument,
> i.e. "gfn". I don't think "ogfn" can serve this purpose.

I guess I'm confused due to the ogfn checks done on the Arm side that
are not performed on x86. So on Arm you always need to explicitly
unhook the previous GFN before attempting to setup a new mapping,
while on x86 you only need to do this when it's a removal in order to
clear the entry?

So you are effectively only removing the call to
guest_physmap_remove_page in gnttab_map_frame for x86, because Arm
will still perform it in gnttab_set_frame_gfn.

This seems like a limitation of Arm's guest_physmap_add_entry.

Thanks, Roger.

