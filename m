Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C008A44978C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:08:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223439.386151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6FI-0007Ww-Mv; Mon, 08 Nov 2021 15:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223439.386151; Mon, 08 Nov 2021 15:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6FI-0007UQ-JT; Mon, 08 Nov 2021 15:07:40 +0000
Received: by outflank-mailman (input) for mailman id 223439;
 Mon, 08 Nov 2021 15:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d70C=P3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mk6FH-0007UK-Ee
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:07:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b08a358-40a5-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 16:07:37 +0100 (CET)
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
X-Inumbo-ID: 9b08a358-40a5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636384057;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wblfqh3WzBwE8nSffR+fgM4n0bj78+o55Wh3VKFG5SM=;
  b=Talo/XYzH1CA/zmJN2QcDyWIDchdFs41nzJhUtudk9saDPOHdVZbOLgs
   nPOgAW1hy/Dn6qyg2dNOeNC7xwgZT5ZdzIHSCzg8FVpqyQgp4M3mvctJG
   mH4B/Q+FZK/qvMZlRMf6XHOVkxhfZaghQibBxw2NyfqOfJHxkLu4BZA1g
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bUN0SLjg79ZQjt7T6vN/3+VZ0uDCt6v5h9e2NC1JnDwj926fsOE2CBYS8Cpzub2/oBuMH/z8sh
 OGikmjk7n1/xwwTX9TzPiPxZF+yVYIFP0UWfWFpSF6E961mFCq15aNERBNEasK3Pj4lKAz1ETI
 gU70TsjDLJaj6E4cvgtyxaAECTOGddXz/mlXWJSkzCWuoksQvIoXtklGemqcnW2JxEzlUowuTa
 +fHRhIjj4nKpBDULDEGNIDGJzHhhwH0nqpLoqTEAcOQO8+apcyHeKIiXshTndWLkJW6cVAZqrs
 +4DNqZbJNtJfXc4LzDBKLZfL
X-SBRS: 5.1
X-MesageID: 57340858
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FwGSgKi5O6+hobfcZw9wau0NX161LRYKZh0ujC45NGQN5FlHY01je
 htvW23VM6vZZmKkKd52b4vk8UNQvJaGnNYwT1M+pHhjECsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1wrpnzUAUxN5eVlbw5diRzGR0gH+pvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZsSRaaDN
 6L1bxJuMEn/TgZhfW43VrZ5gsb5pkS4VmxX/Qf9Sa0fvDGIkV0ZPKLWGNjaYNuRXu1Og12V4
 GnB+gzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasvAMYWtdWO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq196iWhSO/PzAPKm0PbjNCShEKi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1RWZWgJJWq8VHhtPsYCKOkZVO94
 lpDsp3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkVoJvMc7AZe8UUNgj2td4ewOxLOoK9nqX+u8gjFmMskoL1/vEM2DiCetM4HRfKoEzPlX1
 XSzK5/E4ZMm5UNPlmveegvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3f/l6Mq
 o8Da5vUl32ztdEShQGNoOYuwa0idyBnVfgaVeQOLoZv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchQw9bYLvlWecV/iQik6MNvHBM8jxVpmbX1EFQv5gBALPNfwhJrzgrNqJNHLAsQ4lqUqJ
 xTEEu3daslypsPvoW1FPMas8Nw7HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw4ZCoPQP7wnV63o1YHn+d+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvtMkQbZmxK4z/fX1oLpewlg2FXnHdQ3zWLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd8N7aNz/AZnDXW/M8ZGkSi6X8l5qeDXGVTIwKI1H5XIoxqPd532
 uwmosMXtVCy00J4LtacgylI3G2QNXhcAb4/v5QXDYK32AomzlZOPc7VBiPsuczdbtxNNg8hI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEyojfm/s6/BxN6jBmHA1awyJO3/93J
 mU2ZVZ+Ir+D/mswicVON4x299qt2PFNFpTN9mY0
