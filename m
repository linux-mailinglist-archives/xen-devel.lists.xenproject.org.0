Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D644E9D0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 16:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225295.389067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlYIQ-0004u4-V4; Fri, 12 Nov 2021 15:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225295.389067; Fri, 12 Nov 2021 15:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlYIQ-0004rZ-Qk; Fri, 12 Nov 2021 15:16:54 +0000
Received: by outflank-mailman (input) for mailman id 225295;
 Fri, 12 Nov 2021 15:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlYIO-0004rL-Ov
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 15:16:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed71183-43cb-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 16:16:50 +0100 (CET)
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
X-Inumbo-ID: 8ed71183-43cb-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636730211;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K+rcA92mPxmJaCyFWf1uSmkFkrYiXYUcVAUPumbLfX0=;
  b=HMv+n7rLocZbp2zydsHlF3RkNQWnYJgA5vSDsr4LwDLtk3nwa9wJY3JG
   /0LVAQlsd0sCsrDXVxtBqbVMpRgi9J4XIkqnhEenfVBL6ZedU48uDimX2
   uMMXWFPQ5QuLZ84aYO8lomhZ6knQeJ9VIivIjOA9DK468EHTgcUDbnCVi
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Bn7dxd84E29Wb2QmdYIiBsDI3KnGvRF2jjOU7ynaP158AR1dvURDy/NvSmkIew78YdVZmMlrNL
 dAETN95uus/MHvNy1YeEPHx91gildvqB3QMg5ZVFbpqjxxDImkR+3CQeOrZM6r4IzgiIwq4Y6W
 qt9CNb5WuwFjA9Y0+qMgQ+hsvAnjRFUN2Zh/qExYqXnr+PqCmNuPGxeG/+Swh0osHOHENWPwuH
 D1r0I29aIAQLWVcTiScE1WVmZLiFGC3iDAx6n4oVzyuEmGEKQKSltRNxidmsMhtmNE/qSkoUOq
 0rJ7P0GoiCYw/iAswHVctfpE
X-SBRS: 5.1
X-MesageID: 57221454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZqR8RaIZqbyw8NYuFE+RD5IlxSXFcZb7ZxGr2PjKsXjdYENS1GcGn
 WofWTuEb/jZYWanLt4nbo3i9hgEv8Tdy4diTAJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2jxPBV8
 /JHvKePCgIPFYvjndYgVwhhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuoUChWtt2qiiG97Be
 JdFR2I/NSjlRCxuMFdNE49kkd+B0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcRKnG6Iq
 2Te5WP7DxoGctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWS+16ghTkWUuFvUOgcwyeiz5jp5xegUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb10qXFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr5sWuVh6b/PuREDGQ3C94ace51qXHb7
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSX9I90OumoldRozWirhRdMPS
 BWO0e+2zMUDVEZGkIctO97hYyjU5fSI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5fQlkgEDrShOnK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:L6VLu6DFuUlzVT/lHegwsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L5259T5cRzp/ktHNRA7dc6MLmK41P2MGbx2UKpUB/a/fI8SjjwQ6Ce2sRD2AjtQu1Q8KcP
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57221454"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no+K2o0xl9KTy7FGeJ6yd5P/mdD8GrIWfxkAytrQzHtM5bR6jnjjFoo4eBpsMgdIpS31QlH7MOA3Mnla7fWhpQqM1x2lbb90S8csNFgAiGfUv7dVGHG6uXLqqpmsKzZHM2y2Qqixq6L9fYPs67g/9ZoCFz2GXhvgMt41jZF27oaAmx+6ddi0q9tkb42nJL85LMSfjLw4daIAFDZg4LBWWOkowfMKcQE97AdfTH/GsmttLsJSW0DzusgY6bboJHxajIE5kVyvjYaoW45oV85gnWmrC6/72BPbcgSyy+dMYsDF49VodEYueYzYwl1cBRy0IjM3yu5wvnLuNdoD2UVIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01TsVJttcEE28fZMFYHSqXA/Q7x5Gh7HZbQvT6tp0EE=;
 b=miELO1fy66rF1RIjaG61Fxvk9AqgNElq6/QG/f9J/1QlqfMGp5cyZGIB1OCwrbF++hTTGpeyt4usTxH7gz+Hqm3Y3SsqNj34ZqbHBkchyn+G1LvYvLxaYfQ4VFVguAMlnpbTXdsQ15NinbR7aX2FjmooFmc4SsJCqSJWmpUGGzjJMg8ggdluUjzndu2R4LhqECRz9CvvEhpvj91O9zfaYm0Jnyb0Ao0pjCVRF1org2wfFrbpYJv3dkmI58S5ZkyIj/2nHBft9ha9MkKRd9e64IQtaGEoL5qCFzfnYUPQYJxWmRgZwMhMu1B9wjkb53gnr6vmu4gPCDW20drcHvJ7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01TsVJttcEE28fZMFYHSqXA/Q7x5Gh7HZbQvT6tp0EE=;
 b=cMyt1+vNLa7jsw9UqITFsa9eTHRj3zt6J9uNMaXBB878+776vjIhCZ/kZt9hefN/CsIosJfcgrkoN45qIIZ4J0iUPnIKqRylgapHH1c3TSMy5jKFG49WKNgNyyf2D6jzAlAuVvQddj0+UlOlFRPCFLw5lr/i/REZ5RvUynnNyyo=
