Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CE472A40
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245950.424251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwifD-0005Oy-Gz; Mon, 13 Dec 2021 10:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245950.424251; Mon, 13 Dec 2021 10:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwifD-0005N7-Cp; Mon, 13 Dec 2021 10:34:35 +0000
Received: by outflank-mailman (input) for mailman id 245950;
 Mon, 13 Dec 2021 10:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0LF=Q6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mwifB-0005N1-9a
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:34:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40c411da-5c00-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 11:34:31 +0100 (CET)
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
X-Inumbo-ID: 40c411da-5c00-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639391671;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OqxaqA2184dpRVjD2g/xcuznDETl3wDT9imEzlS8BGU=;
  b=XA/ERmxcW54Hcd+aZ6LtF7TUCU46+slkywVvr4JrjAGl/Et+uBI+Lv9G
   Ukdr0D972HhplGDLsotMTFA46uaAuy63rIshHLflANo1kw4aFLxLpUjyp
   RCncfq4fNffQ7qGBfBNBr9iFEojNOUYlkfhNDiYVx2fOCp91nvc4L1MqE
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JTLLZwU4gf0vg6/25RwIaHSvNVFv3M0q3ylJyAf2koJO/l5lHylTGPntU8FbA6uIVs86aN0c0p
 RzqENwYc6PtWnH4X5xVP0DDzSCs0NO8l0YWkA8T/PjRsVBmbNftyue2+5lzLpq8tTKWADUUq25
 ZdrxwzG+8RGwTIDhaU6y2iBFcNvZVsIc16vpAIDu+PQ4hC0UH0WA1VwED2NVAh/o1KpnC4+Tfk
 9mqPzzQ4zZTNizGEtjKUeZQbyz6Bk+RqcuLKEjBobS8LzEMnxCnm93zfUX9bOyFw1pMIsclYsH
 ldMsIsmGyTEEZiZRb4XXbp/z
X-SBRS: 5.1
X-MesageID: 60261815
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xaBb+qIN2t2hjWGMFE+RTJIlxSXFcZb7ZxGr2PjKsXjdYENShjUAn
 zRODT3QPvaLMzCmKIona46z8B5Q78fcnNNkGVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6wLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2qnfRp8
 soV5KfvQCgGJarvl+EibFpHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvYUGhWdp26iiG97OY
 NIfbhhRZy/8elpLH05PVp0/t/iB0yyXnzpw9wvO+PtfD3Lo5A5s1LngNvLFd9rMQt9a9m6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWS2W47GBAQTUG8o/Sylgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSQjy
 1uhj97vQzt1v9WopWm1r+nO62noYG5McDFENXRsoRY5D8fLg4MXlijQFodYT6eaocbyOj71/
 A/Js31r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5HGtLhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJGaBj
 Kz741o5CHpv0JyCN/AfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ3wPpkZ
 cfGLJb3VB727JiLKxLsGI8gPUIDnHhilQs/u7ilp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bKO3J+FkeLSmOEH/qNdLRXhTdCRTLc2n8qR/K7/YSiI7ST5JNhMk6e54E2CTt/8OzbmgE
 7DUchIw9WcTclWbc1jXMS46N+u0NXu9xFpiVRER0Z+T8yFLSa6k7bsFdotxer8i9ed5yuVzQ
 eVDcMKFasmjgByek9jERZWi/oFkajqxggeCY3isbDQlJsYyTA3V4N70OADo8XBWXCawsMI/p
 Zym1x/aHsVfF1gzUp6OZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/YCR16CJpoukCcVkGU9eEzWJ5Lq6L3CCrGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7sylPAw/driobNe3z9IJnSTYgT5EK5kL1mHwdJL6v9HyIhGtFbkQ
 UmI4NRbZ+mEYZu3DF4LKQM5Re2fzvVIyCLK5PE4LUimti96+L2LDRdbMxWW0XEPKbJ0NMUuw
 Ps7ud5Q4Au600J4PtGDhyFS1mKNMn1fDPl36sBEWNfm2lgx11VPQZ3AESunspiAZuJFPlQuP
 jLJ1rHJgK5Rxxaafnc+fZQXMTGxWXjaVMh28WI/
