Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEE45DCE2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231525.400685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGL3-00049A-4q; Thu, 25 Nov 2021 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231525.400685; Thu, 25 Nov 2021 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGL3-00046r-0P; Thu, 25 Nov 2021 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 231525;
 Thu, 25 Nov 2021 15:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dIP=QM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqGL1-00046l-21
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:07:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 565fe82f-4e01-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 16:07:00 +0100 (CET)
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
X-Inumbo-ID: 565fe82f-4e01-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637852821;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8xiq1tXxm90Xa2EY51jDyabYjVSe99HPtTPZDuV+V9c=;
  b=SmvXmoaU3wDp+8tqSymLHWVaqzvjg01R1hEvBNFhGjCbY34rxcuetFpw
   hE60QJA5Cxe3sYHG+hAFdX0tFn2/sJyH1ugmdqQRbUA2B4UxShz9mAr1b
   46Te3ngHm0B4Gckuu9f3BpdN2JrvSDPCSTZALgN+Q00x8QPT9TPqYJqjX
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3W6W6Ws74dT7ko9yWvRfNNjNoaLLsrMSK4Qsf8Q6uDy5XKloLTd/U+bEYph7YuDi5Uwj3YkykH
 MrcmfX1PNM+G0TGp3f8mYgakqCEhc2JddbYG3ADRbkEYfWdCIW8N76BVd/Gs6g3nv//TK5FyK3
 Diw0lToFjBpwGMwEc33rByulRUgovABKFxvmOKmDK72p6kqlv6zhX3n3+kNTYTYsR5Qku+8SHy
 GVZGW9qeozHr48zFXr5lFlYltXj42FON4m7mJa/ZO6nLFnVAKInYs2JR9c0wVq8VhMSrVw1GlS
 psP2BsuEL3BMparPZMNALN+k
X-SBRS: 5.1
X-MesageID: 58643763
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6aCKOa5TZBfWO89gldslPwxRtP7AchMFZxGqfqrLsTDasY5as4F+v
 mZKDGqDOaqKazakKt4jYYux8EgGvMXVytYyTQFppCoyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 ecK65mWdxoVYrTIieAsVh5/HjtyBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWdu2psRQ622i
 8wxRxhefRPvfgZ0J3g6JL1iwN6S21z5WmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQu5AY+DAXh56Pj0wjnBowZe
 xd8FjcSQbYa2X7sENzbYQCE/GeArxotXt13Hvc20VTYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H6+PMFy/EnluAhXbrYHVOczdeDcMRZVJdu4GLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhElFdCub/BDvNAuZFiGmNPdHA1LQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjeb2KD0A4/TsN/plxBHkJPmqgKvllDyLpBaJ5YKVcFn
 meP0e+u2HOjFCTzNvImC25AI88r0bLhBbzYugP8NbJzjmxKXFbfpklGPBfIt0i0yRREufxva
 P+zLJf3ZV5HWPsP8dZDb7pEuVPd7ntlnj27qFGS50nP7Idyk1bJE+pYawXXMbhihE5GyS2Mm
 +ti2wKx40w3eMX1YzXN8J5VKlYPLHMhAovxpdARfemGSjeK0kl4YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:IieWnaOTxvxwo8BcTy/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KWKnjVQe+xQvOVvm5rY4ts2oU0dKD2DPMpbnnpE40ugYwVLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUOzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4MoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKnQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgUdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfNsRLQkjQJo+ao7bWLHANhNKp
 gsMCic3ocaTbqiVQGWgoE1q+bcHEjaHX+9Mzw/U4Kuon1rdUtCvjslLfok7wI9HaIGOuh5Dt
 v/Q9dVfcl1P7crhIJGdZE8qJiMeyXwqSylChPhHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58643763"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDLEr1ItMJaUJgs6AqpfUOVq3/hBtXXskjjlEK33kAfZmY/XBThwE3wxOr9ZfqpG8ucwDuLPh7jnaBm9FWq8ZHdtFWKnewNsOy/n7UdbAPDjT/UF54EH/aKC9NukwHzuahtbFO84KS/d8vrKQP9gKRirp9AcKS3csJGWiiMzo6V4HAZUO1M5g7xhdvLcwzOmf0a5zZBpS/lUQv91VHHSeZTeWR+TCDHA0eO2UApot2GIaLPln/Em7HPMpWmRNU1Dv/h8SWMDAtLTVREr5U6H/3qR7muBedYj84nyxRnegcFAf+vsvfR7adydZf1IY1QzRpsu/1L4sHk3Y3Tr3s+xgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYd8jcGBamOLMRYL20K5O3zkUzs6USGksk6LqCwkn2w=;
 b=B4TlqOgqXRDszj+i4eJcsvpNayieMiLz6Ivd9aItYJg3SSMoEbycQGVYZCuqfVwZSUfJLd5b6+wxs8EQFR8Y3o7n63EDmGylN4va9i/iUFam3kO8Nlw+cSuC1W9bB2yVD3MDU7Ug0KJxJSagasHFHUMsdKb0FrjXG7GJ+p1L/2SBmcTRebC+0fDnS6GXc6RBWcG44uVjB7w7ftPiIzmTJ4wdSgiOAgUm8J/vqLUhDTmjyKuppaj3ACqNYfbppXtfJNK6DMjx9wiYVKSmF/CqoWbfGa5oZC9xGdI1fkdEsMsckyhfvtZlvqLiwlBWZjl3E2R/a4MY2pSrrWfBAaFByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYd8jcGBamOLMRYL20K5O3zkUzs6USGksk6LqCwkn2w=;
 b=bdFOncimmiMvcE42eTqdISEwqYLaIXA0p59VER/b9zvZIpd9Q6yEHcGDNxE7VOBFKNlfNPto8ax/zFHJcHPdDd6NplEKsy5ztTX/yET2r7aAqCbFlZbb1q3KK0NzzZ/PnVhe4ihB9iRUjmVgL7YS4SPhwmkFHNs/sD35TTSeKGY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH] osstest: enable timestamp on guests logs
