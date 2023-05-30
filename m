Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2094716892
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541267.843844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41oe-0002H6-2n; Tue, 30 May 2023 16:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541267.843844; Tue, 30 May 2023 16:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41od-0002Dk-VQ; Tue, 30 May 2023 16:03:19 +0000
Received: by outflank-mailman (input) for mailman id 541267;
 Tue, 30 May 2023 16:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q41oc-0002Dc-3C
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:03:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a77c5a0-ff03-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 18:03:14 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 12:02:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB6177.namprd03.prod.outlook.com (2603:10b6:610:d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 16:02:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 16:02:38 +0000
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
X-Inumbo-ID: 7a77c5a0-ff03-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685462595;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fbVvUVv+glAsGDAlBtFHs0Kx122DbabYJS0qGvBtkC4=;
  b=Mrfi/EG/ug9FfRd1TydLmwnv/unnzBTz0QhnEv2KORG+NwemJyDqmRWU
   sC6mCMEh1zv4xXQvt4vMZQSOr46/AAoJlOTtKSa7eQ5AKsRJGrOf1DeL1
   DZncDflc18lE0YztfBG7r/O/kGGOV89cFrl2fbHHog24bLlOIkVYqQ5te
   Q=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 110280007
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mJyIDqgx1eNbPbsVdqf+B+0AX161RxEKZh0ujC45NGQN5FlHY01je
 htvXD2APK2NZGL1f9kjb96+90IOscSEydFiSQFlqC8zHysb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQyIggzUhK8tdmE3euRYc5UpeEJcpPkadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqjAtJKTOXnnhJsqES3lzA+M0IMbAuEvMnnoXewAN1WJ
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:Tur6P6DVEj7bCJjlHejLsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xir7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjesdMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCV2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJu3cw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2NfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOhNSS35uwJzvnxehT+Ydy0ofsuoqSR+4eMC4YDCBfzCGzHyKCb0rEi6s6yYY
 fHBHsZOY6lEYLUI/c44+TPYegtFZAgarxlhj8aYSP4niuZEPydisXrNNDuGZHKLREIHkvCP1
 prZkmAGCwH1DHmZkPF
X-Talos-CUID: 9a23:f2dEwW/emG8kv0pUwhiVv2QeIv4ZcELv90XNemWTLl5KbZfLE1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AE1c9AA0u1tv+K98dcGAf4rx/lTUj+oD/VG02zo8?=
 =?us-ascii?q?/6/aZBXJbAjnGgz24a9py?=
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110280007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0dhQ0m3s/p9KQXUXm5ATNJm5MKmjerCOQR1IAhjH35xhShXh0IUFcAVyCWG+VHcqqnuQHQ1pWhDF1h2l+0BJc7pSKgPrWQJ2GSdUcqkXxOw/cyRRghFJeFliGBkIXNZkSODgSsMw5LGVkmhWXIPuuaS7sb4Qm4n3lTzz3SUHJG0NeFXit9Kdl8xI2ZpdP3W6j22T1PeMlsECFhlLmJUzhZQY0VqIZkriLCaclHug1uuF5kVoEmufZhjMcXvgjLq/4zpvDPeD8W63u8Dosfghv4Vq0mzTp2WYbDSofPYeednBuVQUK2yfNb5bNnaGvAu6yZsL+T4JhIgM+46RgBZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5FQ48H7EQIx0ABbcT6jnLYZJJE6K+e9IallZtFqnLk=;
 b=T7QMuOehAriZFRJYfSbD2eHh/t2miGlsAiw02pPQWMAhFI7oGFiOUiMLWP0Z4F6q1YwQczVcQoCM8CSOBdZaR87fcic4KDQXI+3tc42bJS8xMKjeqtbVanCPlqCuE9aeCmM+oK+c3BL+q8M8qVuo0M0bOQNCV+XCUPnV158YYidq/FNYV6P35wHRQVdZQe2L+EKfbUeJQsmdJUdlnEigiNjjjN7qVTanunuiBGh5ULqD6hqOw8x0av3GLJgxVZHwEVG5SneGCJ4X3rIQD+Lz7a0ts6Ge8vGRye/dKnmhjadgcVH0Sjkklj1k7754VjOj68QrfpVj2+PVCY9OI6dbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5FQ48H7EQIx0ABbcT6jnLYZJJE6K+e9IallZtFqnLk=;
 b=P5T2jtoU2Lq7URYyRBdJkS7zNkZWEOjWWr0UoRLV0R0KD/cm6jy5GjW0xPyxsrSwPrIE9Wo0xh+W8JXooEiDj3WNwcOnmrOwmfLTdcSS+3pnWE/ouKGIO8tw4a1PaxKGQJ80dNzZfnUR5axWG/FqQLEMxqQwbCbjEVB3EX3SJQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 18:02:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] multiboot2: parse console= and vga= options when
 setting GOP mode
