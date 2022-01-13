Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD448D8D6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257210.441911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n809E-0001EX-0H; Thu, 13 Jan 2022 13:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257210.441911; Thu, 13 Jan 2022 13:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n809D-0001Bz-SJ; Thu, 13 Jan 2022 13:28:11 +0000
Received: by outflank-mailman (input) for mailman id 257210;
 Thu, 13 Jan 2022 13:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n809B-0001Bt-UZ
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:28:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ca6cd1-7474-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 14:28:08 +0100 (CET)
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
X-Inumbo-ID: a4ca6cd1-7474-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642080488;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VE57v4bQkZV9Jau0iTZGZ5ACwzbr9Nx/TPfMRLyl2BU=;
  b=eOWsFlK1NUgB8TsafbK+0AvSvqWmt84oLuCFwvIvWADIsxVprJSxMoM7
   9R1RR0W0cAIlIgrE+CoLsa+vrVzb7jDvp3OGUyZQZPtd8OnaVRbt8bIO+
   1HjBvFz3te+r2uTjYEx0pCFp/JdW3WEJkUgdDyOR4m3OEsw9Cs3Thu/f9
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wpHwxOFac8K0LSiEBOOx7Afe6wQngGnT8OKlavs7vFueI/waP/m2JiGejdHkOLo5CRlMYMUQIg
 3H1T6VJkQ11CKKvZNa2A3DG65lz21uSY/DlgQGx9YG9GkiiyLh6t1ZhIhQYe1bsTDPE+962onO
 CcZvJlNpT5A8uoo8INxXvHdG3BNwGuMv3yM8IVR0v73tpN3WvBuXKV7I6MvuudxXbSUU0NVbWR
 sdtUM/w7dIHC3+coUD7nfMeFnr3s2D377NHSuWn1mQjCckio7u76Dn17pgUcW0ALJXS9LTs7TE
 CuhshV+I4ia+nH5/ZN+6PlFT
X-SBRS: 5.2
X-MesageID: 61836324
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GAqUTaqVyNxeNiWWmo0bpS7JGnpeBmLYYxIvgKrLsJaIsI4StFCzt
 garIBnVa//ZYGHzKI93YNi2/UhTsZbQyNEwTVRvqHpnESxHpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ+xUSQTErLVpMEUSkhzCCteHJEb1qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4XTa2AP
 JBFAdZpRE3KYhtjBlRNM6sVk+q1plfccTBE9mvA8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2Amlq0j/LLtTP2XsQVDrLQ3tdwnFCW8UkCBxQXWEWTrOGwjwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlza7Z4B2QAGQeeTdHZMY7r889RTEs1
 VihksvgAHpkt7j9YWiU9qqQ6yizPycVBWYYYGkPSg5ty9v+pIA+iDrfQ9AlF7S65vX8Hz3qm
 WjS9AAxgrwSiYgA0KDT1VLNji+op5PJZhUo/QiRVWWghitnY4qia52t+ELs5/9KJ4aETXGMp
 HEB3cOZ6YgmCpWAlzeERukXK624/PaOMDDagllHEoEo8nKm/HvLVZtL/Dh0KUNtM8AFUTzke
 knevUVW/pA7AZexRfYpOcTrUZ1slPW+U4S+PhzJUjZQSptwbCy90D53WWuZxjHGi0IMsJ1iF
 4jOJK5AEk0mIahgyTO3QcIU3rkq2j0yyAvveHzr8/i0+eHAPSDIEN/pJHPLN7lkt/3c/G055
 v4Cb5Pi9vlJbAHpjsA7G6Y3JEtCE3U0DIueRyd/Jr/aeVoO9I3M5pbsLVIdl25Nw/U9egTgp
 CjVtqpkJLzX3y2vxeKiMCELVV8XdcwjxU/XxAR1VbpS51AtYJy08IAUfIYtcL8s+YRLlKAoF
 aFcIJ3eXqQUEFwrHgjxi7Gn/OSOkzzx1Gqz09eNOmBjL/aMuSSUkjMbQucf3HZXVXfm3SfPi
 7ahyhnaUfI+q/dKV67rhAaU5wrp5xA1wbsqN2ORe4U7UBiyrOBCdnKg5tdqc5BkAUiSnVOyi
 lfJaSr0UMGQ+efZBvGT2/Ddx2poesMjdndn857ztufpZXKErzv6keetko+gJFjgaY89w437D
 c19xPDgKvwX2lFMtot3CbFwyqwiodDootdnIs5MRR0ntnynVeFtJGeox85KuvEfz7NVo1LuC
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjHAPJrVCL454k
 /wqv9Qb6lLjh0NyYMqGlC1d60+FMmcED/c8rpgfDYKy0lgrx1hObIbyECjz5J3TOdxAPlNze
 m2fhbbYhqQazU3HKiJhGX/I1OtbpJIPpBEVkwNSewXXwoLI36Zl0gdQ/DI7ShVu4i9Gi+8ja
 HJ2M0BVJLmV+2s6jsZ0QG3xSRpKAweU+xKtxgJRxnHZVUShSkfEMHY5ZbSW5Ekc/m9RImpb8
 bWfxDq3WDrmZpisjC47WEojoP3/V91hsAbFnZn/TciCGpA7Zxvjg7OvOjVU+0e2X5tpiR2Vv
 /Ru8cZxdbb/ZHwZrKAMAoWH0agdFUKfL2tYTPA9pK4EEAkwot1pNeRi/6xpRv5wGg==