Date: Thu, 25 Nov 2021 16:06:46 +0100
Message-ID: <20211125150646.10414-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70faa96c-bd42-4ec3-7dcf-08d9b02538a2
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5605D2F1D283362A576838B18F629@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHw4QV93nm1VrmCh0h3DY8QJ/WbDouGNq6BxrJaVSOceqinRCgxE/wGfZG0M+bzj5LCsxEyKrMHTd93skWGLAB8175Nyk2dGcD1K5YRyQR/3LohYk8dOo3OWuhWjDG7wpvJ4JTTZR07PigJEpd+WWn7+3yqcG85HLj+5BWLhNsieD2zJfu/MpeQSe/fIvcdCU0VDPzu7b+AUcgxc4CdmX9iN2c9ETq/5wdXdxhueCOwwTDGh0CyiSTDd908LZBaH+1r+cE1TpiI2cvvLFFV9/B6/uLuy0VqstY/bkxC2yaBYJHRBPg72bUdjZgR8gH19Q9QPL5Gk36Uw46v7GV68PtsVh8IEkNt9/Fh63gcRYK5cvnqdZwjA6qNTmYUpyJ5+HB1ZREuW4ZEvkhZjLwRvZAeO2vO8HiZHdJ+mTLDEU6colhBT+FioEZFaFjsojf1QKWZGDPBe1gjfLcPe+Bct+yZoRzue+O3JjQ/5kkrXNOSNkfxNXElVG7YgN/mG984WHuNSXtrGqLWc61BthGTU/fKrbWcgKy/vd//qvCPQqiHnpoQ6WpWwFsJYXjqC/mc7XXrDxEmdHv+gUFbih4Ew2KOvCa+GFDQP8S5eQ1ll/UwP6BvVi6eXs8qHD+gpvf/8wn9KixwKjjx6VjfuAgmY+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(8936002)(1076003)(66946007)(26005)(54906003)(6486002)(2906002)(36756003)(83380400001)(316002)(508600001)(66476007)(4326008)(6916009)(38100700002)(6496006)(8676002)(6666004)(66556008)(5660300002)(86362001)(82960400001)(956004)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBwSXJRTFlUZWxYVnhlRmtzVVVJcWJ4a1hrMHVpd2ZYbTdnSFZ6bUlwOUdJ?=
 =?utf-8?B?OFNmbmh1dkM2VVN6ZDVHMTRKcS9ndFBQb2w2eiswSFRXR3dPa3haV01vZHFm?=
 =?utf-8?B?RklQdEVGaVNVNXhsSFk2MFRMR0lhNUoyWG9rMmx1SGxIUXIrY01KdEUvMUln?=
 =?utf-8?B?bFNHRUpTTEJHd3lGMzgyTGxnVGc2ditYdkFKaklYUkRkeTdpOTF1SFNFWllO?=
 =?utf-8?B?MkkrMDQ1RldlU3FrU1E4dW9aQzVRQ0hnUGJiUXRuYlFzeEJOaVgvbENDeXRS?=
 =?utf-8?B?S25MYW9PYUZtY09TM2hNUExaNnZZYTB1OWY3MjZFVEEvYWxsRk84blBScVdh?=
 =?utf-8?B?YmpCd0djcTBTeUhzbmZ1aGFJM1dEUmVRN0V3UlpjZzhMNG45Z3AxNWR4Qlc2?=
 =?utf-8?B?WmhzdVRtc2Zlc0R4RVdMMUpXSUdmUHhwYis3MlhVM1FnODRiTWFFYVpFNVIy?=
 =?utf-8?B?V2VYNTlSa2VjMDJjVFdDS1JPT1hFcHVlNlYwWUVjRzlTM2NKY0pnMHBtcDMx?=
 =?utf-8?B?eWR1bmZncEJ3NWY0cTNNMHVFR21MNG55c1JFaGlRTm1icGhWK28wamFobUEz?=
 =?utf-8?B?ZUxPaDZtSkFIN3FPb2pHbWNWandoR1F6L2VJTmxrMEhKaTk4OGhEclFBV2dX?=
 =?utf-8?B?aWpSQ3dOM0M0V0ttdE9EbkhCRmhTRDJ2RTFJL0Rpd1Q3UXBjdU9CRTJRWVp1?=
 =?utf-8?B?NTlrZXIwYzJrSURsdXhtMmFmVkhwNXFpY2gxbXhtT3pzbDlXL0ZjRFNsd1ZD?=
 =?utf-8?B?cjdpcXhjWmhDUGh0Mzk5aVJoZzUya01xMkRiN0h4dTYybGtYc2pKcFdUc3pQ?=
 =?utf-8?B?RVIwVHFOWi8vSDdZTEpUaW1vVXluQlFieHFQWEppMlUvZHByWjZaNlE0ak1N?=
 =?utf-8?B?aTBvMEtsbS85bGRoSGcwM0oyZ1dDSW4xQUN5eHhnZFIvbHVpcnh0TG9qa1Zh?=
 =?utf-8?B?MElPdW53STJRYkFENVVTR2JUUGVJa1gzOUdiRGI2bXM1T3k0dExWQjRudjNw?=
 =?utf-8?B?MEVBM0pmYVBMa3JKQ3JSVW9ZNXZmV3ZMOUtFSkZmSVRYaVprbW9yK0NHK0RE?=
 =?utf-8?B?c1hHK0lRWS9VZlE4WUMvVDFWNUhHMHVteUdCeUMwOWZ3ZHNJdW5SV2RjL1VX?=
 =?utf-8?B?WlVLZUNlbllhNmtkQ2VQcmJiMXZqbmtmSi9qdTEyNC96bmwxZnV2MlN2Zm5x?=
 =?utf-8?B?cStGUkdoR2diUDFsdlFRd2xpVkhGd2tmY2NKTndJdlFwOHp3RW5vVmEyNDRy?=
 =?utf-8?B?Ylg1alRvNzl5dFpZcG9RWmVLamhaQkl3K0lMMmYyTkU5OStiWFVMT1l0VnlU?=
 =?utf-8?B?ZXVoZ004VEZobEd0a1VVaUs1VW4ydjJwa3I0dExrcy9tNkNMVHN1S3BTRWR3?=
 =?utf-8?B?cVRRYTdwcSthWU0xTXlSeWpQV1MzTUdYTGVJWEJKbVJHU2EvM1VUVHBlU3hv?=
 =?utf-8?B?T1ZJVTJ4UjEwM0VSY2JiajY4Zjd3dEd4dHhoRWIvR2JvQVorWEZ3VmhxNGEw?=
 =?utf-8?B?T3BQaTE3NURoL1RXMHBQa2tlZTZ3bXhpTktBbEl5a1A4b0ZmN21hRkR0S1pW?=
 =?utf-8?B?QmJ3K3FKTnpQb0Z3SzhnWkVtbXYza2ZtNEJvT1h5MVBYbExRaHFiQ1JlcUJL?=
 =?utf-8?B?NW5DbkJYK1NsMUNscUtPWGg1NHNJd2J0VVVhUzNwVkEwbUVzczBKQ1BBbU5R?=
 =?utf-8?B?c1R0ZmZSMkFJazNuRVpBOERhMkM2Z0xpOCtXenJVK0hxVnZoWmhqT2pnQ0dR?=
 =?utf-8?B?R3Z5MFBKcVAzWVJ0dGg4WHVpRXhJb25mQUZ0N0FaT3dVUEMxSFNuMFdXaTlH?=
 =?utf-8?B?R1EyZDFhRUdSb3hnZnhRWW51bnI0aEdick5ENHB5SWN3Unl3UHJ0aHdud2pk?=
 =?utf-8?B?L0NPcVRON1luc2EwU2xzaXZzWTZ5NGVKVW0xN1hjcVhtbUNObC92eHlONVAy?=
 =?utf-8?B?TmZBYkN4MHpPdkpRbERYay8xS3g4T3lLOGFOQm5BMGMySDVkNUpwTU1PY3ZW?=
 =?utf-8?B?eXpYU01oNjlHUk0zNjVCNWhLU1JSUDhOQjNHQlc4Q3YvNzFzL1RTQTRxUlRm?=
 =?utf-8?B?Y3JldVlvZHZYSEtOdDJvWGN0aytzNVQ1cWdTU3p5ZGxxbG41U1MrMGljYXBC?=
 =?utf-8?B?L29UNUkrcXQ5V2RZR2dLT3BjQmZUSVRIWXl5S0lHU1ZvRDR5anZCeG5zdS9i?=
 =?utf-8?Q?+2HSEc9n4NbBADPLJLZw5ro=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70faa96c-bd42-4ec3-7dcf-08d9b02538a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:06:56.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKr7chss4GJ6ZU+khSwen/Z0gzoKEqWJd4kVAhoOAUnzccUJzY+JdaK4URFYqIiQcUuGdr7PCmlBf6thxTptkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

Enable the timestamp feature of xenconsoled so guests logs have a time
reference. Can be helpful when debugging boot related slowness.

This requires using the XENCONSOLED_ARGS option and setting both the
log and the timestamp options. Note that setting XENCONSOLED_TRACE
will override any options in XENCONSOLED_ARGS, so they can not be used
in conjunction.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-install b/ts-xen-install
index 47865eb6..bf55d4e5 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -140,7 +140,7 @@ sub adjustconfig () {
 
     my @commons_config =
         (
-	   "XENCONSOLED_TRACE" => "guest",
+	   "XENCONSOLED_ARGS" => '"--log=guest --timestamp=all"',
 	);
 
     my $xenstored = target_var($ho, 'xenstored');
-- 
2.33.0