IronPort-HdrOrdr: A9a23:3umV4almgOZ1evb+XLmfrV6EifnpDfPKimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOdOEYbmIK/PoSgjPIa+rIqePvmMvD6Ja8vhUdPT2CKZsQlDuRYjzrbHGeLzM2fKbReq
 Dsgfau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,218,1631592000"; 
   d="scan'208";a="57340858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jebrtOulpPS1RUBShU+gTj+Ebn6//Hole1+rt2zYWocUEHRO3PBPplU8niFq+5XxH9MJTRa1wt8u4drfbgsDiO+8v1Ciq8DavbWtdg87ARxUFpilsPVnvDQpCA4w5//YQuR3TaRnb7BIgDTim4FDm4AFtOYjR+9iSzhi6Gl4+uyURagufnuHygmQCB2+ZVxKOZhuWh6Z4rF9wGyTz94Wxl1oqqvNC+1bJND+Do1kRTxsurg8QswOgSfkr4mC9DD4GaROXULwBsvYc31AWxh625slW9LBtRjBvlrkbTUnm0l3v3roCBJAMCFsnUi6wa1L+P+OdMvwMSZC9Q/pIl6kUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D/21AMvE0BXqsWp6L6XdjqJ1kvAowJZnYHj0oAslqk=;
 b=YAUZF/n7V94CHJgTh2nl2czq0xZAFNvjksvVKID+oL+etRHk9bgyeMZwPK2njM3SpGTX4exLNZMvfClnRQfWZb7JwdOJt2rkcf3VM35jwyPXrCHDTLa8a4Q4TrIRstRUHAx0hDk6OaZKbe5wYrjOW8EC2Xtqo09311BRo13evziWC5apa7Oy0Y3k3A9Nt0g/RlT8rJsz4RlwQypr9+Hz/c2Yhcd79uk0d8VfRConfQQZxTyO0vKZIGuSijx1YkE1A+hM1QVuqklH48jRnEBLPxblK67Fp/z3GWxZFqVQMpwP9xN1/Ojckmn+fkcJV0qjyzi/8XzL3yL6fm543cfs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D/21AMvE0BXqsWp6L6XdjqJ1kvAowJZnYHj0oAslqk=;
 b=N4QRiR0FdVavEO1sj8z2BI8nfJolaccqHZH82gg7SZPfzHds450ZW6xREDfgqRtD9v0xm1wsYhs7pvPJmcjEb3wh6FeKFJzhgTaMkYPxQu2ns8bpaSo1ONxExopm2qtZ44Dbe8tsVlIUGhTEHLIPSbPlOU9FnAuBpNa21dImJrQ=
Date: Mon, 8 Nov 2021 16:07:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Message-ID: <YYk9KiAC+chGNwaX@Air-de-Roger>
References: <20211104104834.10977-1-roger.pau@citrix.com>
 <24969.15273.122188.406602@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24969.15273.122188.406602@mariner.uk.xensource.com>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df7e1b7f-ed13-499f-fe49-08d9a2c97ac0