IronPort-HdrOrdr: A9a23:4/AZiK6vYhfEoOLo0gPXwVKBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61836324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dcu8ta2Ja8OwCMzOwGQiBhL++JVgkcGmS9+fV9qPTzSzm5GwKbh/9xcg/g7d+GxnLpOuWcCyJ7wO98NuaYF+cJH5CIZQcJvIOis4ilyS4AM1yoTovbV5oY4kL8MsQVIQUIOu16LwH4FPV7x1Qjne1NwzCZdzYNznW+4syf4g8Pm/F5t/7Tb6Zawgdm7j94e6Lfjo0qVMkIB3Z8dM1y+jyFQ1mGuC2qX7zh3SdE/lwc4aXCYDahnAjkSiEAXY4pgFQ6NKf/ycw/5JCtYG5wiHp9wpdxxLiANdZ80ApaW/04OnHxcN2pyVgSakXeuhVD3xhY7Jpq7572EZPJN5CuYPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr/t8T37Q00mcnVjaTYmfTJGntljtj+YTbwrqPBDY+g=;
 b=QGZdDair/CJH9//E5O7BR6mzqpKq+aKN3k8bAKWgJIxrCnE1AG1c3Svwto8lmqFv34XjP+Ms/5ij/yg//2T/9N/1MFM+t2yAQmw46yUETfdWPSsSLaR1bXEs6rYzEsT8xK5355icnTGGLyVlBEY+Iy9pAQqAAao+0xBMzXdaeTrTrUt38OlxQ2SmEDaLVJl/LIiNCJCEtsDlljn2HPgUb6mkC8XxP570v45WtV8vy3LMO9bQP+zB4iKmJi0TV09R8oo/kXivCmbUPn9S1ZmZFCwFiz7Sxk+yhLLkr+J4fVumDEzLHlCPL7vkcS4GmlOi72q9sVrRptlBHhglD0lHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr/t8T37Q00mcnVjaTYmfTJGntljtj+YTbwrqPBDY+g=;
 b=NzRFgy8oDRX/pqO7ag9MILT3PcVfB55iieXHV/99HPyRuW99EV5rJGQjj02dP/wR6e8rprxLgBpWfGGJhHpA7j+6y19AruzvLk6pLkxJ5dnTfTX4+FIzPl/n5WN/54HSrBDMP4Vfd24155Heq6veEKpYLicwdfM1UXHiR/m1JK4=
Date: Thu, 13 Jan 2022 14:27:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Message-ID: <YeAo1sNve2iaJuzb@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-15-andr2000@gmail.com>
 <892d6148-e98f-def2-121b-922f1215a442@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <892d6148-e98f-def2-121b-922f1215a442@suse.com>
