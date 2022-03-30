Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83114EC65E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 16:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296390.504481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZAo-0005pN-O2; Wed, 30 Mar 2022 14:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296390.504481; Wed, 30 Mar 2022 14:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZAo-0005nY-Kn; Wed, 30 Mar 2022 14:19:46 +0000
Received: by outflank-mailman (input) for mailman id 296390;
 Wed, 30 Mar 2022 14:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZZAm-0005nS-OE
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 14:19:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fae2994-b034-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 16:19:41 +0200 (CEST)
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
X-Inumbo-ID: 6fae2994-b034-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648649981;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dPZxfd7Ss88IJOBqLuP7tVQkkYiY16sb3M8aXCxsSWw=;
  b=G6REDqKCY71094SkEBlWuaijLyiOxFcF+maRkLFX99egiCwpqocG2RRH
   IsbTZzhyT6GCStK82MqBjOtWYvLw0xwmdMHF1DKwcR2e23sTEGo7EjPAX
   8umAHfrJM5sSGOgB0yfao2fltNwXYnAsgyhlD49LV+1AKgzTe9PKusSiI
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67549983
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zbJuK6liWBkRURxBQPyduJro5gy/JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWGmCP/aLZjakeotzO9y29E1U6pLUm4VmSAJt+S0zHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWFvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcQFuE7CTm+cnaTZSDzwgJK5d/ub3Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mDO
 5tIOWEHgBLoR0cfYmsGI54Fh72Khlz1XxZ+q2+tnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z1BRwQOdi3wD+M4HWqwOPC9Qv4X4QIHbH+6f9ug3WU3GUYDBBQXly+ydG7gEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1ql8PC5sGyxOhIvAmUeeHEdThADuuns9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4umsWyKBBaJtsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSMsUhLlbdpHs2OSZ8OlwBdmB2y8nT3
 r/BLK6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSHoOY7cAFRRVBmVM+eliCiXrPaSuaQMDp6UKG5LHJIU9ENopm5Yc+Vp
 ynkARUJkQCXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:0cxXz66/Q3v8MSvYXwPXwSSBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbq6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tps+CVQpAZDyHsHceg12w
 31CNUYqFhwdL5kUUtcPpZ3fSLlMB26ffrzWFjiU2gPUpt3fk7wlw==
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="67549983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2T2lFXR9xptOy6RVK88YfskQuXgUkHR/0jfIvDupWbgY4m9Ber8FD+4oGR9qTbymMTlTb3i3UVWqi8bghm0WNYgkQPBGBa+gEFiN2QvpQ/okJ/B2dGTf5Eu/5cA5egj2C9FyskmvuQ9u+XiL5IpxlXDI3gbS7DDwSq+MTiKoaFDRJN4hYNQjhviBts6lBJygInLZja1K4gqyNUZ8qjawM2wOmGlGyU8Gel0w6LCXB3YBa+KGZ2u4NlS22zzjm58NuvpxQPOuYp5xSR3rT1G+zLpjo0USXYHeGGRTZYq1+u59qrGDof5Mgu2hOh3LCiauHSNW69mWkPii+qaUG52wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vz7X0ovNdPoy6DasZte3c/fXEnJEYSs+oV9r1hVhM8=;
 b=EukQ7ROE18Y52lZK6HiLzA9b/6dlqzdipGb5c5TNEpUgn1GZpR0bqr701Z7nAykXxqTKsXefyqJ/T/qzwLU5A2DvoeiiZcMa22STOX3mvfcasb5cguWWuRD30GVTjebAnoowRnPbbPKxMpOoJER+uV8OQWtXBCLRFA0w1qkmV5eQqsteRRvjU8zoa0Z5OpXE7MaFK4058sdkZYs1zELAGlBeS0f9GT4DLprGQRBRG1ZIVWhK8xcMzpnCov3l4e8ya+p+mdzmc6ULXejkbwBvfhZwI8AB5XnTxyDtGiNGkXSWF0rSilkxUKbVoYIc4qr/5HZNBYEb+4e106LObxNwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vz7X0ovNdPoy6DasZte3c/fXEnJEYSs+oV9r1hVhM8=;
 b=tXWHX4AQdz36tKaNfeeoKaK7c4TLXE16/Ao3z1w70c3VifX2gW1GsS8opPpfl8ZhEIOrD77c7P4Ftwf66PBsTChemm2BEWA4LOTXYJwNcWqrg1u8HBVodX8tLnhn2cAq2dn0hMDp4fUQrFRRwlImMMLYHrtzy2KoePsIZP2pBgA=
