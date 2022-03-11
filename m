Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF444D644B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289129.490523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgsB-000286-10; Fri, 11 Mar 2022 15:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289129.490523; Fri, 11 Mar 2022 15:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgsA-00024w-TC; Fri, 11 Mar 2022 15:08:06 +0000
Received: by outflank-mailman (input) for mailman id 289129;
 Fri, 11 Mar 2022 15:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSgs9-00024q-3Y
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:08:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b5e39da-a14d-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 16:08:03 +0100 (CET)
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
X-Inumbo-ID: 0b5e39da-a14d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647011283;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gs0u7tnL2WY6HHle9UCAegaNmYOL6XKCE5HpbHIfEq0=;
  b=J0gHozZAS8YmZzu/GAozCgKYNHyGOD+UiEWo47MS7rm0rZdThGUA7ySx
   xu92OPUGtVsY2JK9uux/vv/3TvCsQJdqmbZqmyeMo+ElU815iirSv/P/0
   FrDWAqJ1ve7bb+gtzvEXBDSdUFOHfW/g95faKD/zFGkm1zRtkN+5wWVvY
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66030042
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wyuqoKMW4icj2MXvrR2zl8FynXyQoLVcMsEvi/4bfWQNrUol1DIOz
 GIWUWzTbP2CNmDwLdB/b9zkoBsD7MTQm95jHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29cw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 N99i6GqeT0SGajCqPY4dUlBDwohMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlo3ZgWQay2i
 8wxdCBEdir7cgV0Yg0WB4wR3/+TjFy8WmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaItC4iZsBgKdYd7Q+92I/ysx+FLTcLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBN/IJrVml
 CJY8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id4Bu24hdB8xa5hsldrVj
 Kn74FI5CHh7ZibCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEwODrehPnGJreb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:qsBPLKPcQ1IvzMBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="66030042"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5T/kyE0eDLHhnXeZFbQUAhancDx0OGsaxXtgnlwWSH6tKZIsHTYneHwLDGaSV9DDHDPQBGoTEf2deCnJHZop67dBBbXvjktItayXj6HBBDXulfg4sHf+ThrFCuJjUrgHhY8gX1gj7YK6P+KKCt3uHV9/eh9y6ctXtd7fGyBE2f7l5UoA+NsomaRshT4NBqh+bN2t1LbKCd5ZqM/oJvNfXAa+8CEjH29pzqCTfHcSUhBrWWhNDROIcCY1n5QCmh1XSSINqXzM4FzgIo0Czj4WM0uZwD4H8y2ns35T5m/STuV5rRAPHH2tcRJQXyghgvJGOzkm54T2rfXHM6VdqBfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD9ALPhI+NUwjBofo27V0gTeE07oK0WA6/Hq2mZEOCM=;
 b=J8hj1EBh7eVe9PRN7XUAHv216d0HUbh5rrwlhBYawIG2yANykyLF/GIV/EsTUGvrcItj2usbxZaYLFnPEX9ymz9xQmKLW/ol902rRucinZu3LPxO/2m/sIiqb+r5RFyv+aJT+SGouFP85/GeTDG3duX8iAZVrMHQoHOIYU123ZiM7WHfUEDOLOqp16MravTu7QYp9tgWHiByY7oZ9xAh7SdKdF+Zan31l8pl61axS7yvpgCRBI4hncbpfws3yIQTcGD9DFxcvfIlvG4cx4H57QWhi6TIVHeYzzWf0ErA/cS7uTlLwr2akn3bx9Lj/Qo82HfMTnNRxlIdDZhgja8hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD9ALPhI+NUwjBofo27V0gTeE07oK0WA6/Hq2mZEOCM=;
 b=DFsWwceeMiAD+Yg7jaJI7bZR3kIctQTQJtOJhpjyuhBuB4K0Irddn7+Lsaxj86D8EAJ4k4zulE5s3BXrZatSnDcAojFD+MxwC5iZMIdCpxwdLkFC78KsFmSUqfdDtTyxjke5sFFih5v1WvG/ZS9WtWXSD4dnLtBYNSYuQodBK2s=