IronPort-HdrOrdr: A9a23:EEwFKq8WTeNutZ4lhTxuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; 
   d="scan'208";a="60261815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elIA1hsKJdTAQCkLNe0sJNVsgcHDfAHaTiLZ4WkQWj+x03GPlr2x5NZGCFL2lgjvruuBgAW0GTtfhktdXjNqNOxqit7Dnyhp4kavHyi00xLOI7X1DjRsKBI7aTHapcIPijcBzVaU53jgu/pAKGiuRWol9rNvTqPf7AJni8KLMiryJIYORvKcARAiBW4QnRAHtnnKv5wR4va93qO6wpOwoz2/DPqjlckFBjESfFhvdAC55NmohTnT4OWCWBEl4strpAOR9CN6CoVpQTgrfMzfDaT+vd8CGYsbMM9MQRM2xSTSnhEkIwaDkBzmaFuaeURFmMK5afLXJcb8WSRVYgQZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixro4LAtVI4mPqxdr09iV3FNukiLsVmxf+1HBr/u6/o=;
 b=Fk7dBc/xnn5GJSrX0qnIl8s8E4IZ6tCjY007+57/AYLAs9zvFJsNKlqxqEJOCJ5KRR5lm2xoEY1QBuSwsKRrrBXK8tW8SLC81OF5EZcHurBWA0aa3DuYAsWhERpegkjPJ473ISm3Z0csJdNTdM6y04mUFKSvkBuMrQejcJtOo9jagecqC+NZFFUsPDiRBMdvLV8zWiBnnnRX1a9KAuJzPWAOm2AX7DziJvcQwIyjDKorDp2rxGRq9oco8uM2obmI0HKesIif7QvXpVlakq4djrTzIgyYGI4MC2gZ9IV43YP60uPnDbTjW2piFPhx4G1bB+QyEKXoq/ktdrMvYCcf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixro4LAtVI4mPqxdr09iV3FNukiLsVmxf+1HBr/u6/o=;
 b=NjO7OLf/dsBpdwrQg5GjAOv2Asjg6iX5Tndyv4RrfV1ETx81lgMDmmGIyERzl0V7hVhiEK/OeCTCffHa+kGewr6JlYVQe8Y8RC1v1C1Y7MQ3yO3K7M+7tlqDRdWCV+8BTVq0lkZUMq/Tm9ynTtwZxGNSJLgMWaSzVGys6Jtc6MU=
Date: Mon, 13 Dec 2021 11:33:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Message-ID: <YbchcYGImB92onhR@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
 <YbNtBPv1M1lIyEOd@Air-de-Roger>
 <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
 <YbcWVRFFXerNqBPy@Air-de-Roger>
 <b766e6a4-3a28-7cd1-b35d-7bd36e80a552@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b766e6a4-3a28-7cd1-b35d-7bd36e80a552@suse.com>