Message-ID: <ZHYeGOFpAtLnoQf2@Air-de-Roger>
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-3-roger.pau@citrix.com>
 <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
X-ClientProxiedBy: LNXP265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::26) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: aba8b923-b9eb-4f56-16a4-08db61274a08
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFbTzb+h5pjnZo1iRkAlKZW/zK3VWd4ZCfj/AbndBAb6VlABs+Lu1kaAQ4cacgP09DR6LvIaefh6zOsJS9VXr4jqDmt3X4RlrLxWMVGef8jlW3B+HdUt/njRWt7IKeEAUnKSnkHJWacYCKpc0Oflzv5kpf9mW07dzwDt2hMBGFsh9eqWnNCdSLT0oNkO3t09wznpBMn9AMQKH+xyX0haOyJVGS2YW0X6yhFPaQOQewGOL5ji1WsEa5lVE4xOydRyiUvfFW/BWJdOZLB9bjP2YxZV+KVTZOTMxQj04p1YU++BbP9Ew8W9kAo5Bp6bqiHRMR8QT+an1pPXNqLP5L3rOQ+QuhKmmsOMIDw7tvv3h5AV3iGESyetOGgkmoFJ8trGUYRRdFoFW9MHuBN9ji4aGjrX+mI6C2hVlUEEzkXGYNNRuawaOrvFWVgq0nmutQVMKgaXc88jZe5CS3UMTYNfU6YDqEHsFJHVh/+IfMzRCdn5AQCk2Y0VGFydGkrqmTF0EMUiX1fuwghtJNckJpiumQF28Bm3BLhOzR05d8semIU0+pOVyyhWr9ZbLiRPcwmq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(4326008)(6916009)(66946007)(66556008)(66476007)(5660300002)(86362001)(478600001)(6486002)(41300700001)(8676002)(8936002)(54906003)(6512007)(6666004)(316002)(9686003)(6506007)(26005)(53546011)(33716001)(186003)(83380400001)(2906002)(85182001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1VGUXMvUFd2bm10bUdhWk5ESWxvbXBVa0syaHhQSFJxSXFlVElYcjlKeHl4?=
 =?utf-8?B?dW5zRVlSWVA5T2VwM0N2aXFMWmgrVVF0ei9qc3VFRVhaWTRvS1dyN1V3N1Jz?=
 =?utf-8?B?OFN1UmFOU0xwNWVWak1OUVZ0VmtvYkxLQjNXZlZ2Qi8xZGV0UUVqNm1YTStv?=
 =?utf-8?B?bGNYUmZrYW5rTkFnditDRlZac1ptRE9TZStETGhIdTNkQkIzcm8rM3BXbEYr?=
 =?utf-8?B?NGVFTnZ4Q0hKUjNjNE9XYUtkQUhtYWVJckVZc2p3UnNnTGZWOFFMcExZWW1K?=
 =?utf-8?B?bFVkbHNTMGhjSW9wNnJCVUFPNWp2b09sYU5ZVjJiUm53MlZPK2V2dWxFdXk4?=
 =?utf-8?B?dFhGY0MrTHFmSGVDNTNudGNaZFBhQkwvQVJxMGJyRWZYNWszcURycWxyVnFj?=
 =?utf-8?B?ZFNnVHNrTnhzK29BRmJONTZRNnE1MFYrMmRFSmZwQ3B6RHNWakNwZW94dUZO?=
 =?utf-8?B?RUNyVis5YzNiNHJiMG9QTnk0bVNObFU1MDNJU09lSW9vOWhqZWJSanlIUjdr?=
 =?utf-8?B?KzIwZTA2eHhHZGtiQW92QlVWcjRXOWZma21WOTdGZGY4b2RPaWxEOS9iNURW?=
 =?utf-8?B?dkVTc3JFc0o4a3hQd3F3YllvcEYzNkJOWkVsZjVsd3dDaGM1a3E3K1VRTUJ6?=
 =?utf-8?B?RTdJdjA1RFptQU04QUZqRi9FMkFsNitVbXpYa2MzMkpucjIzRkNrSzlwamwv?=
 =?utf-8?B?RWR6a08ySm5Vd05IZGlwR29nUGpkM0gxOEhGcm02Ui9rZjRmSjU0OHhmMmdH?=
 =?utf-8?B?aE9PUFNDS1VIeFhqZlJqVHBPbXh1YXQxdXpUMm5MaEx3M282a1AzUUpyM2pl?=
 =?utf-8?B?MzJWOHhMNWU1QmJ6Vlh3VUQ0VUxyNnFHNkxrODkzcHRsZ1ltOGJVN3JXRWtO?=
 =?utf-8?B?U2tiQ2FsUThBSXFZTUFXbmZrNGVFYjZVdFcyTUJjbk54M3hrL240ZlFaeGJr?=
 =?utf-8?B?aDZ2bklySGVXckpLc3N1YkIrQWVwdE1STkVtUk1wQ0JOTkszL1FlV1oxRG5s?=
 =?utf-8?B?dXZZWjBzbnJNWVJDUElFQlcvVTIrZHc1YjVhUkZ4SGJmUjljR1NjNEtWZTBs?=
 =?utf-8?B?aGd3SEhvdXh3d0QzTTk5Wm9BUVRHTUc1ZXdLVW0yN2hCYnh2M3pRc3dPa1V0?=
 =?utf-8?B?bzNlUENSOU4rZTlXd1F2ZTlVM25CUXFrNEwxZmZtRTgyUk1UTmx4eFc0QTUr?=
 =?utf-8?B?aWpwYk5WTWhqQlJSWVhTR2tMY1B3ZW5hVHRJQVRhcTFZTWtLSXBsQ2w2ckpQ?=
 =?utf-8?B?TVRrQlFhVmoxYzNaNVd5d1dkeUN4RUhoMElZTC9BTWZjMUpPMVY3WGFLYUN2?=
 =?utf-8?B?dEJSbUo5SGJDdU9DVEpWc0RrTEVoUk5Bd1RobDBsd2U5RzF1OWJra0FpOWEy?=
 =?utf-8?B?T0YvVzZpeDlocUtxYUhieXl6SDhXeWJ2RHpscDg1UWw2d3pqdzhnODE4Zzhh?=
 =?utf-8?B?ejdiMVFkYXJmWlRjcEVwWm9GalRNUUlXTG1tSkl2R0ltK01lc2VUYXJlRFJ1?=
 =?utf-8?B?ZTBlbndkRHpFaE15MS9RWW1TUUozWnp0blVzeXMrU1JUcldBNGxuaHFiLzZH?=
 =?utf-8?B?RHBtQk1HeisrYkZnR2s5Tm1rc3BkZTR0TUZLV2VoQ3J3TW8zZ3ZTZVE2MFla?=
 =?utf-8?B?Q01yTWo1YngyYkZGQ3Vldkp4YzlZcDJ5SDZYYldUUkVzRk9zSVY0NFFrWXp2?=
 =?utf-8?B?QlBjQUFYR251L09QU1J5OWM3M2F1UU5jaDlMVTBJUlQ4U0dwd1NnMExlclBx?=
 =?utf-8?B?VjVkcDRCMFRwVG9SNWJGUDR3RldYUFovamhITDFFcHRjWFdBMWZFV2UyeUha?=
 =?utf-8?B?SUZINkQ3OVZ5N2tKc0RheitiZ05iN2g1VUh3TnhuQ3Z2alEyVG1sU0xoQVdx?=
 =?utf-8?B?SUNvS0YyVWpCYzB5K2hldUV2UGtwZlNyQUwwTmIxTm5vQ0lWZ1pqZy90ei8x?=
 =?utf-8?B?TWZZNVQ0UWJIaW1kSHdDRWIvcFFyaENBUEwwRmFPcTVRT0VKNmY1NnlJT21R?=
 =?utf-8?B?WkNVQ0pXOHNLc3lpeEdUNktRbXk0NTRKdWphTFUveGRuM0FDTExOS2hSZFVF?=
 =?utf-8?B?SzF0TUNNZkIzNzlPbU9pMkJsb1N0NThtOUNkSWFqa2hJR1h1cVNsVHhmV0t6?=
 =?utf-8?B?eW1WM2plRXBLME5DOWRpK3JYVnpMUVBOR2tEOHVBa0Q4NlgxelZvQlVDZGMw?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bx52O9ej4ZUJPyn8c/N2fhe0he9QXjnGHPcQ9/Uka0Qqm3dlSrs1AnKCavGq4n1zYk6+xtka/7UBAaG1b09z3i9hc9xle02QqWJzmjutSJKYE3yqSIUVBpQtOvqlPRmucHm46EKNioVR35HSLW2/qg0Sy+SVnxLjSCxyMl3Zy9ZTX17AMosWyLuTxUKtqCttcwUzZ9jg4PmJhA+XCUU4ipekG8NChiXRm89dZtDOpUxmouhAl5wT+NSgWFnc7vOYOkYGUTc8avX6AgzKIqcUtkVPsEa+mefgxqsj9NkAA1NkPbghmri8Ss8b65dZ+ZV8v3tcRAeRaxh2ZGa3KOtpp6GFonAl7fJ4nlMOq1n74dgHLA9M+kdahbL5enf0aQ7t6h8ZUx8ufoA9rBJy37kolmzjwyzrWW4TZVgBjUqkUuPEuSS2xCJmuKFDuhmHbaaGn0zSJ5dp8zw5vaixDTGglmCJeQZ2Mxx+w5r9rMCAhgisFEpQ2n9wgzaR85auHMUSyDVltznR2hN+7FTmkbd0zlyR1jNGUJfIgteYL2P6/exWYjcbP/rjdLQCxdipuSj5KRMx3zf70XupX1aw8I9sTag/lHG+JKLItr/A/aeKxVFNJjoq7VD6RVenVvPvT9eaQmEesQ8fKcaAilR6o3m8VS67n1KK/KBhRKE0Ro/3+5a99O7z+VZ8PXYSTh4kUO5HyKgap2zJhQnhlGe54Bnvh30r8vtZxxbm6bB/V3j6r9l7rPCjmPq+KMt0DGPJXx0TWXijfRcBiHpJ9SBcomyjOEI/MIAxqmkBVga0P0rfaMk2NExEy2wyQHfMM3H07AS+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba8b923-b9eb-4f56-16a4-08db61274a08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 16:02:37.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9+rKlOdSzXX5VJgUIsWtKoh50M3JXMpfpARJc6Ii1E/W9ITwgyUdB4tAqZBON3MRePa4jxblltsi07SYgvQ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6177

On Wed, Apr 05, 2023 at 12:15:26PM +0200, Jan Beulich wrote:
> On 31.03.2023 11:59, Roger Pau Monne wrote:
> > Only set the GOP mode if vga is selected in the console option,
> 
> This particular aspect of the behavior is inconsistent with legacy
> boot behavior: There "vga=" isn't qualified by what "console=" has.

Hm, I find this very odd, why would we fiddle with the VGA (or the GOP
here) if we don't intend to use it for output?

> > otherwise just fetch the information from the current mode in order to
> > make it available to dom0.
> > 
> > Introduce support for passing the command line to the efi_multiboot2()
> > helper, and parse the console= and vga= options if present.
> > 
> > Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
> > option, and print a warning message about other options not being
> > currently implemented.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >[...] 
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >  
> >  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >  
> > -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> > +/* Return the next occurrence of opt in cmd. */
> > +static const char __init *get_option(const char *cmd, const char *opt)
> > +{
> > +    const char *s = cmd, *o = NULL;
> > +
> > +    if ( !cmd || !opt )
> 
> I can see why you need to check "cmd", but there's no need to check "opt"
> I would say.

Given this is executed without a page-fault handler in place I thought
it was best to be safe rather than sorry, and avoid any pointer
dereferences.

> > @@ -807,7 +830,60 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
> >  
> >      if ( gop )
> >      {
> > -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> > +        const char *opt = NULL, *last = cmdline;
> > +        /* Default console selection is "com1,vga". */
> > +        bool vga = true;
> > +
> > +        /* For the console option the last occurrence is the enforced one. */
> > +        while ( (last = get_option(last, "console=")) != NULL )
> > +            opt = last;
> > +
> > +        if ( opt )
> > +        {
> > +            const char *s = strstr(opt, "vga");
> > +
> > +            if ( !s || s > strpbrk(opt, " ") )
> 
> Why strpbrk() and not the simpler strchr()? Or did you mean to also look
> for tabs, but then didn't include \t here (and in get_option())? (Legacy
> boot code also takes \r and \n as separators, btw, but I'm unconvinced
> of the need.)

I was originally checking for more characters here and didn't switch
when removing those.  I will add \t.

> Also aiui this is UB when the function returns NULL, as relational operators
> (excluding equality ones) may only be applied when both addresses refer to
> the same object (or to the end of an involved array).

Hm, I see, thanks for spotting. So I would need to do:

s > (strpbrk(opt, " ") ?: s)

So that we don't compare against NULL.

Also the original code was wrong AFAICT, as strpbrk() returning NULL
should result in vga=true (as it would imply console= is the last
option on the command line).

> > +                vga = false;
> > +        }
> > +
> > +        if ( vga )
> > +        {
> > +            unsigned int width = 0, height = 0, depth = 0;
> > +            bool keep_current = false;
> > +
> > +            last = cmdline;
> > +            while ( (last = get_option(last, "vga=")) != NULL )
> 
> It's yet different for "vga=", I'm afraid: Early boot code (boot/cmdline.c)
> finds the first instance only. Normal command line handling respects the
> last instance only. So while "vga=gfx-... vga=keep" will have the expected
> effect, "vga=keep vga=gfx-..." won't (I think). It is certainly fine to be
> less inflexible here, but I think this then wants accompanying by an update
> to the command line doc, no matter that presently it doesn't really
> describe these peculiarities.

But if we then describe this behavior in the documentation people
could rely on it.  Right now this is just an implementation detail (or
a bug I would say), and that would justify fixing boot/cmdline.c to
also respect the last instance only.

> Otoh it would end up being slightly cheaper
> to only look for the first instance here as well. In particular ...
> 
> > +            {
> > +                if ( !strncmp(last, "gfx-", 4) )
> > +                {
> > +                    width = simple_strtoul(last + 4, &last, 10);
> > +                    if ( *last == 'x' )
> > +                        height = simple_strtoul(last + 1, &last, 10);
> > +                    if ( *last == 'x' )
> > +                        depth = simple_strtoul(last + 1, &last, 10);
> > +                    /* Allow depth to be 0 or unset. */
> > +                    if ( !width || !height )
> > +                        width = height = depth = 0;
> > +                    keep_current = false;
> > +                }
> > +                else if ( !strncmp(last, "current", 7) )
> > +                    keep_current = true;
> > +                else if ( !strncmp(last, "keep", 4) )
> > +                {
> > +                    /* Ignore. */
> > +                }
> > +                else
> > +                {
> > +                    /* Fallback to defaults if unimplemented. */
> > +                    width = height = depth = 0;
> > +                    keep_current = false;
> 
> ... this zapping of what was successfully parsed before would then not be
> needed in any event (else I would question why this is necessary).

Hm, I don't have a strong opinion, the expected behavior I have of
command line options is that the last one is the one that takes
effect, but it would simplify the change if we only cared about the
first one, albeit that's an odd behavior.

My preference would be to leave the code here respecting the last
instance only, and attempt to fix boot/cmdline.c so it does the same.

Thanks, Roger.

