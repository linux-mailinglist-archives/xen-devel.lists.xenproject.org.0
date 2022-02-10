Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3746F4B0A4C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 11:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269763.463852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6OB-0004p6-Oz; Thu, 10 Feb 2022 10:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269763.463852; Thu, 10 Feb 2022 10:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6OB-0004mB-Lc; Thu, 10 Feb 2022 10:09:23 +0000
Received: by outflank-mailman (input) for mailman id 269763;
 Thu, 10 Feb 2022 10:09:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9Dk=SZ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nI6OA-0004m5-SA
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 10:09:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82c0cf23-8a59-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 11:09:21 +0100 (CET)
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
X-Inumbo-ID: 82c0cf23-8a59-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644487761;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2q1VyKhEWKz+23WNZsO8UA5PZFr5O1P1tFK/WSf4kVg=;
  b=Lym3JRKu7ZZajyH+6kTBWGv5VUro3DP+C5SOkU9zEAbo3OcipBZ6wbyS
   6Xp/d2V0kKQWYrNwhFq45Pvinh8do2DoYqcQWjUPF5hXdIquGSRqKXURM
   +sIjJeOyB4vuZqs0Kmgs9T0Knzh1IzIZ+vOKTaKPoXtSOqjIit59+jZFM
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MCwoY3U2H6aIsKoO+Jk3Ma2epybaU3uyWg/yh5HQTw8zNcSDMrsHAkgri5oQAO4K5j03Jf85/o
 bQ5KVTQZQ5NCvNnEPu9ft3YnFOC1xQa8hR/w4e48J2LEZr6OFVPXKXWMi1DlakR0qWm++3cKcy
 EiutqKznkbU8BZe6KlrdEUhiEMgNV0ORCf0yB9mpB7Jd3F4N0kaJzRG1sghpwDXIIVwa1XO3uD
 8gg6IBRLzCarmv5K7NsN4VEP0Il/2shDIOCC0NgmNiN1+NimXzb//ySBv74m9iGC671Uk4rRZI
 n0Dxy2buc4IZBeNfTXwiea39
X-SBRS: 5.1
X-MesageID: 63911985
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PjUQcajl8VDOh9YXmCPWEGMhX1612BcKZh0ujC45NGQN5FlHY01je
 htvW2rVP6yNNzD9edh+OYni9UNQ75LVnYM2GwZkqStnRS4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /108qahRh14NZHHmedebUBVTxkiFqhZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3ZEXRKeOO
 qL1bxJiVC6bMxxAEW06AaAyvM6yq1PtTyVH/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34TiY9nOhgMffkCW9X5gdfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ89iMwoIAo+UesT927WAe3yFabujYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+fRG+Z97yUhSivIiVTJmgHDQcGQhEC+MLLu5wog1TESdMLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1WmAuSOjvMnCcgU05UbpB2/51l9SYZHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb+Jdg43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8M4ImjntZLlbvEMRSiai4hDmFfK8Ey/9XB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTCOCLOE+9dawvRP4jVCZ9oRi2Oq
 r6z0OPQlX1ivBDWOHGLoeb/03hWRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi0zOdvHAMckxVpmbHNEALpd8yV6CWpZxPxELMVfkHhO3LEL8MOYu
 NFbJ5veUq4SFlwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 dVMDyvXHsgOQRpMFsHTZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OgMl6P8PfQLkUxkqY15F7o3n6sy68G2/+1Rzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXYOzbNtnkHVgdIBseQt6CjfxEyCPP6fkVIVnh4HMl9rSwTkgPbQKHjzZQLeUpPdp9k
 /shosMf9ye2lgEuboSdlilR+mmBci4AXqEgus1ICYPnkFN2mFRLYJiaAS7q+pCfLd5LNxByc
 DOTgaPDgZVax1bDLCVvRSScg7IFiMRcog1OwX8DO0+Ny4jMifIA1RFM9Sg6E1ZOxRJd3uMvY
 mVmOiWZ/0lVE+uEUCSbY12RJg==