X-ClientProxiedBy: MR1P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8bdddd9-bd39-41f1-4826-08d9be23ffb0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB5179B8C3F762A3AC3A6040538F749@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUMLGyDxYF2rQoQWgXIP/CGHO2XQ0SaTHAhhAnfLLlCC9BrCfogqK6pWRrYRAzhzbVpRZxWrAr3wUT/BslqAU0jhFELHCu89N5hrnkvS2Hl6g9r28AINNSjU6+9YW3RMh047A9McSrCwhEePuF7VO87T4c7aHwDizrK23E5I59x5MpZSBsGBlcfImH2ef77a993uFreZ7ReSDU7hSQqz649qXQm8bOzgflEbGvRd2NIv5dmOp8OaZxXOdDGuyQjDqEpt/FsSQ6W8zD9rvz0VxqMFbqMuxyc8z7shXzX6v8yM64QkjXfr/UOE/28gVH3YVHEfHo44c9nes+JMx1U1zplodi88MyzuzPHESRQZd4PEyA24pikH78vbX9IFo2Fx6uAQYpRuMhpR86o8CeFs9jTuAmn6ks1P8Uko/U7KN+kQZExugCY5VqapSBEue1RJrVWnJKtI/F5tGnSd8vn+JpYDQszAuFGw9M2OFHjg2kuQpc7x1btZWMf2NIsAotajBEXhhqVYrx2fgwnivtWR3V2xHRM1lfi3ktAQMeYqiOYrwrIWCSU2pRhI+qUyuHQWnLSJCilLR8d6uYgzlKIyLy4n/3zWrd7d1x8pUaTk0JBEaQuSClcBhOa9h+fZzX79jPx8H0cWeuXWDTapxqHsxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(66556008)(2906002)(53546011)(82960400001)(6506007)(8676002)(6916009)(8936002)(6666004)(66946007)(5660300002)(33716001)(86362001)(26005)(6486002)(38100700002)(186003)(85182001)(9686003)(4326008)(54906003)(83380400001)(508600001)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFU1OUlJZyt1OUJRaENYcSt3OXJqKyswbGdhQmdWOG1kN0tZbm9YbkwyUlY2?=
 =?utf-8?B?RnhBVkRQWlFKNkkxWjk2dmJxTVdlVDFpNEZqcndwbXkvNmxoSUZXUWlrZHQw?=
 =?utf-8?B?VG8rblFOb3E3bElyQ21VaE03WFNWaDR3blJZUk5JNTg5ODhaTG51eCtaNGhQ?=
 =?utf-8?B?K2UrYlBIaTBNaVkvc2psUU4rNzNvc0tTVGYrbk1IeWxEK3o1WWFMSU1CdUFy?=
 =?utf-8?B?UjA2RVAxVGVUQUUvTWxPZUlZMFRKQVRUSHJFamprK3N4cDZISmlQQ0tiZURG?=
 =?utf-8?B?enhUMHBNV1diUVcxeVgyL25lcmpMTzdwZURKWDlPc3J1dWlZTDlyOWV5SWJC?=
 =?utf-8?B?YlB3LzdtWnVTaTlHUFUxbTNNTEpoMXBjRzRKTFQwNlZuZXNYU0FTbzYxbEJw?=
 =?utf-8?B?VE90QlFIZHNSb3UwK0N0UU1aNXJYWjFZbUdGRHlPQmlYYkJVdVdLay9WeDB2?=
 =?utf-8?B?N0pLa3pLN3p6N0lwU2lTSngyVEI0QWxyYlUrZGxNWWNpempkNjdoZ1BsWXJL?=
 =?utf-8?B?SG93Wm1EWEh1ZVNuaVpSQ2VCSkgxT3dzMkNEQWwrTHJTSDlYbjRSSjlONXBi?=
 =?utf-8?B?VGJxR2dSYndqSUxISVg5akgzWjEzWnBZTmhtS2poRXJhY0ROSmc3d2w0Z0pX?=
 =?utf-8?B?YjdTMWlvQ0lZa3V3R1ZuQXg2dWRLam5Ta0cwN0xhU2FaM2lJREtyWmtBN0RQ?=
 =?utf-8?B?QUgvNXk2RzEwQndLV0pnQkhtMWxrZ2dHd3ZBbFZ6Qjd6a2pWQWtUTm1zZng0?=
 =?utf-8?B?OHZVaG94MkdISXNZNndsY1dsL3B5U3hZMmQzMlF2by9Fcjg3ZWtWZUwvZkxW?=
 =?utf-8?B?UXNSZUVqSUdJRjRGVlpqeVIzWERrZGt1eElXM0t3WThhOFgxWGEyTU9ZVjFJ?=
 =?utf-8?B?TEV4M2Nwb2pvTjV1bHJOQUlMbFZ4aHRPeFUweGQ1NHhYSUxQQlBIUXF6WVE5?=
 =?utf-8?B?VnBLZHhXV2JUYzNjZ2xtQkxRMTcwTUVzWUY0TlhYUFQ0S3dqeGtiTHJvMUY5?=
 =?utf-8?B?WG5INGhqRnV2bTkwSmo3WElManZMSEtoVDI0ODNaWEJzOHVxdE5VZ1dmWTBq?=
 =?utf-8?B?UUhYcUEvTnhlbHJ2RG04ZCtQeDV1TkVhQ24rWkxwTjE4K1Z5enl1MXRJT2F3?=
 =?utf-8?B?VVdsa1FDRDk0cGZQY2tTZ3FMRDdmZ1BxR1ArMmhsNDdSK0ZqZi9CMUVJOHJF?=
 =?utf-8?B?d00ydXVDMEVEYWRoS0RHbzVlY25NS1FBY1ZkbjJVYzdaK3E3REx3eVBsT1ZK?=
 =?utf-8?B?ZlU4T3g4ZC9LZmcvVHRhS0JZbkxqL3Z0V2FxNFRCbXhEV0pYUzJHYjdVYVZp?=
 =?utf-8?B?TVl1czkyb0FuMVQ4b3hUcmE4MHRVSmVOZE14RHczekRSNUQ1dVhSU1JBRlYr?=
 =?utf-8?B?U2J1ZDFNUmpTbmJENkRiV2cvRlZTamlwS0tEeGI5c1ZUWEs2YlRSNU13Wi81?=
 =?utf-8?B?NlZ0Rloyc2VBL2k2cWZzWlE5M0U3NGhZY0Q5Y1BwV09PYnA2ODVtNTcwN0NN?=
 =?utf-8?B?eDM2UFRrQndTa0haMDNEcU4zV1NLdkp4cU05MkZTVkRwQ1BKcWM1bVVWT3FC?=
 =?utf-8?B?Q1lpWHJ4cVZEdWRMV3VMWWdyL1RCSXFqa2xiNXV1cEJpNjVYSGVNNDkvRFlX?=
 =?utf-8?B?ZWpVWGU3SEEvT2V2Q0w2eXg1NzdFdGU3blZITVI3Umltbmx3MDI4K0JVOTdp?=
 =?utf-8?B?MXNBUndlVzMwcjliWnAvNXFhclorNUFGTnlHZWhHalhhR0h0Y3E3UXhqYzlT?=
 =?utf-8?B?UGFuR2tHdTFSNE96WDNjR0ZhZUlxbGZvcVZRVlNybU4rQ0NHVkRmS1BDa3dH?=
 =?utf-8?B?dkFuWDhSOU5FdVYzbHEvVWNqTVp0N29LTlNFUlZNYWhpakF6N1g4MUphZGQ3?=
 =?utf-8?B?MVNKQmUwZmVZdnMxWk5ORHRpWkdoaUQ5SHNIcm5GY29MOThHdXRNYllqeS9Q?=
 =?utf-8?B?R0NpaE9XbkpmUmR6U3ZGNU0rMUphMW5zeDRsV3VGQUJtOVZDWXdab2V1TENE?=
 =?utf-8?B?SS9MRGc2eHZVYk9QZVlBdzNmdC9Ec1lkWnpuTG5MTEhBY04razZqSkVTR2Ft?=
 =?utf-8?B?YWw4b1VqQlZLU0trT3gxZDZ1M0FNZXBPalg5QXR1NjJDak84YytvRWFuU2ha?=
 =?utf-8?B?eDVnMHBzQjNaeUU5WG1BNkFWMUV3dVhrK3NHZmtKREIwYzZKQVhscTRYdGsy?=
 =?utf-8?Q?7lqYzVKky/axUvO2UJN4Z00=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bdddd9-bd39-41f1-4826-08d9be23ffb0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:33:27.4204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QggbU5GjV3UYAFHQ+gRyLP87AYQR/lxS/0qGUQo6YLEPaL9UM+sUOFyhwnO94ys0Nsv8iwWZFd8ymPezSm1+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Mon, Dec 13, 2021 at 11:00:23AM +0100, Jan Beulich wrote:
> On 13.12.2021 10:45, Roger Pau Monné wrote:
> > On Mon, Dec 13, 2021 at 09:49:50AM +0100, Jan Beulich wrote:
> >> On 10.12.2021 16:06, Roger Pau Monné wrote:
> >>> On Fri, Sep 24, 2021 at 11:52:14AM +0200, Jan Beulich wrote:
> >>>> ---
> >>>> I'm not fully sure about allowing 512G mappings: The scheduling-for-
> >>>> freeing of intermediate page tables can take quite a while when
> >>>> replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
> >>>> there's no present code path via which 512G chunks of memory could be
> >>>> allocated (and hence mapped) anyway.
> >>>
> >>> I would limit to 1G, which is what we support for CPU page tables
> >>> also.
> >>
> >> I'm not sure I buy comparing with CPU side support when not sharing
> >> page tables. Not the least with PV in mind.
> > 
> > Hm, my thinking was that similar reasons that don't allow us to do
> > 512G mappings for the CPU side would also apply to IOMMU. Regardless
> > of that, given the current way in which replaced page table entries
> > are freed, I'm not sure it's fine to allow 512G mappings as the
> > freeing of the possible huge amount of 4K entries could allow guests
> > to hog a CPU for a long time.
> 
> This huge amount can occur only when replacing a hierarchy with
> sufficiently many 4k leaves by a single 512G page. Yet there's no
> way - afaics - that such an operation can be initiated right now.
> That's, as said in the remark, because there's no way to allocate
> a 512G chunk of memory in one go. When re-coalescing, the worst
> that can happen is one L1 table worth of 4k mappings, one L2
> table worth of 2M mappings, and one L3 table worth of 1G mappings.
> All other mappings already need to have been superpage ones at the
> time of the checking. Hence the total upper bound (for the
> enclosing map / unmap) is again primarily determined by there not
> being any way to establish 512G mappings.
> 
> Actually, thinking about it, there's one path where 512G mappings
> could be established, but that's Dom0-reachable only
> (XEN_DOMCTL_memory_mapping) and would assume gigantic BARs in a
> PCI device. Even if such a device existed, I think we're fine to
> assume that Dom0 won't establish such mappings to replace
> existing ones, but only ever put them in place when nothing was
> mapped in that range yet.
> 
> > It would be better if we could somehow account this in a per-vCPU way,
> > kind of similar to what we do with vPCI BAR mappings.
> 
> But recording them per-vCPU wouldn't make any difference to the
> number of pages that could accumulate in a single run. Maybe I'm
> missing something in what you're thinking about here ...

If Xen somehow did the free in guest vCPU context before resuming
guest execution then you could yield when events are pending and thus
allow other guests to run without hogging the pCPU, and the freeing
would be accounted to vCPU sched slice time.

Thanks, Roger.