Date: Wed, 30 Mar 2022 16:19:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Bjoern
 Doebel <doebel@amazon.de>
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkRm8oc0vQzRQ7VL@Air-de-Roger>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
X-ClientProxiedBy: LO4P123CA0425.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56f5af6b-2e3d-43de-0ba6-08da12585071
X-MS-TrafficTypeDiagnostic: BYAPR03MB4229:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4229DB41276F9E9ABAB3A3CF8F1F9@BYAPR03MB4229.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kE4/1PWbyE5xAnCIT4+lUuLq70H44xCy9RjTHem1VmWrNNl8r4kZb4Vr4/QMtTgYsgzTQDpX6+83AOhHqR9l1P761LPy5+W19anY30DzJa+ia7+NqKAp463itaMFMbXF9Ezn6dv8RbANhWZIQrJBBBlHSwkwk/9+amzEKPp660wkNgbgXPepe+ZjLuHOvMa6KMWsFo4hEjL9RoU5xJi8V2jKyzKtWGpCY2yb76tRyzMXe1zAhxs6ECEyOf+o6XbVtuHXmjVKWsU7W671Fpjb4YwJ6KmTgGIPEAuXeXoNh2EgK/yZLbMP/Mh5yUkBmVNnnk0/h0j0xndRy2IAILdtu/BBZYvOwJASXi6v24dGTBsicC/UnfIdt6K4CEh32AbIImRqCqYvBnGyKJVdlY9Oy06DMqWJiDvsRa6/BPM8Lons3UWFGh/DJEthmIDHZXQldb7g9FLCKG9u+tnfjQraRXMqL28DZjpg0n022zVc5NNAwbu5qXUiqEbP7jP82jD2bMjpf84Ploro7YCVL6wc6+Mumi+aeZl/dXdxaSiEmYVMxV3onszzT5yLR3SWMLxBM664MbPwuHcp0rIBMFkGsoJfwSLhFiSoeGn98eWJq5T1iS367PF5v5BCxX0Y2q54w7Y+MzxaN9wUysD9hnpzkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(26005)(8936002)(316002)(186003)(6512007)(2906002)(6916009)(5660300002)(82960400001)(86362001)(15650500001)(6506007)(6666004)(54906003)(508600001)(66946007)(9686003)(66556008)(38100700002)(4326008)(33716001)(8676002)(66476007)(85182001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZLRkxZVk9oakJVTmpWTDUxTDlienRTZWlibElyTWJzNExzSHluNFBObWpj?=
 =?utf-8?B?MVNLMHAwQlZmTk9IaUcvU1JmNWRvQzBSbWhLTTk0VVhySy9ON0V1UmorZk5r?=
 =?utf-8?B?NFVxSU1sdnlaUGtGMkQ3LzhSUkVuTFVJSEJqR2FHYW5jYk1VZzVBdVVnUGhv?=
 =?utf-8?B?Qm1QVmpyaFdFdXg0dTJVRFltMzNFbnFJUlRnM0xXdlpNam9aMWZDT1dBdVNl?=
 =?utf-8?B?ZUZvQnd6ajBIZmppbS9jOVk1ZmF1aGpTUit1NnFaN0cwOWFFcVZiVzE1WmJl?=
 =?utf-8?B?cUduL091ZDJUbHQ3WkQ2dUQva1lmQ2FJQUUyVW9iaWIrT21mOExZcVM1WU5E?=
 =?utf-8?B?ckhPVjZuZk00cnoxNm53cVpMd2REc0FDWExRQXJnZVhXMkdxNXlZdHNMaU5s?=
 =?utf-8?B?VFpoUFRKSm5TYVhVQ1oraU5kWWhkdUwzTkRUMjVFN09wdDB1L0syMWJQUFBM?=
 =?utf-8?B?MHpnVGJvNlhsb1dCMVgvc2dCS0NWcE9IMVJ1OHFyVU8wUDBTVDA2SUNrNTBm?=
 =?utf-8?B?b3hQbk12QUtMbmV2RDFVMVpGdFJoSElOL2xPWS9lbWp3c08xaXFUa01PZUF4?=
 =?utf-8?B?WlZpTnh6Vzgwc2lxaGpjZ0RYR2M1ZDZaWWxSSHk1Qncvc1dSZGRVNUl1UmI1?=
 =?utf-8?B?NDYzbUIrRkRxcmszVEI3d0VLYklEWnowTTdudWFnUEZDTk9zWVlCd2VURzlq?=
 =?utf-8?B?MmRXWjZpdUtnVUJjczNPcTN2bVBYVzRldlRBekhEc1NyN2k5VEljVjg5d3Ev?=
 =?utf-8?B?WEdZRmgyTU9SQlV0dnJQRXg4eWhLdi9pcktWalFZVmRxeE9oZWlSWUNtWlM4?=
 =?utf-8?B?T0R3K2F1UFJvRXZsd3psSnhtY1pDSW04Y2dMZ1NjbXJZM3hma2ZjOVV1T0dY?=
 =?utf-8?B?bWg1ZGhOTmtqSTU4VnJ6dEVSR3FOLzRrWGNlQjQwblpNZVN4M1dWb2JUUWRi?=
 =?utf-8?B?OFpMZmxrMGxRZDJIdk9ET0xtS0ZLTjMreTBqY0tyTTZ0VGR2L0hJSWVoUzN5?=
 =?utf-8?B?U2J5NzhKTUFhRmNBTk10Zmc1QzNYWWxjVlBkMFZ6aW9rMzJxbjY5NzgvSklZ?=
 =?utf-8?B?ZnR2MEw3WXoyRk92dXZoUmg2b1gwUUpDUnpKck1vZ0dDQmp6N2M5U2hsRmx4?=
 =?utf-8?B?OHdMaitrYTRZd3FWeUduOStjTmZzT1dLNWRNbGR3bGdraFRIdVI0OHhOcUd3?=
 =?utf-8?B?clJpcUhVcWdNZ3dWV0hHcXNhUW9OQ09sTERPUWhWaVJFT2VhTGd6SHlpUkQ0?=
 =?utf-8?B?WkJ2S3Ryckhhd01TbDNSZ1VWL3ovNnQ1Sm1wemFqekl5LzNHaEltMW1rWmx3?=
 =?utf-8?B?ODFZNlllYW5wMWROOFZJeDBJd2psZm9xT0NNd0pMUk5XUlV5eE1jbVU3VFZF?=
 =?utf-8?B?Z2FzL1RCa3I0dlhkSDZ6NUFiSnE4WUlCcGNDYVdVZkFpUk1Qb0xrNEdEV0NH?=
 =?utf-8?B?aVhpUGhlaW13ZVA2Z1VNTjFHTVNLczdXUDA4UVJLVmIxZkpYZWhmTkdFZXZ5?=
 =?utf-8?B?ZFcyMlFPOElLTjEvSnBPYkxoRVRGTEdMS2VmZTZYeE1QU296REt2NFhZNTN0?=
 =?utf-8?B?RHl3blR1VDR3Y1NkM1VzcjVEQVhEZDgybnVlc1BScFhTZFYrUGxHcWdOall6?=
 =?utf-8?B?dnZIM3ErNkFycXNWd3VVZ2FZSTEzNzZESW9wWUFXaGJiZEZ4Ymo5c1QrTUgy?=
 =?utf-8?B?cW5nSW91eDIzYWIzbXgvdklGQXpjWmk0VkZwaU8yWTVsd016VS9oN2dHQ1RT?=
 =?utf-8?B?NUp6ZEIzWGQ2TWRMYm9tWlRqVGkveTJXd2tOQlNBZm5IQTZsTDBjNnN0NkZS?=
 =?utf-8?B?Tzd6NkZrbFIwRUZQVGR3KzVOSEJJOXVGcWpEQmhBaFJTNXB1UEsyUjhoNkx2?=
 =?utf-8?B?dTZZTWttU0hnZDAyQm1oczMvRVNGSTJBL0t0MkdDR1AxQkxCQVlteGVFM29Y?=
 =?utf-8?B?TjdKVHVSbHd2L3lEWVFEOTN4NTNJQnRNV3NZT3VNeGJUSUJ6aERZZFdXNDI2?=
 =?utf-8?B?WktKQzQ0bkVsZ05oWndDamxjcjMvRWJoS0ZlRE9WdGVRUnZHMFFsZFBtQjNP?=
 =?utf-8?B?M1llbm5LUTdnelVvSjFhNzNuSThXQ0grY2RtVGRNWWVsdTNjbk1ZNTU0QTVx?=
 =?utf-8?B?SGtuZWExZVF2cGVFRlcrVlYzRG9YN2Jtak5aMFhPNWNCTWlyMEgvK0RncXgv?=
 =?utf-8?B?WmEreE81OXdvZ2paZGkwaFhEcStWZ3pwNlNrZ291anFvN2JJZCtHTENJaVlE?=
 =?utf-8?B?dlJhWmU4MWhqbFdJeW8xVjlNWDdmTUtpZ0I5dHJ3WjFNc28rVjUzSVdPcTV5?=
 =?utf-8?B?S2NLZXg0b1d2aU9SSDlTVlpzbHlUVTROT3p1Rnc0Wk9OTzZKZ0tyRjJBdDU2?=
 =?utf-8?Q?/sL+K6b9/oRrabvk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f5af6b-2e3d-43de-0ba6-08da12585071
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 14:19:34.4072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ommH41O/9ZhEWFGRB+mlVCsljGqzH6+ZzFM6u6jlfP1c36xuBNU/kYyX8EqiS/VBlheM1q3hMWQS+cxuv4Sc8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4229
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 01:05:31PM +0200, Jan Beulich wrote:
> While not triggered by the trivial xen_nop in-tree patch on
> staging/master, that patch exposes a problem on the stable trees, where
> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> account for this. Handle this right in livepatch_insn_len().
> 
> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> was set. Note however that the earlier call cannot be deleted. In fact
> its result should have been used to guard the is_endbr64() /
> is_endbr64_poison() invocations - add the missing check now. While
> making that adjustment, also use the local variable "old_ptr"
> consistently.
> 
> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")

I have to admit I'm confused as to why that commit carries a Tested-by
from Arm.  Did Arm test the commit on x86 hardware?  Because that
commit only touches x86 specific code.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

FWIW, on the original implementation, I think it would have been
clearer to advance old_ptr and adjust the length?

> ---
> v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
> ---
> Only build tested, as I don't have a live patching environment available.
> 
> For Arm this assumes that the patch_offset field starts out as zero; I
> think we can make such an assumption, yet otoh on x86 explicit
> initialization was added by the cited commit.
> 
> Note that the other use of is_endbr64() / is_endbr64_poison() in
> arch_livepatch_verify_func() would need the extra check only for
> cosmetic reasons, because ARCH_PATCH_INSN_SIZE > ENDBR64_LEN (5 > 4).
> Hence I'm not altering the code there.
> 
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
>       * loaded hotpatch (to avoid racing against other fixups adding/removing
>       * ENDBR64 or similar instructions).
>       */
> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
> +    if ( len >= ENDBR64_LEN &&
> +         (is_endbr64(old_ptr) || is_endbr64_poison(old_ptr)) )
>          func->patch_offset += ENDBR64_LEN;
>  
> +    /* This call must be re-issued once ->patch_offset has its final value. */
> +    len = livepatch_insn_len(func);
> +    if ( !len )
> +        return;
> +
>      memcpy(func->opaque, old_ptr + func->patch_offset, len);
>      if ( func->new_addr )
>      {
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -90,7 +90,7 @@ static inline
>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
>  {
>      if ( !func->new_addr )
> -        return func->new_size;
> +        return func->new_size - func->patch_offset;

Seeing as func->patch_offset is explicitly initialized in
arch_livepatch_apply for x86, do we also need to do the same on Arm
now that the field will be used by common code?

Maybe the initialization done in arch_livepatch_apply for x86 is not
strictly required.

Thanks, Roger.