X-MS-TrafficTypeDiagnostic: DM4PR03MB6064:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6064C738A36FD6EF31728AE28F919@DM4PR03MB6064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0FoKNbNS3wAZKfbc9Qsy8jnQg/Sw4+nd3lF2q9APK9rh06jcaiQwrqLNtp6oZn+mwKKZfWVYGbl0uGiyOrQalrd5+mT1PZbmRP0te09NRQe0h1TQDwHHeFPiG/yZJmW5x1lgT9x4rsShH6GdYkmbfEbM9ZkrC0DQ2F9wgZbdPH1CPB5ljYAwf1rvKuwKhM4oPdcQQh6UoJfuEci9EZtURZluIyR8UVn0XynS0sC6oUUJQGcQAt8gDzuhlcCptCeLVZstd1g9hKcEBS83jX0bPxaT4dNQxCnnohET2vsWwMLvDV2PNsmdc8FEA6s9rRejuk51/PMFHLi2K8myR4gMuSyPTBlCKYkXzEImc5wU5wadSae4jD0KOV4Q6quWgr7n0G+/NBHddGlrRZs+8yEMRilDnFlpASfTUsHHF5mN+S0z/REOu6NF9aoGZFjlV97Ta3WGqajlyBp/QjzFqA/OfojT+bey9C9qLJHwekCVS+VBCIy9G/VrZadyE+X8YPr/herbP/eE2NxiKxLnVm2vBCh4nGwPWZqroI9RC2DfmeZdZp9PQrCoD5u5arHOwRfvjfiUZfiA64AbmPYt1MzhBsgTuVcxYbj3BXjKNrtpekHb1B5P3ttOq2LN7DP61wj9H26Oxf6muadmormzB553nRA6sVyiGFMWrxEXpuJ/Vc8hcaCR+zIWeko1DMV/8anVcFScyRc7oSYQRJsD/dajDuGvh+x/C8E75JKeF+JUVG/q6ef871ds1Wu+F6CGjCgH1eGMIeTWl8GhDRaZj3ockTCJoD9j0SMJt7lljOcCaio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(8676002)(6916009)(6486002)(33716001)(9686003)(54906003)(85182001)(66556008)(26005)(66476007)(508600001)(316002)(66946007)(4326008)(86362001)(6666004)(5660300002)(8936002)(6496006)(82960400001)(956004)(4744005)(38100700002)(966005)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS9wdHBqejVmeDJScFZXTzM0SzlyRnR2bUgyRyt5cUNQUk5uZWxJZmxnVnda?=
 =?utf-8?B?YVk0YXZVcmlPeG9IZnhoR2Q3WUIvRFpSTlNpbXVRamU1dTNOZUU4ZzdPNUU3?=
 =?utf-8?B?WExGUmt0RmFrNWNzWGs0N21WUE5yRW1IVlRlVGJJWUE3NjZ1QUtLRUQ0bHF4?=
 =?utf-8?B?N25WUEpiMVZaRGVEdC9wMCtYOFl5WWx4V25tQkNxV01rd1JZSkE2OFVodzJj?=
 =?utf-8?B?K0pTVHJES0lrbmpYUnRrdnJFOEJ4dTdnWFdVZlBKdjN0cXJPazJ0a1BlRmNa?=
 =?utf-8?B?MXdKMk0wb2l2Q0w2Q0FkTU80VHBpQTZTblpzVVdpSTVaNTd4Zmp2Qk9EYVUv?=
 =?utf-8?B?NE53UXpodE54V0FwdEhKdnV2akNPMFI3K215cndRTHJKVmdCZ21LbVR5Rkdx?=
 =?utf-8?B?UHdSeld1a1BwZ1o5alZHNXRYRE1rRXM4ZThRZ1JnVEhMN2YvZThWbXFKVncx?=
 =?utf-8?B?YlFZV0k2QjBQT25tZytzUTlNWDg5OEVaOGZnZnBzZ0U1OElBaTdkOUE0Q3JS?=
 =?utf-8?B?d3RYeFJ2bEM5T2hIcVZjOWx6bW4vQ2J2SXk4dWdUT3RjaUNFZEp3akptSmw3?=
 =?utf-8?B?d2srYkM0TDRnK3ZTR2xZaFdxayt5OWkyMGp5U2FjWmU5RGNUMGxYa2R3NjdI?=
 =?utf-8?B?RDRjRFFkdkh6cStUcXRNcDM4dU00enZQNzg2R1lWRjBKMTlLWjBMV0syc1cz?=
 =?utf-8?B?YXBKREtxLzkrL2hvYzFyMXBYWmtVckY0cVBCRmxnQUUwbEtQUlo4NnZBQ2U1?=
 =?utf-8?B?S244VU1iaUNNYXNTcnBxZmNRRDVsUjNOWHg2S05jaGRoSm5STXVlTzU5Ynhu?=
 =?utf-8?B?dG51UDBENURUUndqL0NoZThlZ3hKbGRsOVc0MFlPeXE5UDZLbmkzbk1relpJ?=
 =?utf-8?B?RFFiOEdoK2R1NDlJTSt1bXBuT2RDRGIzbXVEMGNwR1lRa3M2VzltRFlpL3FC?=
 =?utf-8?B?STZSUEphamc4OXVNQXFEU2pXWGdBYTdnNkJGZE4vVVpyR2lJcGNHUlVManhp?=
 =?utf-8?B?Y2EwczZNZEQwTWtBTnozZ0c0NU9OdllncmV4dGhrc0FSZDdZaUNQM2FuS1dU?=
 =?utf-8?B?eTVRMDVST3FOaUovRC9DWURSRjBQQ1Z4VVdsOGNOSUEwZnU2SU1IOFZNWXhS?=
 =?utf-8?B?TnZVSm9LRjB0VEtmVTgyWHpiaHR6NXdtOHo3RklMTUNjZElyaUVWMkJ4YzZh?=
 =?utf-8?B?cmN3SUhidlQxby9hZTIvaFQza0dTbGF1dUNQQ1kwNXRwRk5MZEh6RDhQMWRN?=
 =?utf-8?B?N3J6OEY5ak1yMXdMNG1yQko4cEJCL2h3MTZaSmdBcGU5aktXSlE1NVlzQWFy?=
 =?utf-8?B?ZEE4Z0pFZE9tdy9SLzBncittWEFrclN4YW9HTEZzNjNMR1Z5TDRQTVhUQUZ3?=
 =?utf-8?B?YW5samNmNmxVRGdrZXRzVHNVVFZJYXV6UjM4UVhzZ2hBMWhXUkx1UlBKZWty?=
 =?utf-8?B?ekp5SGpINUVLVFJjcGRwNG9ITFlBeGhEMDJuREVqc1hBcVJQc1loZnJkNWU3?=
 =?utf-8?B?U21ISFBHSnlnZ2hpWGJEU08yQWQzVUYrMFNsZStFZUx2OUF4UHd1NUFLdlRs?=
 =?utf-8?B?VHpxS0NIZ3lpTlRLUnV5UHpZS1JUZ3drbEU1N2NLOFl6VHArR1F6enlZQlV1?=
 =?utf-8?B?c2Y4NjJxK3c5ZU0yTXhQNUdkNVBQNEdFLzhvR2c5dGVvbVA3S1UyVTBkRlVE?=
 =?utf-8?B?MHNqd3NILzNpc0g4WVl2Wi95N1hXNm9uSHR2Z0FKZ3huZGhWMDB0VXlWOWpw?=
 =?utf-8?B?QmpqWjExTVBHdFhWczgvVmpiWUVpUHN3em5OQkNNbmQwV0NaVlRaNzBEOExY?=
 =?utf-8?B?cFZXMXF2VjVyMm9LdHJxWW1oV2ZhTWFGRDF5Q0QwVmRTTVM5Lzlsa3Axa1NM?=
 =?utf-8?B?TmMxR0VBbHBwRWhDUmdYZkUwa2treXJKQjVGeE5RYmczcmxwRGdZYUY2bHpP?=
 =?utf-8?B?V1pvNGN1VnlOR2VPRUhWQ2g3azExemxrNkNITUQrVXFmQjZiclE2UnNrdmpJ?=
 =?utf-8?B?UXVpbjZoQ1ZWSjdTRE8vcnJ1UlBaenBYaldseUFqeldkOFZUOTV3VzVOSHFj?=
 =?utf-8?B?OWpTUW1NdmJoS2pjb1BjQ0pEUGZ1YnRlK0ZIeThBamUwNnI4aHFocGN2eFpQ?=
 =?utf-8?B?Sk5HOHptY2ZUMWJNVktrYWtDb1lpRDE4dDBVMjl4UHVYVWlVVXJUWmxXakhk?=
 =?utf-8?Q?8MeRVgkeaixDpJhAMrylUGs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df7e1b7f-ed13-499f-fe49-08d9a2c97ac0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:07:28.2355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a02FcLpgq2KrlehZ+1upb0FmR65EakEXvrP58S0wpNxkqlmrxwWjYyA+1YJpLpzw5eZf9mWDo8D4wMI6OIBECQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064
X-OriginatorOrg: citrix.com

On Mon, Nov 08, 2021 at 03:00:57PM +0000, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> > This needs to be applied on top of Andrew's:
> > 
> > xen: Report grant table v1/v2 capabilities to the toolstack
> > https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/
> 
> OK.  Thanks.  Both patches:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> I hope this won't turn out to be a mistake...

FWIW, it should be easy to revert those two patches.

Thanks, Roger.