X-ClientProxiedBy: MR1P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313ae0f9-68ec-4b09-2b6e-08d9d69882bd
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB5179FA64063E507677DBBED28F539@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmnHVdBXQ6Xg7GuObEkSnrp5pQ8+1iqjrfcBJk9PsvZX6lQlyygdzKr6Mbvygf+3gP7g+ZGhxS3bJ5uIHaBhKcA6vBv0cKTlVBcnjFC45oCLgIxVPtE0HNuUyDHv4SGvK2N8wolFL47oVsCj3vdHEv4IXPZzsnim5L93u2tA97P6kr0J/AlfFADWIqbikKsOWfzrARuRbsdBGQI6qHax6yHZAUtS9egTBC0uV0Zn34lzFq05+z4nch3swGhJtEav5Y6V61oYmpSnr11HHzV15/z2xZ/aKBjK80QE7Q2l64ySmMsUDV95UUerEd3luLqCdS5IzXCvFs0CwayY6NQl6yVFF3LfD3xKyK4rq3li+FZdes5kKAr9vBai58Fzvgjxmotipta7zPcfMalKXbXfk8O6CFJksxpURLdv328uUaDYA6stfAO6laZmzcS9YuWbqUVYgOzRWKXmh8eWAQJGEBbM691dnRMWk85b24wEH+n8an6a/OtgkOd3nta/CEKxmrfFvg4AE2N+cG5xOPgjxh3hMiQPD2jKeYPGwBo+Ui2i1JojN7XwhYgmJbHzTjYvN6hVNJ3wFqmlocnSAhiuKeRod/jvmJJ9GCOHskshRbROMkMLxow+piKv0uYFBgxwgejc0izrmpop4dep5uK/Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6506007)(66946007)(86362001)(316002)(66476007)(53546011)(66556008)(85182001)(7416002)(26005)(33716001)(6916009)(82960400001)(83380400001)(2906002)(8936002)(4326008)(508600001)(6486002)(186003)(8676002)(6666004)(9686003)(54906003)(6512007)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lYSTdjTGpmL3FJdE80aGROUC9LNHhkUSsxaVhCcXFvbzFYS0hMVnFkUzAz?=
 =?utf-8?B?bVcrNHdNYzd5ejRxd3lRbWhmS3ZZdk1pTTdwNVU4enlrbFgwTnYvL0ZsdFlu?=
 =?utf-8?B?ZExMUnNBbmhwMzZ2Qlp1SGl4dGRZak1NcEZUWFA1L21saGdWSnE0UDRLcEFB?=
 =?utf-8?B?SG1jdHZ3VU4wdW5LY2NlN2xKdVRwQzN0L2tQdHo0MHhjc00yQVNXdDZkZDNH?=
 =?utf-8?B?UVJVVitUZWVnWU5jenpMVm16YklzY2dzYk1NbENlUUtWVE5LNXJ2ZkNuWnVU?=
 =?utf-8?B?RG0raThlZmw1OVpkQ1djNkdneUltY1ZRRXFBMEVIbXQrSTNhbWdDNnBJcXZl?=
 =?utf-8?B?YXBNNEhwN2FLekRLLzVIcVV1c3BlZjZtVEdianl2S2hFSmk0NEZzWDN4dE5P?=
 =?utf-8?B?ZWtOR01mQWROWHI1VklLV0ZlbWlHeHYvSXVhK0ZaR2UzcUxzMFdJQjNTNW15?=
 =?utf-8?B?bi9UWFFkanJpVmd4S2Q5ZldnTWUvblROQjljWEdQbFFBWTNocFp5eGVUN010?=
 =?utf-8?B?NjZHRkExZDZIdXk5dHY5eEJGNDhJdit1T1dodVFVN0txU1dCaUE2RC83b0VR?=
 =?utf-8?B?b0s4UzkrOXYzcW1EQVA0ZjZWRWttMkpzb3BlRjZ2UnJOczNtUlhBSUpoYzh6?=
 =?utf-8?B?Rm15N1VZcDJJdTZSMmt5aEhnTnExcUlIWlJKTEpBaUtzS2YzQjhkR29NbTdu?=
 =?utf-8?B?dmliTFBySkdXcW44Q1I5WVNHVnFrcFJkY0JMUmN1S0FRMmJCaXB4TStlTEV3?=
 =?utf-8?B?RnQxNFFaSG40RDllOUVDajFhcUJ3TDRsQ3JUSVEwOFNFSEdiZXZuWkNOcHdl?=
 =?utf-8?B?QUs0SWJ1Z0pMU3QzRG1URUdoSXZIOXUwN2pRNFpXbVU4djg4anJDa3VnV2h1?=
 =?utf-8?B?WnJhem9vV1YvQUVKTXlnWkxtN0dLdGx4QXZraHJ6Vng4TExXQit1cVRHNGNI?=
 =?utf-8?B?SGdwYWpPbTJOWHRGdGdMektYM0ZjV1hPVFJjVUYwa2I2eWtHdHJHb2hiK0ZL?=
 =?utf-8?B?QlJrbC8vWjlwQVQ0QXR5eFQyZHlOem9LZnZMNWVjNFFoRW96dGIwNjBPeUlo?=
 =?utf-8?B?RUR3Rjh0OE5GamtxVEdyNXJqanFwcnB5Ukh5eVlnQUswSitQOEVVMk0ya2Zm?=
 =?utf-8?B?VGtMcG93THRCT29RNVViWUNvUzQ4UzVlb1IvNW9FNVVjVERvN1oxbGdBTzNT?=
 =?utf-8?B?Ym5xY05xbWFqUVJQTmZZSUg3ZVI0ait4OFY2Vm1tTzdndFA3UWRwTjB4Ulgy?=
 =?utf-8?B?d0ZtUDFwbzJ1bThkcFZyTGhzVDAxMVZISTJWMy8zbCtkbnBWekp2aStMUWlP?=
 =?utf-8?B?WnlKQlEzMW4rTVozQlpXVGl0NDNYenJESG4xQ2ZZK0RtZm5ORDh5VkJwZjYw?=
 =?utf-8?B?dDkxTDRiZGI5WVd0M2YrRCsxVGVvbXR5VkNoOVVFWGlSY1ZlVXMyNk1aWHJD?=
 =?utf-8?B?TGsrN3B3SjNycStIbDJCL3F1eWwyS1VFbmNkcHl0anE3SUwyaTUyVW45NE5t?=
 =?utf-8?B?U1F4WHZHdXpWbmY3c1BaZmIyUDRsTUd1eURkUE5BZEVwRHVoaXV0eFNKOVE1?=
 =?utf-8?B?VWx5MlJtdlhpc1NkUEtxWXhxdkxsK3REeEdTTGRsWWRlUjBBcVpJM2oxbm9Z?=
 =?utf-8?B?NFZrTmpRYkhjVm9oRG92REFmcjhGcTAvWnNDUUdvek52bXJMSDJ6TkJEUzN4?=
 =?utf-8?B?MXVRSGd6YXpFVWZzWElMeDljS0RWMWkreHpVVEVwMDhvT0ZaNy9iOFpjK3NN?=
 =?utf-8?B?eElWbjJ6WnhpS1RCR0ovdnpCb2M2OFh1bGo5bmM0dld3dWdueFFacFdlSjFW?=
 =?utf-8?B?WFpvUTBkbTJ6anE1VUxuY3lWVDRyeSszWnlxOVhRTWJob29UK05qTmd6RCs5?=
 =?utf-8?B?a2JsNjl6V1ZmbktwZ2M0cHY3dDF6VjRwQWNRNm1YdlRwMEJVQW9mUW90VEFD?=
 =?utf-8?B?WXRGVHVaTzMrTlllMEJkeG14Z3NER1hXdVdNT3hab01vYjNkbFNJUENaamtY?=
 =?utf-8?B?QTIrbG1iNW1JeWk0ZjZBaTBoVDZ3anZDaHFNZ0EyMFBkZzlBOVpnZXF1d2tu?=
 =?utf-8?B?THYzTU5VWEpSMTgvZS9HbGtjUnFzbzUvL0ZDT1RDeGpjZ3duSjE2WUNpWHBx?=
 =?utf-8?B?Y050SW1BaEcxcWMvelNYMGtjMFpzVVdGcE9EVC9HU2FZR2NvVU54d0tDTXo0?=
 =?utf-8?Q?y2Xy5s00qPD8SpEcSxv0h4I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 313ae0f9-68ec-4b09-2b6e-08d9d69882bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:27:56.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09PCjTN6DXNskzVmzhp0R/UgwO43SEqUkUXi139Ovxqhew2GS+nSDuOwBjmX49gZ0hkN409GE8blabwm5vjRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 12:17:32PM +0100, Jan Beulich wrote:
> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > For unprivileged guests vpci_{read|write} need to be re-worked
> > to not passthrough accesses to the registers not explicitly handled
> > by the corresponding vPCI handlers: without fixing that passthrough
> > to guests is completely unsafe as Xen allows them full access to
> > the registers.
> > 
> > Xen needs to be sure that every register a guest accesses is not
> > going to cause the system to malfunction, so Xen needs to keep a
> > list of the registers it is safe for a guest to access.
> > 
> > For example, we should only expose the PCI capabilities that we know
> > are safe for a guest to use, i.e.: MSI and MSI-X initially.
> > The rest of the capabilities should be blocked from guest access,
> > unless we audit them and declare safe for a guest to access.
> > 
> > As a reference we might want to look at the approach currently used
> > by QEMU in order to do PCI passthrough. A very limited set of PCI
> > capabilities known to be safe for untrusted access are exposed to the
> > guest and registers need to be explicitly handled or else access is
> > rejected. Xen needs a fairly similar model in vPCI or else none of
> > this will be safe for unprivileged access.
> > 
> > Add the corresponding TODO comment to highlight there is a problem that
> > needs to be fixed.
> > 
> > Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Looks okay to me in principle, but imo needs to come earlier in the
> series, before things actually get exposed to DomU-s.

Are domUs really allowed to use this code? Maybe it's done in a
separate series, but has_vpci is hardcoded to false on Arm, and
X86_EMU_VPCI can only be set for the hardware domain on x86.

Roger.