Date: Fri, 12 Nov 2021 16:16:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16 v2] tests/resource: Extend to check that the
 grant frames are mapped correctly
Message-ID: <YY6FVaA63qwrnj0Y@Air-de-Roger>
References: <20211112144821.987-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211112144821.987-1-jane.malalane@citrix.com>
X-ClientProxiedBy: MR2P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26da6eae-8239-436d-ee50-08d9a5ef6f11
X-MS-TrafficTypeDiagnostic: DM5PR03MB2844:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2844373B96B57ADBFF5B2BF18F959@DM5PR03MB2844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEO1Uool/X24L1RyiRfrBZgYkxWNMbQmn7MWXf+XSbK/AOOcD708gPBqXG6TaDtwfV3ZCJRi1Pb26QLfFLJ35GSDByBReKOvzYHyXVuYlHOrl8mwh0+TuekLMC5MGtEMM2oikBcElQZ9BGSIiCKyAGN+9TBK3X9wPl2r+8UtwGolnX2BKaBURXVlghkTql8sFjFCN9wml1RUYit4KxgBHlzkvUAUSJ1B5XbKp536SRZEGZuGYhQqEa+OSpXMxEBksBM2sH+8VRrVHd/nVgvrn14/4IyHvcMSpXc1IaFKui9Azl/wup0Y5qP3tJTXotWJM2AaHKjTMrKhLXXXbhQguU1C9Xwbx7QcxGXOCTokAK9Z3YyVdQUMdbn2NdK8BK0TDJ8oRd0hFbnT1KLsrHujqcxHYUYqyIeg76Da8ESdciXv7m+IXvBcvkyGHcU1BxWS2tByrSWL/lSbaTQChrWJ0tACEGwK67RLcMWjeBOBHD1TRqPjwgf8pa14xjRiFnoYBdTQ/KGM4EodVzd6FvQ2iW0cD1dFH6Gy3K3BUbSCSTnaN5P8rBOKU6v/KZfctgpia9LMuGs7LZIKVljVzTsPA6f2QZkKWC80cX1YYKXra+04lZ7+CK9Iik0zQtU/UaKQDucvb5wQOOeSCfkSUULtnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(2906002)(5660300002)(26005)(4326008)(508600001)(85182001)(6636002)(33716001)(186003)(6666004)(54906003)(66946007)(6486002)(66556008)(316002)(956004)(83380400001)(6496006)(8936002)(9686003)(8676002)(38100700002)(82960400001)(6862004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVcrcVVNcmlwRjFSYTh5R3NmMUVUOUhHaUhvejEwRFNlNHRES2t2QUVJa0VN?=
 =?utf-8?B?bWhGL2w0ek1jdnE1YlR0QTBsR3BiYXh5Qm1LVkk0NERLY1plSXVBTzdqcDhi?=
 =?utf-8?B?czlTTjV2OWZhNXl5V0EvQUZ4TXgrcjE2NDRXaCsrek0vS3NwM3crQSt5RnRh?=
 =?utf-8?B?U3AycUE1OGd2dzlOY09QMWVjbk1pemg2R0RCR1c2aGJVK2ZVOXh5cHB5WUlm?=
 =?utf-8?B?TXFCQlVEYURJSUpvRS9TRXVKVHhab3VLd0prQ2hTWmJ1QXBLYjRhWTUwbk8v?=
 =?utf-8?B?YS9VYXArN2REWSszMmlIcklNTnM5dE40b3hkbVFRZFg1NzUvTWRnUDVIOWpG?=
 =?utf-8?B?aWlwZU5PbGF0SEgvWktEWkIxUzhBNkpRTFg3SUh1eDE2bmlDejdXcER2WDF2?=
 =?utf-8?B?a3h2L3pxOWxPWEhCaHBMN3dsMWI1T2tBN1RFZ0VCYlVUUnN2L0RxOXR0bEwy?=
 =?utf-8?B?RHNFZHJvNVNLQS9vTUNWT2hidzhGTTFDdmliV1pOOG1QajRVVExoRkpVaFl4?=
 =?utf-8?B?K0IwYTVHaFF5Z242QmlZdHRKdG9yTGlMamNtR1VTdTM0dkRtRlc2QmtYdjMv?=
 =?utf-8?B?NGt1T2gyOEJHWWc5a0YzMitmZ2dGVVR0OWFyV2dob0lZaklRa0E1ZEovN1c3?=
 =?utf-8?B?TXZiZU1oSFJYUWZIUUpic0FDSDNjS3lRRTI1bVoxU1pxVytPZkZuTnA3Q1dn?=
 =?utf-8?B?NVVLK1lvWDJsU3dNc2g4UzRxNGM4SjVjdDkzVEIra0s0USsweGNwUkxORHIw?=
 =?utf-8?B?cEJpL0pLNERDRmZtYkR6SXkxRlZyamo5ZVE5NGZ4SzlPSHBUeTFsL2o3L0x5?=
 =?utf-8?B?cEIxb21kbnlkdkhJZldXZEp4ZUN6TEZNcDZQK1VYMTkxcDRGVGJtSks3SUE4?=
 =?utf-8?B?R0MyTVJtYzUvcWVrSkM3Sm1ONFFGaFhkbWs0bzdZUTRGa3Y3cWlqZUYzVGww?=
 =?utf-8?B?bUpuY0tsem5GcWVBNWM0eE1yVDFkY1hlcnVZb0tPYVRHcjcwMDhPclA1N2ht?=
 =?utf-8?B?WVgzbzZJQkZpUUM4WFFuQ1dmbWdzZk9CWWxTd29xZG5uSEVDaWpvNnpQY3hP?=
 =?utf-8?B?WG5TZ3BJZnpyRlFDdGNtaHZ4UGdwS25zZU03Qm1abkY5d1dCN1FmcWF0MTdt?=
 =?utf-8?B?dmF0ZU54NjR6Ui9XalR0NlZMbTZqTDlYUkRQV1k0NnhIbWc5VlBmdnRuQ29U?=
 =?utf-8?B?U0JxS1pvRnUxTjllYXZTSFkwS3pWOUgzSjhYbmplaEkyT0cxWVp1d3pUaFQy?=
 =?utf-8?B?MHJCSytydDNrQmF2YW9FYWMyYXhuZjh5b1lVTkM1TW9LOWp6S3E1djBDTkMx?=
 =?utf-8?B?NjFIa0l5RGJmODJOQ083MmJZMEtIZ3VqMHFkbmRaSzJzY3lZaGtCT2YxT21t?=
 =?utf-8?B?YnRMZkMyNEtCUzBHcnpqOW9rbG90THZkbDAzQ2ZGM3BLNVNsSjhEQ1plM0hI?=
 =?utf-8?B?WVdnZGs2MFlrQTBVYzFSZEhHY1piL0QzQUx5dTQrWUlqVmR3eFVmbTREMUUy?=
 =?utf-8?B?aEk1VGhkVG13RW1wNVN5ODdmRlZUVEYyRTRJdXdmZHBZVEUxR3hyOFdrRzU2?=
 =?utf-8?B?WERzOHBoZkpQc01BUWJzRW1OUWFqaXhKQ0N4NDMwMUpGdC9RUUdBTUdpYjRQ?=
 =?utf-8?B?eGVDYVE0K3Y5RE9oMWRUUU1sSkk3OXNYOVdLQlBxNzhPNTJVd2YyaEdsSUVk?=
 =?utf-8?B?bkxzdXZJNVlzTE92UVk4cnRHYzA4YVBMOVB0VjI0ZENKeFZ6V2h3WTVSQU1J?=
 =?utf-8?B?NXlDUXdEdjNBRGxjL0xRUytDQ3dQenU2S2FNeWhnV0wvZXB6N05Ed1ltQTBF?=
 =?utf-8?B?dlZNYWttUVZ6cXZuclZXOEc3cnZFVnNjcWdjN0Z4OEthMkRLWUlmQVBoYXRX?=
 =?utf-8?B?aDF0dHVneWc1RHZ5Zk4vcDdicFpoRHNvS1JiclFsSm10dDdZT2drTDNDK3Zs?=
 =?utf-8?B?S2c1SHc2UGhyaTVRWjFLUVdnRm5xZWc3QmZXZTh0VEhDUXlWdjZhNis1R3BL?=
 =?utf-8?B?c0VJWXNxVCtNNFNsbjgrVEphREpvWHVybUg5d1BHRTNWVUUvREpNM0RWK0JF?=
 =?utf-8?B?NjYzSE9lU1E4M3hKSDNGS3lnR2lnZGJNWHp0YUpvR3Rrakk5OWkxYkhSOEd4?=
 =?utf-8?B?OXpvVVR6RFZ6ck00MnJXU1R4UWV5dXJDUkh3R3VLbm1UZVVPWktJTThDNzl5?=
 =?utf-8?Q?W9UuB8wJ7ZjoQUd299viskk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26da6eae-8239-436d-ee50-08d9a5ef6f11
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 15:16:42.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qEjU355pgKlqQzFnv0NsCwLeVxFPIFUtotWJ5tydAsu6YNkjP1RiwAR3UwJXJCFYEcFyF74xKpObC2awQqq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2844
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 02:48:21PM +0000, Jane Malalane wrote:
> Previously, we checked that we could map 40 pages with nothing
> complaining. Now we're adding extra logic to check that those 40
> frames are "correct".
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

There are a couple of lines that exceed the 80 column limit that we
have for other pieces of code, not sure if there's some kind of
exception for tests. If so it might be easy to either resend or fix at
commit.

> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v2:
>  * Cast the gnttab pointer to the correct type (void **)
>  * Fixed comment style
> ---
>  tools/tests/resource/Makefile        |  2 +
>  tools/tests/resource/test-resource.c | 82 +++++++++++++++++++++++++++++++++---
>  2 files changed, 78 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
> index 1c3aee4ff7..b3cd70c06d 100644
> --- a/tools/tests/resource/Makefile
> +++ b/tools/tests/resource/Makefile
> @@ -31,10 +31,12 @@ CFLAGS += -Werror
>  CFLAGS += $(CFLAGS_xeninclude)
>  CFLAGS += $(CFLAGS_libxenctrl)
>  CFLAGS += $(CFLAGS_libxenforeginmemory)
> +CFLAGS += $(CFLAGS_libxengnttab)
>  CFLAGS += $(APPEND_CFLAGS)
>  
>  LDFLAGS += $(LDLIBS_libxenctrl)
>  LDFLAGS += $(LDLIBS_libxenforeignmemory)
> +LDFLAGS += $(LDLIBS_libxengnttab)
>  LDFLAGS += $(APPEND_LDFLAGS)
>  
>  %.o: Makefile
> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
> index 1caaa60e62..286d338c1f 100644
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -6,6 +6,7 @@
>  
>  #include <xenctrl.h>
>  #include <xenforeignmemory.h>
> +#include <xengnttab.h>
>  #include <xen-tools/libs.h>
>  
>  static unsigned int nr_failures;
> @@ -17,13 +18,16 @@ static unsigned int nr_failures;
>  
>  static xc_interface *xch;
>  static xenforeignmemory_handle *fh;
> +static xengnttab_handle *gh;
>  
> -static void test_gnttab(uint32_t domid, unsigned int nr_frames)
> +static void test_gnttab(uint32_t domid, unsigned int nr_frames, unsigned long gfn)

Nit: i think this line exceeds the 80 column limit.

>  {
>      xenforeignmemory_resource_handle *res;
> -    void *addr = NULL;
> +    grant_entry_v1_t *gnttab;
>      size_t size;
>      int rc;
> +    uint32_t refs[nr_frames], domids[nr_frames];
> +    void *grants;
>  
>      printf("  Test grant table\n");
>  
> @@ -51,18 +55,53 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames)
>      res = xenforeignmemory_map_resource(
>          fh, domid, XENMEM_resource_grant_table,
>          XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
> -        &addr, PROT_READ | PROT_WRITE, 0);
> +        (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
>  
>      /*
>       * Failure here with E2BIG indicates Xen is missing the bugfix to map
>       * resources larger than 32 frames.
>       */
>      if ( !res )
> -        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
> +        return fail("    Fail: Map grant table %d - %s\n", errno, strerror(errno));

Likewise.

>  
> +    /* Put each gref at a unique offset in its frame. */
> +    for ( unsigned int i = 0; i < nr_frames; i++ )
> +    {
> +        unsigned int gref = i * (XC_PAGE_SIZE / sizeof(*gnttab)) + i;
> +
> +        refs[i] = gref;
> +        domids[i] = domid;
> +
> +        gnttab[gref].domid = 0;
> +        gnttab[gref].frame = gfn;
> +        gnttab[gref].flags = GTF_permit_access;
> +    }
> +
> +    /* Map grants. */
> +    grants = xengnttab_map_grant_refs(gh, nr_frames, domids, refs, PROT_READ | PROT_WRITE);

Here.

> +
> +    /*
> +     * Failure here indicates either that the frames were not mapped
> +     * in the correct order or xenforeignmemory_map_resource() didn't
> +     * give us the frames we asked for to begin with.
> +     */
> +    if ( grants == NULL )
> +    {
> +        fail("    Fail: Map grants %d - %s\n", errno, strerror(errno));
> +        goto out;
> +    }
> +
> +    /* Unmap grants. */
> +    rc = xengnttab_unmap(gh, grants, nr_frames);
> +
> +    if ( rc )
> +        fail("    Fail: Unmap grants %d - %s\n", errno, strerror(errno));
> +
> +    /* Unmap grant table. */
> + out:
>      rc = xenforeignmemory_unmap_resource(fh, res);
>      if ( rc )
> -        return fail("    Fail: Unmap %d - %s\n", errno, strerror(errno));
> +        return fail("    Fail: Unmap grant table %d - %s\n", errno, strerror(errno));

Here.

>  }
>  
>  static void test_domain_configurations(void)
> @@ -107,6 +146,7 @@ static void test_domain_configurations(void)
>          struct test *t = &tests[i];
>          uint32_t domid = 0;
>          int rc;
> +        xen_pfn_t ram[1] = { 0 };
>  
>          printf("Test %s\n", t->name);
>  
> @@ -123,8 +163,25 @@ static void test_domain_configurations(void)
>  
>          printf("  Created d%u\n", domid);
>  
> -        test_gnttab(domid, t->create.max_grant_frames);
> +        rc = xc_domain_setmaxmem(xch, domid, -1);
> +        if ( rc )
> +        {
> +            fail("  Failed to set max memory for domain: %d - %s\n",
> +                 errno, strerror(errno));
> +            goto test_done;
> +        }
> +
> +        rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(ram), 0, 0, ram);

And here also.

Thanks, Roger.