Date: Fri, 11 Mar 2022 16:07:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <Yitlw1EN+egVJ4xD@Air-de-Roger>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
 <Yitd9RNJf1vvOsf4@Air-de-Roger>
 <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b54e33-8328-4420-64e0-08da0370ea27
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB296983A104D7E31483262D1B8F0C9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCEwJ2r1WnMcHnxvIX4SKDM03capexxPtf6jE9CFPltuM7ytQUXjjWLzziBwe33nqn9L5R/XOGnXYXIPQV73OnixS4Tck9Zbmpv4QwqL95487a3RQF849K9SVCTFedNsj5H9dPvHJ5pv8pEi6uNpRWxWzkezTwTeT+nqdF9SZGayhJwjWmTVK4d/z4+YV4QzCgyqiIIPeun0AKmsHPgH+brvnkiIp/BH8KZo0y7Fu7yL/hGYedzsvOOWCSr5ng8nJv985w8WiWVaqeDwbqEnettW9Nji2v9CSKEpZnGTEPQ/OmSeNEvGC3v0QRlK6PQ+BgnMt4wLJmr7Ds2RoREFhFW8/wxVrN/HHwYYlnIUbvB2s35O94nhnEx8vpaHiGmLtuhbcmYhprBmY1NnF5Sp9PhMNygTMTch0lmhPDEVS8++I/R28aIDnNvKxHTYyfPP5oIv+XTTizvI+non+GLiFGCCP5YyQGRB1IDeNyG5hJVqhEayNnt1iVxOHi51KjSVDrPoGtYUyKtK4xl3FAa6LiAJTOGxZrQBTvCUjyyNyAT8h6uQkU7bMS7wYV9bsvPfGsfzOyeCp4QOmT5XZAz3MrnnfLUj2un6oBrgW9EZrjzLv5PNMcOpKKv701HOMyxo0i4Xfxv/uMsCQLVpvhU107/OpORphmWq90hDn5fLH0KwvdpFOXA/EiRqopkvu0ch3v6iK58s9v18galn1tYlog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6916009)(85182001)(8936002)(66946007)(83380400001)(54906003)(38100700002)(186003)(5660300002)(2906002)(26005)(4326008)(8676002)(86362001)(6486002)(33716001)(508600001)(6506007)(6666004)(53546011)(6512007)(82960400001)(66476007)(9686003)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThURy84eVdFeFp6NldDMGFMTDBPMVowUkp0Um4zbGJPT1BKK0RyNWlYUHlu?=
 =?utf-8?B?QXFoOVIrU2VYSGtqd0I0SFJzOE5uckhvamd5TjBVNjRFdmpKczRtekNIdUFh?=
 =?utf-8?B?bWdXQ0RuTHdGem5FVzhsU3JhcEtKSmVGZFVnZnF5WjNteTcwRndWdWMrdzFU?=
 =?utf-8?B?SHhvQjdvV0dOdE04eldtbmZuYWRvdE1ucjdEdW93RDNIdFMzS05rWmdZQmxX?=
 =?utf-8?B?djF2cHVJT3JRUnpHbm5SV2tFUUl3RDdVQ2UyWWZIS1dOdXpnaDhTZnlJK1hQ?=
 =?utf-8?B?QnkxRzNaNUN3R1V0RVJYU2JPbEozTTRGcDFwelZKK094MXR5M0VNODlPUFJm?=
 =?utf-8?B?ZWJaNmRLbkwrdGhtdzZPNHV6eVZVSW5NMjk4SHZYS1Nrc1V3TWlWd3RlWnJa?=
 =?utf-8?B?elpLbS9RNkxjL2l3Ty8xRnBLQzNkNklJTjF6UUlNSHBiN2RQZmhtNENXQnY0?=
 =?utf-8?B?bVF0dW9OUk4rczNFYkV0Y21pNGxobjd4QUNWb3ROUG9XTDBBUWFUVDJhWElv?=
 =?utf-8?B?bUVySmdDc05yY3R3M2ZPYTJ1UjlqeVl3bk01TEcxYVF3ZFc1dnpSTncwNXBC?=
 =?utf-8?B?bGhUSWF0OU1WbUNZVmx5T0lDVVlwaHlVZ1hGNytpZklmbEpLam9jK1gzaEMx?=
 =?utf-8?B?Z1d4azVMKzIvTVRtSnZuT0FUa1R2M1NPWFBuVWNvWUkwWmFUWTA5ZUF1ZTdy?=
 =?utf-8?B?WEgrV3RQS3djNFo0UVVncldIUkI2bFJnV0JYbUlpMlBsbis1MTVMVWpSZnY4?=
 =?utf-8?B?d0MzMEQvVDEwajZqNlFUaTRJcnptWHc0RWxBR0VxajNFUzVITVNlMWhIdUNt?=
 =?utf-8?B?U3lKcE0xRU11VHl2MjNKYVpCTFZHcXB4M2JVZkR1N1dJcUtQT1ZZc09LTk1j?=
 =?utf-8?B?V1lKM0tZNXp1U0gzeGc3cTMvM28ycEUzOFZrc3plNWlhdUgwYUxjMDNMcEo4?=
 =?utf-8?B?Y1FlRUcxTXB3Qk10T2JJUlc2S01HVFk3WjhOOG5CSG94TEExTWhFK3U0RUJN?=
 =?utf-8?B?V0x0alY5blA4YnEzalU0RXFrSXZVUjNlbGtpRjNyR2piZm5LeFJXZ2lqUEN5?=
 =?utf-8?B?NlBlWmZkRzY0WTkxWVllU0t4MWV0c3U5S1RBRW04WUVZWnEzSEl2K0ZnSWo4?=
 =?utf-8?B?aHhqZEpzakVGcWVpTjdTTlkydnA4M2dVWklZYUFIL3dwYmN5YzNoYkZET1Vq?=
 =?utf-8?B?cnJpRmlmc3RkanNYR1dlMk1Lc1lyMjZ4blVtUElLMHc5VCtpQ0xtZlY1ZTFY?=
 =?utf-8?B?QndRZGE3Z3lsU0NTSzdQbC8yOW4zVm56UTR6akNkSy9XZXRzSWJjcVFnaGJk?=
 =?utf-8?B?VFVoZWNjc0dST21vNTJGK3dZZ0wyZy9NSkt3VXJnU3pwblhrbDZFaHNRVjBt?=
 =?utf-8?B?UVJoNTZZT25Md0dCZEZRc3ZCZjVpbVhaMitvQlFNTGc0ZEI1Q2VYb2J6Tnhp?=
 =?utf-8?B?bElyR1RncUQrbm5uYVdMQWFCejlNV3IyN015aU5Ed0dvcGdBaGhCWTJtL3BS?=
 =?utf-8?B?eDVVQzF3Vjc4STZhU0xRY1BWTmlPNm1Ud0lHZWl5ZHJ4RnFDekVXMzAwcUV1?=
 =?utf-8?B?MFRYUnVWaWtHZkd5ZWwzRlAydDUvQU5PeFh1emVjRG16UUQzVEg4NWZsRUlu?=
 =?utf-8?B?RkNaSTlKeGoyUjUra2NBZjh5RzExajJpcXowV0gva0hUcHkrMXowS0JFNHBP?=
 =?utf-8?B?U2pYZVcvRXlnRnI2d2ZVcXRPZ2dBUWJBK3k5Q2t1MkcwYS9xd2VpQzBqbERN?=
 =?utf-8?B?V0V4SWE3UXpXMGxTaytjNSswS0ZEM05jZU5MYnJVVnRMUlprbG03VzEvbG5w?=
 =?utf-8?B?eU5Xd05lMUN0SzV3cmx3enF4TVdTbjhaR3BCMHlRWlZXbnNVTm5lY2Y2bW5T?=
 =?utf-8?B?TkpUOXZqa2p3OTR6bHdUMUEvN2JmcTgzNDl4bGdUS1RCcXo5dWdXZlZFSVRT?=
 =?utf-8?B?RlBhcUZ2eS9VZlhiNEVuQm5xR3A4U2RnU3RrQmRvU1gvb1RDNkNNUGNJcndo?=
 =?utf-8?B?ZEVYUFNqUFR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b54e33-8328-4420-64e0-08da0370ea27
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:07:52.7891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqKbdIOPfHfweJ9y74NmaqP4YKRfRaOSDZuItQGpCAHCRin5UWqrdy1FyRy+Z7SJOZaauzWIRgK4oo42Ucd0FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 03:55:57PM +0100, Jan Beulich wrote:
> On 11.03.2022 15:34, Roger Pau Monné wrote:
> > On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
> >> Support for this construct was added in 2.22 only. Avoid the need to
> >> introduce logic to probe for linker script capabilities by (ab)using the
> >> probe for a command line option having appeared at about the same time.
> >>
> >> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
> >>
> >> --- a/xen/arch/x86/arch.mk
> >> +++ b/xen/arch/x86/arch.mk
> >> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
> >>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
> >>  endif
> >>  
> >> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),y)
> > 
> > You are not going to like this, but I think this should live in
> > xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar.
> > 
> > It's possible we will need this in the future in other places, so
> > having it in Kconfig makes sense.
> 
> Despite me not liking this (until, as said elsewhere, we've properly
> settled on either approach) I did actually consider doing like you
> suggest. But: I would have to introduce there more than I need here,
> just for consistency's sake, and I wouldn't have a way to test the
> LLD part of it (I did check - none of the distros where I chose to
> install Clang offer the linker). I realize I could ask you to help
> with the testing, but then the first point would remain. I'd prefer
> if for this simple build fix it was okay to go the old fashioned
> route ...

I would be fine with you just introducing LD_IS_GNU. That's all we
need so far. We can introduce LD_IS_LLVM if/when required. I prefer
that asymmetry rather than doing the detection here.

Thanks, Roger.

