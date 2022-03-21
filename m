Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A534E2B72
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 16:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293051.497757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJaf-0001s8-Gj; Mon, 21 Mar 2022 15:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293051.497757; Mon, 21 Mar 2022 15:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJaf-0001pO-DT; Mon, 21 Mar 2022 15:05:01 +0000
Received: by outflank-mailman (input) for mailman id 293051;
 Mon, 21 Mar 2022 15:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWJae-0001pG-Ck
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 15:05:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4554b711-a928-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 16:04:58 +0100 (CET)
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
X-Inumbo-ID: 4554b711-a928-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647875098;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Vj+8Dqa/RsnRjeg1eJ2ZVDSCU7cQIs8N18qcMWjLslw=;
  b=ctfhNJeiXVoYbcU9kKz7rNx7iIzJuKvb/1jlZIZEIh9DzgLx3vaE5Sre
   gZvESDqGt0/mUK57H+rEqxBFJpR3vbVfimV0Oze3PaTOnx/xTwmJyC0F1
   gE+tTlpI3h+2t1+fYXn4Fn11rsECqB3tgCmUfaeUgussXjdm/0WNllseh
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66779606
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IlpOPquEphNhWJe6wAtFFCJSQufnVH1eMUV32f8akzHdYApBsoF/q
 tZmKWzTbvrYM2fyetl2PYTkpEkCuJSBndZnHQdk/ys1EiIX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX4
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8qZ5aWksZMWCN2DhhMYrFj9+eeM0Cw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ZVGOGQ3MnwsZTUeJmsTEZkSndyzxVf/SBFCiw2b/bEotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qer4zOpxHjMhI7MFYwOjMhQlNc8eHs9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AUH83oJrW3FF5ufkWd4um0WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5CaCNNoMXMsEqJWdrGR2CgmbKggjQfLUEy/lja
 f93j+7yZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmOJ/IdM5x/oJ/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:yfLtbKqZxsmqJZEn32KMtE8aV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66779606"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhkQxfNBtH3yKhVDFrxp+H0z98Lbw4VGswbakn9ocBkpQHUpdwueehckbcJ4rOenE1OecKQiOTz/KzF1vrqVJqlbqYZUlTb1DPznS4DYwacFg0bl/IobR0/aGLCggKhMCKPa+PQ56C6QEQadrwybvonqZ6u/9HAoBGu8GQZIZHes9lO6lVDiiC7VW2DSssgjDwnhu0b4mm2sj1QEPlRTvYqjO+8eRqohk+j8tKKE0YC94WM5TafWmA6nMWoOE6Sk5NJFhOnPTA85QO5gb+FKoSygfU01MVgJEzB65/1cPKvKPEc6tzPSEljvJT74o2qNLeNEaLPSb20C2S7oBPQkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyooVaNQncRIsW/50+tBknBTWUcjROFecYOeIpUgxG0=;
 b=bD27jpWB86Io/VYAUJgr9BdL1xDfKrQtZ85PU9aiI/GqJKJnZuaI/HK1+bzwKak4s6s8JWizh6jd216wLbsR314To5tc6tqBjJKwlinuFJE5VrTQpLwzEOoGYs1Q4zlGp4JK943v5MdKuIw8SrNxHh5QWfi4iOIuzWl57s0nVAphI6t3pZ5MGXgdlc12c5bdC9YpC72pz+yccWKLxNp4zzQOdpWR8euj3s0fhVYr2YAyOUoIyy03fjz6iuFlymn0vLM6/9rj9mwFMMXmocXyCXlv4KmROeHNSnhMV41d+71Y62mwtXn8GeWQxM7GbQTt9hsESRNgw+Cs0Y8InrJ2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyooVaNQncRIsW/50+tBknBTWUcjROFecYOeIpUgxG0=;
 b=l8cNkJ/AQ4KonECAsd/orgzA0SdYQZLSOzzj7Md3qoSNpwYjpi1rixOhg0GrpgXQPS+VTS0gYIJWccFRUKfji0SMODMlb0fqmg6Tzq0d0aDPqqjx+6TkWBS3mkfMH0MQYpOo6MCw4KisNLR6HgLLezO1zqIJRWQa2fMbqlJD/2k=