IronPort-HdrOrdr: A9a23:iezya65s90zzu3cHLQPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbq6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsOmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenEPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tpt+CVQpAZEyHsHceg12w
 3zCNUcqFh/dL5mUUtDPpZzfSKWMB26ffueChPaHbzYfJt3SU4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.88,358,1635220800"; 
   d="scan'208";a="63911985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUG2DGMTvqhCtpbSSkHtF19OhUQI01r7T7oeNLIEttsF+XJxCoZJ2sFaEqd1HSTOnkbm7FoyFROUi+Hlfw7WVnE6HsX0MahogYHyFeXyEfqPO9pn1CVB8Tkkjae/LrO0C7lI+qqYw0BZT502t4UOHiWdBISTixNYImBfAe0xThtYGHfkTrKkwHU9jUclE24CtqXN7Nily2I73S+aIhsiiinI3PE2jV2z/2ePnvjTSF0g9K4d7EFjbjelYsqOit5QlscrOM7cN6GD874QLkQP+dpZlrGpHN3tNLiohdxEgG2e+wtY/upWiqsdJfoJvKcTlpvJ0RB4IPEmxcWH2pUmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RjCmAc7agmyzI0yWa//DZ3lhJzsYLLGRDvR+wra0yo=;
 b=jhgmlX26EEAujTJgi6I1A2jxAoGlPS00oU+4SbyzbO2cQYvgiLtPeZfhHN21qUpayTu2WJYxmvB18VT5dK6g3SrnvNfQIjYfGkbnj4fvROgmqXxfE7Pby4AmosGuQGMl7laKczU2gWUGlbv1m4IR5ON7WHyxuaN1fnXaYixuy+blGN239wUTu6q/8cLF6SnMqFBYO/zcuAgp8CAr23KEFcm0FNbuqFyhkh8nf+34rGWfj0rjWA/roDa/ASs3d628lfY6eDcnpSLxtj2R/hT2/E2vdT9HgaV+XzBddq2aAoweSuDFcRnaPK+S5QAXxDJ/EbX7UrmrV6u1Xu6nDTqa1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RjCmAc7agmyzI0yWa//DZ3lhJzsYLLGRDvR+wra0yo=;
 b=Sj02Up+WvtDTQuKlhnXdDkmo4paRdJtc39njtWQa/hAvkMqk8/un2X1se1NCSEnYcIh4MLEQx9+e3b6OF7DyqSsP2WaMo4sFFTAXOTfzSHjfoRTwhqIjmvmfaOHpJJ9Isuhow8eMYzM34e22+scKKSr2hdrYJBum3icdxTBh8l4=
