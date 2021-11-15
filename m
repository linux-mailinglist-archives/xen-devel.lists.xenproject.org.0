Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096D450331
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225781.389969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZrI-0007Cy-5x; Mon, 15 Nov 2021 11:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225781.389969; Mon, 15 Nov 2021 11:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZrI-0007B6-1Z; Mon, 15 Nov 2021 11:09:08 +0000
Received: by outflank-mailman (input) for mailman id 225781;
 Mon, 15 Nov 2021 11:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmZrG-0007B0-An
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:09:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70a7e57e-4604-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:09:04 +0100 (CET)
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
X-Inumbo-ID: 70a7e57e-4604-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636974544;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7cXRG14q19Rc7ooQI3Q56KJ9oCFwKr1mB1zA3w9yWRo=;
  b=PQN+OQXNoTSsRFMmcronU3m/YvE0nXZOqx5gQvZQNkUECdX2evY5RIAE
   lNR3biqVWqSk4cY7U2rTa6mXbp5op9D1xMfaZr/Nmkp5CFD/2YolSxwcS
   IqfE8BkazO3YbE/QFkiiD2IE4TiI+rAFgHV+msznTYYhv3JJOVq11YlUv
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cBT8DAxivfhmmi5jKKgucijtF8ojzt2gE0IslLMNPgJTnG2eQ3Lqm2Ak4cT7pVtkLkWTt6BJO3
 YW7ZxxgbR8/1fCzCdEKVneKSu4mO2wdlMFEMVEhBGDfrL4jqs6PBRCbXBjH7pwHAcNm8imug1x
 4Y6NqoBiwdSOV0Xy98NvMmQ66Z9zdMeEK9OiLOHH6HbjgbgYPm60LmdjcgHHv2amDoi1vbZiNs
 eTZLRWIGXJL3mEcK/6hIGL1yMKJLWD9NBDYAfg/gHoJeMQ63MTlzvB7dOcWnT0KlNVpHO46rko
 N5J67aA0cxqOirxFM92CsMax
X-SBRS: 5.1
X-MesageID: 57820189
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WdTxR6Dl8z7qMhVW//nkw5YqxClBgxIJ4kV8jS/XYbTApDx3hjVVn
 DcWUWjQMvjfZGGmKNFwYYu3oEMFsZ7Vm9JlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540E87wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hTaIhd0u1
 PF3r7e7eB4TE6jVlfkxakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqav4cBjGZYasZmHe7yb
 YknQjxVSB3OPwBXN08XCLl9k7L97pX4W2IB8w/EzUYt2EDS0w5ZwLXrKMDSeNGBWYNShEnwj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVUR65unPbojomQfFbIvQAxQSUx7f42lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNhr1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb/zt6koEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AA0Qch4q2rwpyD/Iei8BQ2Swm8zaK7onhezP
 yfuVf55vscPbBNGk4cqC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vY+liIq
 IgGaJPRo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwM/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:++MFlauIuKVNGww2YsypGOB77skDStV00zEX/kB9WHVpm62j5r
 iTdZsgpHzJYVoqKRMdcLO7SdC9qBHnhPlICOAqVN/INmSL1wXITL2Ki7GSpgEIcBeOkNK1u5
 0QF5SX1LXLfCdHZL3BkXKF+hIbsaP3jdHV9Jnj80s=
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57820189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhwosIMXB5rip8a+EwL1SAWQWlNMmNHZvTM7ynDvVDsG8vIG2728vO7htIXbVQPISrWeNKAHJ0NvVKmKMcCxRyumoML1B0eCblyhFbFxhBPfhpMpkVn/kgu/paNYHj/EFqe5es4uPSNoPIJMz81b3LuPheV+ZYbQKKIj9q0IMBJ0ti8/1eop1vfpQLT0S1+ac79fYZ69SFXH5CwgcfhhM+wu03sz2nK50Q/TmKHb6wF1yzP7gpGNcN2c3lE30RmNUgkFC28tD7L0LtWmWiZ4AhqhKA+CYxZALS6vJ4cKCn9A8PHBiT1NytNbulLWSfomm5jJFRRpar6BCZoJ6We43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQGcGIWw8+ykgU2xoO+AYLGk6aYorzQ1pON8+RmWEuE=;
 b=UA+VIvOyZdxXIbUQ5CSOT8ntHmUKjx2RGtAQuNN8ODoqI1xAqEsExtAxmKIe68IrQbyxSSGn2yFmjbaaZgNE1PjNX1SxF4gbhokDodA9i48YC6kf8vHrdHs/13DfgXa6UqCV46IZdlyI0M1f+Q6qBxwXJJI0KilyO+jnkvmtZhDaAiGrXt7UgdHJslod2/AUm+vAP/F3gbeTgisTIG+6oddjHu89GrS6DKQGTfLmO4Zb0iAxcJl0eUluRJVL2GR/AIogUjeTetXGGx8DPGwRiYVSvIWShm+CiD3bPj8LYP42BXArLjfRShLHf8wbbzAeTXQ09FHMYzyP20s+7opBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQGcGIWw8+ykgU2xoO+AYLGk6aYorzQ1pON8+RmWEuE=;
 b=nDxvXe3ViPT6lSj2a8b3p0o6a2ERteZcxlfy28FnyHpobgZf3yvGBTQDORTW7pI3RVYGsu8/I2WhuEvtyl+Zx23NdroMdKNEV9C3g3zMOxeQB1Y7xmB//iUjjlqh2RNnAnprXEx01nwlKm/jYKeFHrQkg7lKnCkGfuRYZZcSMII=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl definition