Date: Mon, 21 Mar 2022 16:04:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] CI: Don't run Coverity on forks
Message-ID: <YjiUDyTDuq5KQT3W@Air-de-Roger>
References: <20220321135828.3158-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135828.3158-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd46d03-93c5-488a-5b77-08da0b4c2778
X-MS-TrafficTypeDiagnostic: DS7PR03MB5495:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB549556C3E89073820E8E9D908F169@DS7PR03MB5495.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+k8guYrPZ7dtwjC1PgdH7kZTzyJPbTDPD1Noko6RefcSOPU9V/HeBIEotfkegaSYD7vBn0k6bfPA/XnNRjTgjJwjDOoaRfEiXr1ugBeIsPnXEGswYsvuBEs787AUkksyER3ePwYt3+yuSyLXHASYpSqv/mtYUEk3ktCSpojzTqLmp6mDsmn5ZuoXm2VkvyAdiUJr1FoUyFdIt/m8TOrr3pYEm1P7AAiwlA0C79iSKmQSR0/tPeqa6mTrKG3JS9FzR+WvL0Ydu7LAs1UnDiczBXtmCZnjw92xcokV7J9iAvL4YMqJ+SBYZAqZ6ebMBtmPQad0FiA5yN4mBGi1xuXgV7RU1fwXhMP4EJXu6OJvPjvHm6Yz8nv4YTDRHGBd7sfYDhfjXME+O/GaNIywKlu9nXlQUA2H3DKnM+LzWkfWkA+wxTSlxmq6Rlfn+Bpmt4XPGd464vzJi3RtaL0u5Ssfdu1KEvFQKLZkjK7N1anSklOqL6Ud75NAsv2ST/2pJBKEY8cJfhY/WsZzjaJHbcW391uc3gTIYBAe385yONeq1FfVZiyZSj+d2TTAJcqpQVPEVtHJ1fhcUkTKoknomU33LeiwXaqWwimkYfR0fmTaljFEq6VBNpbWOLlvhxQkBTPcgDJatqttyekgmLl/tviSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(66946007)(508600001)(6512007)(9686003)(8676002)(4326008)(6862004)(82960400001)(66476007)(66556008)(86362001)(26005)(186003)(8936002)(33716001)(6506007)(5660300002)(6666004)(6636002)(85182001)(316002)(6486002)(38100700002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjI0ZzRhQVdtUUdvV2VtbTlESXovTE54K09WaFBIbEtPeVY2OGhlR1dkdmxk?=
 =?utf-8?B?RFUwajNMUUF1czQzOWEza2p4ZzFZSVQrT1pObStxN1k3czF1YkN6SmxoVFln?=
 =?utf-8?B?cDAwUVdlUUtJbWVjRm1IS0k1d1l5SlcreTdDUGJMMHk3ZHppemRsOHhicGxp?=
 =?utf-8?B?KzErQ1dFWVhSV2FlbjlaOFoxdWVvUzZPcnh6V0Mzdzc3akNhUDFMbkI2SFh4?=
 =?utf-8?B?QzBIdDRFOXNtb1d2emhkVzRNOWtxUThnL2xSd0Y5eng2aDcrUS82djl6bGhJ?=
 =?utf-8?B?aDFIRGdSa3VHK2NGVHZvT0h6b3JzcSt4TkJaMzN4LzJ6cDhZV1ZIWjc1bmV5?=
 =?utf-8?B?bllkRVJob1ZPMGJQZ01KYVFjZHNFSkNIUE9YQnhPQUh1aC9WTFJ5REJudEhB?=
 =?utf-8?B?cHJlZHpkMm1WRjUwQ2x0SWxxN1ZTQlNVbG96dEZHOHMvUEFRMnZsalhLN3p5?=
 =?utf-8?B?Sm00QjhHNVhWWWNBcmhHcno5azF3R09EQTZ6T0gyS2R1cWhiZlJqanBwUlFY?=
 =?utf-8?B?VS9vTGltejcweXFHZHcrU2x6MXNnMCtWUDhkR2w0NTljQWdjWHMxMUNOTjZS?=
 =?utf-8?B?WlRMN2NhZE9tWEpzajkyS3RGR3RjL3UrZUhLL1hSWGFZSU5rNHd1RXFjQmZT?=
 =?utf-8?B?SzY3cFNmWWZlRWJHQVJyM3FFVG80U0s4RXhmTm9XdTVwNXVYNVZtcXI1NkIv?=
 =?utf-8?B?QkpaenpQQ1hRM2VDYWRsbmJ0MFhNV0JEOGdxTGR5cjQwbjYwOGFjYXIyQVdG?=
 =?utf-8?B?U2ZvU0ZqZnNudlJ0Q3BIci9PKzE5TVR6bm9jRWNGUGZxMHh3MVRRL0dVaUNZ?=
 =?utf-8?B?dXJJMUFwWE5TaXMwVEFSL1VEMjMyNzk0YXVqbDcxdG91OGJGNmMycXpucldW?=
 =?utf-8?B?V3NDSHRqeFA5WHlzY29xenMrRlppQWtIaU5QaStxNzVDNjN6T091YThPa21l?=
 =?utf-8?B?dTczYWF3KzlwZ25hODAva3pldHAxWmxKRUVmVFllRkVpY20rbzlDRitWOWdW?=
 =?utf-8?B?VHpoSjhNeTRTL29ES0wybFV3RHNxTmxwVmZYODI3NlJDN1FmQWFzOTRWZEIy?=
 =?utf-8?B?U213STJmcGVSSHkzc1NJK055MTVTMUVsUVQ4SDE1SnYyV3dxamFYSzlPSUsy?=
 =?utf-8?B?NTFsR1VRUlFKS1dBV2JqQTJKWnlSb2dYOEF4TnJoU1ZqeDVBRStXSE5oUE5y?=
 =?utf-8?B?ZkNhaGRBRE5tTkpwN1NOQ2hIZUFTYXBYV2w0aEd1M2ZwNFFDQy9EY2dBbHls?=
 =?utf-8?B?STl6bFZPVzBLR3ZJeXJtNDhSWTNMejJ6VmhUSWJ0RGVwVnV3R1hpMDYwclNG?=
 =?utf-8?B?SWN4Yy8rbmsreGZCK3Noekw3Nk9Kem1UZldqdVFQVW9oalU2NHF6Um1lcEhZ?=
 =?utf-8?B?akZYZHFIdlByOHgvekJyc0ZLYlhlcVhnemVTVG1WTDRrclZWWVJBV2syTjRj?=
 =?utf-8?B?ZDlPVjdzRFF4SGhXZzJjTGRsRnFPcEpoTjJRclVEVVNLZk50aHJ2eXY2dC9h?=
 =?utf-8?B?N3pzbUFDY2lpNE9aWVdlbHZia3ZZM2ZaVGh6MGJhSnU1NDFFb3Z3dFpwbEI0?=
 =?utf-8?B?OU5Ya2dFbXdJejhFWnBBaFJJcVZNU3lyQ1o0V0JtbGJ5Q0FSdEE2WEJBNGdQ?=
 =?utf-8?B?VXZObkR3dG91MTU0eXJBLzUyeE9qeUdEMGpXUGpEVm8wWUVad1R5Um5KUm9K?=
 =?utf-8?B?dUw2aUlEYjBudG5XY1NuVmxZMlhCUDRFbmRLc2FZYmNEbXg1M2daYUtYY1A5?=
 =?utf-8?B?UjkyWStmdHk4QXIvSWd0bXNCL0F4OUgwb2VtbkQvcXkwaTBvUXZGaEdyaWFD?=
 =?utf-8?B?K3BLVys3TnlEMVNnQkVidWxoaGlKR2lLUmYrNGFFWU9PR21ZN0pZK1NFOUYw?=
 =?utf-8?B?NTRZSEFacElmNTZoYllMeUNEaTd3ZHQxNDBOeEFwVzB5aTNDV1VBZk5DWkls?=
 =?utf-8?Q?y/y+qHKGzXyixtHBLnFdPi6y0B/JolTM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd46d03-93c5-488a-5b77-08da0b4c2778
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:04:53.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk6NJ1lUVetLAk1lDRJKa9WJNJ9wB3CPHTnC2QikcN2+aW+ugBHvQqi2ULVpTopdkYirtZz+KZR08euGK3uFTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5495
X-OriginatorOrg: citrix.com

On Mon, Mar 21, 2022 at 01:58:28PM +0000, Andrew Cooper wrote:
> By default, workflows run in all forks, but the Coverity token is specific to
> us, causing all other runs to fail.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I have a suggestion to make this more useful I think

> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  .github/workflows/coverity.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> index 427fb86f947f..f613f9ed3652 100644
> --- a/.github/workflows/coverity.yml
> +++ b/.github/workflows/coverity.yml
> @@ -8,6 +8,7 @@ on:
>  
>  jobs:
>    coverity:
> +    if: github.repository_owner == 'xen-project'

Since I don't know anything else similar, why not make this a secret,
ie: ${{ secrets.RUN_COVERITY_SCAN }}? So that people could decide to
enable coverity on their own repos if desired.

We would also need to introduce a ${{ secrets.COVERITY_SCAN_PROJECT }}

To allow setting a different project name.

Thanks, Roger.