Date: Thu, 10 Feb 2022 11:09:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YgTkRtwqmZsLZIXo@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207182101.31941-3-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e86ad10f-dd20-4ea0-141c-08d9ec7d64c6
X-MS-TrafficTypeDiagnostic: BL0PR03MB4129:EE_
X-Microsoft-Antispam-PRVS: <BL0PR03MB4129EE41EF7B12F28433BAA38F2F9@BL0PR03MB4129.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xv/d6zYQcoGdU8AQ+JEfH2ii+SA0SNL9/7sNDbF9V75AHRr0odWGqL4HKRnKEZlmMNS+otLRU2TiN2ZajWkyds1g/OFkaT9jWGfn+fbCNbHFH9bdCYXIEtT59Lwv7j3SNeEwAccVkYQEdFbZ4SB0YBNWzq8V2xepWzD9amKcPYOfMv4mMB/a5zEuA/Xdon3m9/0AZd1OZBOrBZ35Bc6dmfm8nKh7Wb6j2uB8nNL2uS7fvugFLHPPLpB4M8beKuoF7k1cwXJxIqmMiOzL156GdHr2cioqJJfPXihRikPBAHdGS2XDGriXDUkBO+ULUQ5VoCGWLpy0RAEyq6ebbAsleEkH4/y5OsYc/m5rwIwTTn9ABE8U+FBLsh7U0A4i2qUr5WEh5gaBB7zJpyVFkMFCvwz6nMr9dCbBhUhMDdeSDXvlmI8IQsTo8jHyACiKFzqabTtDXzg/sRhd95EJVBeKiWIqNY9IqIi44svoTuZ+fLEFNmAvZNNVPWEE6aDGFwqwwE/r9Le9SuSjTmZhb+2U/ALwL8bOy9ksmMMrGf13mhmyGlred1a/Pxm4A1hEN+uO0pMDh+kj7+2iLLNXt4XQiXE7jfVDBwTkMONnDs0LgWLPJFTl+pUuOomDbOtU8QteBdQ1aQdnZNUr/xBWx4RB/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(6862004)(66476007)(66556008)(8676002)(316002)(6486002)(66946007)(6636002)(54906003)(6512007)(508600001)(9686003)(6506007)(2906002)(85182001)(83380400001)(186003)(26005)(33716001)(86362001)(38100700002)(8936002)(6666004)(5660300002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJydGVmdG1FVkdEUFpNV1BWbHFSajdNTXQvc09CcVl5UlRscUtOOW1NVWpj?=
 =?utf-8?B?bHJXQjRMZzQxTjAzdTRJY3FlSko2RHdLVnRHeFBoZTZBZFU1TFRPWkRpbGl2?=
 =?utf-8?B?N2wwbHgxb1FlRTFMaVQ0UWpCUFpNT2Q5a0JSQXVMOVg1QzB1SXg2Uys5MlY0?=
 =?utf-8?B?ZFBhYXU1NGQ1QWtQTDlJek5yTnNiaG5PTXA1YjVwS3M5SnVrVmJtd1ZhWGI1?=
 =?utf-8?B?Q1dnUFcwU20yNnZjSzJrV201N3l1bEJVelAvWWg5a204SE5udHpXZVhKODBx?=
 =?utf-8?B?NnlpazRRdmxXczhjT05paXIrZkJEUENldkErWEIxZk42UVJqaU84MUtzRHVi?=
 =?utf-8?B?UmVPTkt0SHVOM0VLZ3p4NUR4ZWhTL0YzMFA5bzZjVkZLdUNXTElGT3M1djBy?=
 =?utf-8?B?aUNKamdNRkl6cER3d2NYdEdLSGR4dmxhM0VJakxFd2Q1VFJneHZSMHhKeWNs?=
 =?utf-8?B?OFdGNzRYSG10M2lIQ2paNnlIVnc3REpPSkxnZXhYbVZUL2xjRmF0YVlwWm5a?=
 =?utf-8?B?bUFLd0dZS2xUU0lGRUVRYzNKMS9uenIxMTdjS08vZlp4K200ME5XeDZmYUZR?=
 =?utf-8?B?RzlTNmJzalBPN1hETWxkdHoyYmJZVDN5UCtRSEZYRnJNMm50YWhIb2VQakVH?=
 =?utf-8?B?dktaNm9KU0hkQWEwNWVVbVRxdEV0SGwwT05sVjBBL1ZnSzk1bmxSbk5pMDZy?=
 =?utf-8?B?eldtTFE0UUFBcU9CYkpzamRYOXhVcWljL2U5bnNNc05GNExCWVJRZ0NWcmZI?=
 =?utf-8?B?K00zc3lYSFlxZkMrUUEyT2IrWDY0S0FWVkpyblFUNFlUeWJHUXJCcTlZUEI5?=
 =?utf-8?B?cm4wbk5xWEp6N2hDcFI1c29TVEFVRDVMazJPckVBYnhZSjZYZWpQYUU3azc3?=
 =?utf-8?B?RmMydHg5V25nK3d1cEQydjFwc3N5bHBSV2o0MmNqSkFhamVLVmN2K05wK1pk?=
 =?utf-8?B?eWVKYVhZUmRUQWFRV09iKzNuTUFYbjlzcWVFZkxwYitxakcrcE5IK09pd0hr?=
 =?utf-8?B?SHNBSENJUDVGS0QrRG1vZE40QVZFd2M1MXBVM3FVR0R3ZXdaaGNlZmwwMGgy?=
 =?utf-8?B?STlETmZSUG1VaHFkV2o5dVhpOUxINnIyZDR2M21nZG4wV2JHWFlFV3VUcE1z?=
 =?utf-8?B?elI4YU93M2Z6RWwwelc4SnJ0RFd3Mk1vQnhNTkk0NXFIQlZ1aG1ZRnNKdEZW?=
 =?utf-8?B?UEhEYVkyWC9mdThiWFlNK1hkTGpicXZBMHpXb2hwMklpQ3d3MUd5dkpRY2ZT?=
 =?utf-8?B?TjRMcW1iMzVib3MwR3R2QkhYZHJOempkd1hYODR1S3V3S0k0ZDZXb2MzQWht?=
 =?utf-8?B?V0VwZmZHaytPVk5hVjl5LzdsSENhdXlwVnAyd0VGT3hBMUd6VXlVRXBreFhI?=
 =?utf-8?B?enBsb3hNenFqNXZFRzA5SXo1VHd1REtEeHRoTlQ2dUk2WGdTdTlFTnJaWUF6?=
 =?utf-8?B?cHEzL3JwS2dNY0t3SkhaUVdvMlNCSnIzam93SHF0eGQwcUlyc2FzRTAxU0Jw?=
 =?utf-8?B?VHN5bXhRMUlmbkl2SlFPWTlpR01QaWFTb3RuZDg4eE85TWdiZUQ2c1dKZ1ha?=
 =?utf-8?B?dVRrM0J4c3U4NmF6aTFMNHdJVXI0Mi9oRlJVcWszMzZQK29NZmhUcjVqY3lB?=
 =?utf-8?B?ajhJd01SeC93T3NiWFNVRjFGZDhPU08zcVdhZzF2VDdMTm9yT2NyTDBLNnlJ?=
 =?utf-8?B?R0NWSDcwa1FsZzNKdHl6emsyc0hPRGlpclRCeHhQWGNmazQxek1GRUY1aHk1?=
 =?utf-8?B?RG5DY25EZXFldE1QcHNPMVhkTzQvdDFWRjgzVTUrclBEOU9nZzJJY2VjVnkr?=
 =?utf-8?B?Rmk5WXdyV3U2bzE3R2kyVTk2RVRCUTd4bWhTUENDdk1sbXdsaFN2UlBOa3lM?=
 =?utf-8?B?eklFTW9LRE15NGd4S1BTTnE2aVpQLzhCTXlMeUtRdG1mYmhhOUJ6OU94MmNv?=
 =?utf-8?B?ZUkyU0tHNjZDV0YwNGk5RE43WGZpZjJ5VkhmK0NjR2lENU10NUZlaWFKY01H?=
 =?utf-8?B?Z1Q4RXVnS01kUUFadXZIT0dlTjV5czNtb2ZKM0FtdW1oa1NoQTlXcWFHSFVO?=
 =?utf-8?B?ajExT3NJRDI0UnAydVVaNzhvS01INkxmYWRLZklONTVCWUE3ZGVmWE5tS2E1?=
 =?utf-8?B?aGVRYmZzRTB4K05TWklQQmJUYnY2Y1FoRHY0MnlXWFJ3RlptNzFzUzNaY2U5?=
 =?utf-8?Q?94oDvjxbetUb+atKtOhOJsc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e86ad10f-dd20-4ea0-141c-08d9ec7d64c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:09:15.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyw5tfsAmV6ISw5G72bjj7Gi/j9ntx5Y8RAqElCkiO/AlS0ivwKIKjz4/IsT/+0ThR8dh6WvcOhJAlhcF/xpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4129
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 06:21:01PM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted vitualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by running APIC
> read/write accesses without taking a VM exit.
> 
> Being able to disable x{2}APIC hardware assisted vitualization can be
> useful for testing and debugging purposes.

Might be worth adding a note to the commit log in order to note that
vmx_install_vlapic_mapping doesn't require modifications regardless of
whether the guest has virtualize_apic_accesses enabled or not.

Setting the APIC_ACCESS_ADDR VMCS field is fine even if
virtualize_apic_accesses is not enabled for the guest: as long as the
feature is supported by the CPU the field will exist.

Thanks, Roger.