Date: Mon, 15 Nov 2021 12:08:51 +0100
Message-ID: <20211115110851.1462-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c524cd3-36bc-42c5-847a-08d9a8285145
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4220EF31249EB677ACB2B0AA8F989@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3e2+d/yMat/eHggg5T2Sl3TBYrG5nv8fPfgYEkkp1Ul1pgwaey0m+zoM6CHcd7y0FrYJOmB3Eq35RslJwbpx8+SWIZY7fFkv0yi088na6Y3lw2tocpGKsoe5gBfm9jJAJEUCc08pRPW5Wgn5mcdbg48/FpTbeq/U+a4z0h7PbkrpxadNyTxEaUvKSW8729BUu/+t8mUFODVHICxBmzLPfbRlQOnuC8F22CKq8m5RsqL6YDtO1eGzpLjtteXxFzTSpWghbHyyuB+Nc8d9b+ebh6zwQUu8+YrHHNJSfiuIFE/5QsW1Ovm4UetK/NZCdtaJYoAioRDu9kDu1W8/Q4q8eb4DXMKXelr7A3PYa0c6v25E/UnKqCXXDTV+b5+kubmvGG9QVZKmFeCtdHsJUu7HuNSA/tmlOIiNqM5NwvVGzxrqhBnR+Nmf4A7rE87VWamMntdmcfAsbOM+vYBpLbnWqXYyfcblAMHHC5zBHM378pyOHlypqcRWxxwrYx3qmGb+FotqWcmjgBkhdIYNpRzgBFlWcHmkyicv6Ygp2lbvlT9BRV1oeP3ALEdeehhidspwL43eVJoCgfDMr2z2VjyAoaWJ/SCpOADxFAEmcaJpQJaTka8rG07IeLm8gUgRaGsPMBIJt4Alb0ZHvzRFo+7xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(1076003)(6486002)(2616005)(508600001)(66556008)(956004)(66946007)(66476007)(82960400001)(54906003)(2906002)(316002)(5660300002)(6666004)(38100700002)(6496006)(6916009)(83380400001)(186003)(86362001)(4326008)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldjOWtTeGhBR3JXbW80S0F1cC9kMXFjSEFrVDV5WFFmRWdRVm50Yjk3RkVW?=
 =?utf-8?B?QWxkaUZlS3BlQkJUNEgvQkxxaFZHRlN1VVlHK2diSlUrMVMxMFlZejh3d1pk?=
 =?utf-8?B?Tlk1Uk41dHQ1V1JKQ3QrRHU3ZElVK0g4bUFJbXZCZmtRRGFGKzJWWWxSb1Y5?=
 =?utf-8?B?aVFPZEdjUDlYS3hrc0hldHZvaVFMRzNtS0U2TDJtREkzbWdsREg4emk0Q1ov?=
 =?utf-8?B?TzNaOFB3czZSZGNxbVMxUTRvMkFzOW1BNG43TlNGKzlmY3hmWkczNUdhS2Rm?=
 =?utf-8?B?WlV6M0pjLzN2N1l3M2R4bkNIZENZc1BwZTVNakUyYmR0ak8vSXhiMDM5VGpI?=
 =?utf-8?B?bTFhN1ZRRmt5cjhpSytSRktvRlBwRU11cXN6UlRobWYzSHJYdHVCcWtoS2dv?=
 =?utf-8?B?KzIzM1lPOFhxV3N3eEt1SHJWSTM4Y3hlSEdSam9Fc2xTOXF2ZEFjSVl2ZFdB?=
 =?utf-8?B?ejhFVXhzNFcvblJtamU3OVBEaEdsQmQ4T1dOWFVCeU5LT3A0cjRuazduWTFm?=
 =?utf-8?B?T25sMVkyZ2twbFJ5ZEl2NVlDelFiYlhScnAweVFBTm44TDZYOE13a1VyMzdU?=
 =?utf-8?B?VTFlV0FxMGk0UVpzNGlxd1d4RllQS2V1RHZIT0E4YmZPaHlhTUVtbmJrVFoy?=
 =?utf-8?B?Nkp2OVVFZXJwM3pFcVQ4Nk1SY1pRSzNvQy93K2dJM3loTHRIblpQUVlVb1l6?=
 =?utf-8?B?cXVvWW5YdEp0alRVbTdlaEV3U0xGd0VsT0k5ZXRxWnJUS29kM1RIK0xFL01Q?=
 =?utf-8?B?dFcyMDhkQXJnMStiMXRxZVJ6TjVFdVFoM0tEVTV2YXhjU0Jzc2RtZ3pYTE1t?=
 =?utf-8?B?RDB2YlZZYXdZcEJxTDRQQitNN1pGemROSEc5ZW9EdlFBUjR5dEF0ZTgrMWkw?=
 =?utf-8?B?dmVUMTRkZnRjSzBOQm1OR0NYMXM3aXVyWHA3T29KbDFMOENJSERRZ2M0Uk9w?=
 =?utf-8?B?RlU4VWlHRUhEQks5R0FNYzk0MDR3NWhJU1RrSlI4bHdzaGx1WmQ1Q0o2akg1?=
 =?utf-8?B?b3Fmc2FZbkRBZVJqeHhjcTlpYVRSR2w3S1RTWmNSWitybDVwM2YyNVVwV2xX?=
 =?utf-8?B?UEl0amJOTVkvc1FjNXBOSEd3d1hCM2l6UUdKclViUmt3dUU5VTUyMFJKTHg5?=
 =?utf-8?B?bDBPOEpNSkFzdWo2dEVDTjVhcGU0bW1pU21aSmlrVEdQbit6ZWM2TllhZmVz?=
 =?utf-8?B?ZTN6MEU5TFdxVkpSK2UxVGMyekdtSUtUV0lmTnYrTDRpZDBDdHFWTGpEUWl4?=
 =?utf-8?B?WE5Ld0lxWDJEN1JnQ1p1VkhOYmhGR1lLSFEyWU5Ec0wxSDRpNWhWQUc4OWxK?=
 =?utf-8?B?cVgzcjNWa3RXRk1BZVdWdW95ZS8vV3Vna0pvZUN1SDNLRnpVblh6SW5BdXNG?=
 =?utf-8?B?b1I0SVFQbmRxSEVES1pTT3A3MFpBRDJPdXpJbnBlenVKd2hZK3NvZjB5WGpB?=
 =?utf-8?B?c2xxa3JBMkorRkpER2dGaXZxVnpESmxJc3Q2ZUc0b2J4OFRKa2xxWWM0OHB5?=
 =?utf-8?B?dFlRdWU4YitnK0FsYjNnZVNUVktIOVg3T3RhY2tNcXYwK2VBemNpeWdWYXpo?=
 =?utf-8?B?aDAwdi9WcmxXVWlpc0ZjUGdUdzkzZE9NOUxMK3BWK0c1RGYxTUxFUXdyN1d3?=
 =?utf-8?B?VHZwRmZPTmtBUjRaV3p1c0kyQk9Rdys5YzNSWnhsTnpNUzRPWmVSQ2tNNjk1?=
 =?utf-8?B?YlBxdzk4eEM3VmxPQy9ZQUVrdEJUdXhNOUxVdDZYZnp5b3FGc1J0K1N2TkxI?=
 =?utf-8?B?SG41N0FKY1dQRnZHeGM2d3NLWloyWUVqamJYU2p3ME5mMGgvNFNrM0ZqZkVN?=
 =?utf-8?B?NWt3bVNXbG8yTGNRQjk1SnBsSzFQQUhySDNXZ0RLbmNqZ0xXWHJCamxxNnFE?=
 =?utf-8?B?SEJCY2JpZHNTNkhqN3ZoTHFKSXR0dGZtRUpXVGt2b2hPNU1aQzdtRUpIN2VD?=
 =?utf-8?B?UFFESEZVQTZTOTdGbTdycWNIM0g1bnJtb1BlcXdUbDR1RkIrOUVQM3VFVlFD?=
 =?utf-8?B?WS8vdVZCMngyc2hSRUUyRk04dXNtdkJFaENPeHVJL2MrT2dCUXRKZXdlNmlN?=
 =?utf-8?B?L3hndTZTd1dPN1prSDZ2UW1wT2dZOVMwUzZINUxsM1JreG8za2pmamVwTytr?=
 =?utf-8?B?RTJSMkZDZkk0Y013Snp1amZpSmpNNTB6TEU1Y2I1WUcwMTV3OUpMWWdvcnAx?=
 =?utf-8?Q?HhEPBzf4IHBdLDklii2e774=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c524cd3-36bc-42c5-847a-08d9a8285145
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:08:56.7305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7iMYAkUBK+yrC8g628rT+wpuQHvzq/5RmKHxgZDQALqn9QuQJVIG4Ctyd2zcFR4y2eRjUdqOXenvdUaJPaJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

Current ioctl definition was wrong in both FreeBSD and Xen sources, as
the MMAP_RESOURCE ioctl needs to copy back the size of the resource
when passed a zero address and size. FreeBSD encodes in the definition
of the ioctl number whether parameters should be copied in (W) and/or
copied out (R). The current definition for MMAP_RESOURCE is lacking
the copy out part (R), and thus the call to query the size of a
resource would always return 0.

This change will break the current ioctl interface, the tools can
however fall back to using the foreign memory interface in order to
map resources from guests.

This was a shortcoming from when the hypercall and ioctl gained the
ability to query the size of the resources, as originally the
MMAP_RESOURCE ioctl didn't need to copy out any data.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

The change only affects FreeBSD, and it's only a change in a
definition of an ioctl, so it's unlikely to break existing code logic.
Without this change Xen tools won't be able to use the MMAP_RESOURCE
ioctl.
---
 tools/include/xen-sys/FreeBSD/privcmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/xen-sys/FreeBSD/privcmd.h b/tools/include/xen-sys/FreeBSD/privcmd.h
index 649ad443c7..70cee3db68 100644
--- a/tools/include/xen-sys/FreeBSD/privcmd.h
+++ b/tools/include/xen-sys/FreeBSD/privcmd.h
@@ -84,7 +84,7 @@ typedef struct ioctl_privcmd_dmop privcmd_dm_op_t;
 #define IOCTL_PRIVCMD_MMAPBATCH					\
 	_IOWR('E', 1, struct ioctl_privcmd_mmapbatch)
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
-	_IOW('E', 2, struct ioctl_privcmd_mmapresource)
+	_IOWR('E', 2, struct ioctl_privcmd_mmapresource)
 #define IOCTL_PRIVCMD_DM_OP					\
 	_IOW('E', 3, struct ioctl_privcmd_dmop)
 #define IOCTL_PRIVCMD_RESTRICT					\
-- 
2.33.0


