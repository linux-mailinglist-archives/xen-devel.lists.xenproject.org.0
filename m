Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852517BB413
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613401.953871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogwv-0005VT-5b; Fri, 06 Oct 2023 09:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613401.953871; Fri, 06 Oct 2023 09:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogwv-0005So-2q; Fri, 06 Oct 2023 09:16:45 +0000
Received: by outflank-mailman (input) for mailman id 613401;
 Fri, 06 Oct 2023 09:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qogwu-0005Di-7G
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:16:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 108df6ae-6429-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 11:16:43 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 05:16:42 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5623.namprd03.prod.outlook.com (2603:10b6:5:2cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 09:16:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 09:16:39 +0000
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
X-Inumbo-ID: 108df6ae-6429-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696583803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=by+BUmNhmGnnCbOFBuCL5RU3RPGty3C69SJ4rAoXWmo=;
  b=OTwQfGwdeRqbL++2LAYS8yR2N7nhOul7Tj0WjXGfw35mgLuBLWEia5+f
   l9Y3A1iY5R/CeQVzUOR8zt4EN3yCIhWcHSBWFUafd7pFVgVbhhFzlDS5m
   XJgn311+gD+J4whmLcAJgwssxVjIkxPVyJXjdvdDjQcZvtxE9gtcQmhSp
   0=;
X-CSE-ConnectionGUID: oqp3VEXXSw6EqkefGNzfbQ==
X-CSE-MsgGUID: IA5OIaX3QeaDk+Oci6dwhQ==
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 124813169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:TDwIZ6816Q72K+M01ySfDrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jYbWGCPa/yLNGfze4x2Otuxox4Av5TVxtY1SwVqq3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklJ7
 ORDFh09Xiuc2c+vw7+1Zc9+iM4aeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUujtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwXOiA9tMRdVU8NZLqQC052UjUyQbXHe44t6yixCyRNJmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8aIv7YYWtsALf9awZc9jfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:yFQfraxM2lXHoQPCVmo3KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:GAWj0WxxrdN5qq03RpOcBgUTA9h+TFDt/EzPfWKhCmtnZ5uHR1WprfY=
X-Talos-MUID: 9a23:3XG6wQRqz2pTJrsPRXTNrWxFFc5YuJ2jAWwO0rINupeIKixJbmI=
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124813169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIpLkRX6814F2bBC3AidxvrNa6RtfyTlgtlFIm6WDIKnTo6ASrfADfTg1GAb2OsCygAAUhQ7R1xTe1SH8jCwJpkBkQdgTooVYlMc9K+xNiW3K6gwKhsddn8m8oCdJcRcNOOB/S76kr3OzyobGZ03FJKkw/ZH8SeYl3TPlKxZLH5597WqCdFprLrXyafK7wA0t8eOycTa56cqdxa3lJCbN9Cf0pePrB+GmO7PAMuZ3z0Zfi4Hfed45YY9Yk888Forb1y33DOnPKGDHqfZWCMAAbYegyHdX0DW3p8TQHQeD6/JPoiLvjhB4mBF2pIAXF3Bc0aRVAABhxFXfltC+N7GNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE02m+AHltxS0HWO+8PEn0CoBID2FzB2Ut853VBtHnw=;
 b=e9l6bJ/Rthon0E42ILP/PuF/piP0U/qOhrMQrjpaQMOQf0D7qLncQOjbJy6JsTQ2X6RGoofvZqpLzSo4b/NuXu30TregbiHuq9nrcGI27AX6xE0fhGRrsSD19a9LaBaaEE5yk6otpXmnbbL31aQJoXIKm3cikcpevYed5zjIYIiDXitIMA0mYKiCIzqNQVxoNwDoMDsIoawajCAri0yWGwmY/0ldFouwgI/0XFnmEGI/EPQX1WLi10BBAudkWQuvjhz6hwOoxFypqwq3IGnz/yIrOjZ1qgB9/gcXvAFNDTn1SzCNMmr42JpY8X/PKpiv/bfjaaLTDSdTDokLXrH/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE02m+AHltxS0HWO+8PEn0CoBID2FzB2Ut853VBtHnw=;
 b=FQ+df9mcJoaQxYrmdntge+V0kAXiVPyxmnKontNbOSxaynfRuFeCOmfk7Fbq8+GgTPZhA6YQ+mCd4Lbh0Z/VCKRL4cf+pPfeb9+UR8+uBrzGl3bp5a0dCLpEmldI1UiZcHgk+P342P89Y5vB9wgtJNL0fgoG7SbUG9X3zCUcO9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] domain: fix misaligned unmap address in unmap_guest_area()
Date: Fri,  6 Oct 2023 11:13:52 +0200
Message-ID: <20231006091353.96367-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006091353.96367-1-roger.pau@citrix.com>
References: <20231006091353.96367-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d046ab-2cea-456c-dac4-08dbc64cf283
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c0HQG4bvudPaVFvnMpI1Zzhy7SmgwwWI6kCCFm5RVslavlTbL231rV/s6BDfNMyBSFmMA8grSCWcwaptlfQwOSdfcSMAafb3YEwkfo2GMK37Sqymr+Pu6xCgI9c0aFhlEHBHkPHr8zptm+fMLH/FWcbzMKlgcRbrWKnlaeYIpWwqWlxA4FItWrA5urnxzDPycxKs0uw83ZoVrJE+QTIcohKzxBiY/IX7aiIO3bHVPM7ZirAGjG5cPvjR8GfLvnjlqUxCxFR2xZM8K5TwzmZP/r9InecHl/2zIP2v61QW9ZZUk1Y3MAZIFGlq9yB84ERO0ykVMhy+hJLQBjJUPXsobEnnToGoanjsW3xML+ntM/KZdoGPfJx+xu72tU1npAVSVudZBtW0cZ3PDUaLJ2GkyyEIW7Dqyc5vVHGCfRxl+ZF1vwdzqxZ2vfkgQVrP/8H5JnN6NxJkUj2jgzSuU5AFEcug3dFmnRvJK0zMbvXKKzIrySSBTw96Z5b1i0XIpEMIpCEo5laK6bVtXsaUnmC6ynTAs1pWiuXQgletoiM0+ptf4mykmdlSx0m3QnvoR5Yf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6512007)(6506007)(6666004)(6486002)(26005)(1076003)(2616005)(83380400001)(2906002)(6916009)(5660300002)(4326008)(8676002)(41300700001)(8936002)(66476007)(316002)(66556008)(66946007)(36756003)(54906003)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnBIUEp4dGR5WjFITXVjYUtWZCs5ZEtCcWZRbG1BSGFQK2xZbXdIeDdGSFc2?=
 =?utf-8?B?dCtwQU9RdXlVU2N2NVAyZFp5TngrRFd3Vm52MXhYR0Z2aE03U1NGVVBUR3lm?=
 =?utf-8?B?STdjVVh2enJWaUY4TW9zeXU2dzdKZFJoeU94ZGk3eHVvZHorZ2xyVVpUTFBv?=
 =?utf-8?B?eTV0akZNc0RIWnkwSG9UMkl3dzRKRzZTVDJVR2pjbzNEeUNwb285KzdWaVh2?=
 =?utf-8?B?aG5TVXNEUnZBTXJ1WWsrbjNXS3JTTlQxVjc0b2NWd2RvZlljSm5lVXg4SXFa?=
 =?utf-8?B?Mkh6aXc2dnBGNzMzd0tQRk9MRnRqcnY1TkRNZzhQRytJZmxKUDd3ODZKY2t6?=
 =?utf-8?B?V3g2RHFhSVNaQXZPWm13Y1hMdUphM2p5dzh6bEcxOHdkNlBUUEJUVForaG03?=
 =?utf-8?B?Vkkza09rWW0zTHczS2gxdnVoU3lxS1FVYng1VXVlWm5yOTJHQ2pTUGhxTWE3?=
 =?utf-8?B?T3JwYXNEODRHMVU4RFFLMENibUtrSlZWYisvcVVNWVpKbmhIcTNyb01XRVd2?=
 =?utf-8?B?V00yeExFVDhkZTVUWm45YzEzZVdhb2ZMWVUzaUw4elpoY0FKRnRtWWwxclZE?=
 =?utf-8?B?VVNvWlF3K2FSRFFVbVoxZk1XUk1xdFJuc0RISksxdmkxT25kTFF1Kzk5ZVdx?=
 =?utf-8?B?S21zUDFkNjFrbkpQSlppcEc0S2doRjRubStaWTBzRkg1SFRpalp3RFlyYmZV?=
 =?utf-8?B?WU5hNkxqMGJwajU3SU9ybjNGUWxQYW5adTNWU2tQanlKZzNQajlVVzNmTTlS?=
 =?utf-8?B?V25QaGM4bDdiZ2JESmcyMURlSE5zN3VSQkhHRlEwelM2V3d4NWh4YXlKOTh1?=
 =?utf-8?B?dkIyeW83d0ZnT2pwajdMeGlUbkpSSnFDc0twSElWQlFEM3JpSmJZUzRYdWg2?=
 =?utf-8?B?bktXcmtSN0dCSGpqa2ZPSzJ1cnE2WlVOVDhuYWZFOFBiVEt3aGVxY0haaXJr?=
 =?utf-8?B?bHd0bjJQdy9CRml4NnRyZDVqMDM5UWRyMnNkbVd2aVJuRDRMcEdWc0pxWnlo?=
 =?utf-8?B?THhMMUdIdnQvbURCTkQzbWJxbC80a1hTYkNaZjRFVUNwN1Myc28zY2dncWZ4?=
 =?utf-8?B?aU5admk5NTBOZjBtZ05ML0xtUE9kT1YvSjJXbEQ0dTc2THM0MjhWaUlUWTRW?=
 =?utf-8?B?MlFMQjVsUVRoOUl4NHE0amg3RUhBNHZDY1FJdUYwVS8xZmYyTEZRQkU5azFG?=
 =?utf-8?B?dTg0QUpzNjZENDRpZEd4RDgyV2ZreUVXR1ozcUtBem9NWktxT1FpbFRDc2Ux?=
 =?utf-8?B?b0V4SFB1WFQwUE9RRHhBVStVbllvNXJJd1k4K1J0N0k5OVVaNnlHUjhaU0d3?=
 =?utf-8?B?Slgzb1R3cGt1LzhlT25WOVlrdG5vTXJGa0VlN1ZTbmVMKzB4dWdHQW5GUnpI?=
 =?utf-8?B?Vk5WNG9WcXc2ZEd1YXpEWFIvUkVPSWtyKzBiMC9IOFBCek1nUmF5WUdYVGxE?=
 =?utf-8?B?Mk11WmpWclV3Tm5qUnd1NmgyZSs4N3ZBOVorbE9jNEt4eWxXLzFPak01V2V4?=
 =?utf-8?B?b3gvWGNINmplLzB0MkhJZ2xlNTg2bWhVY3hWeFdMZWljbjkxaVoxTkRheG10?=
 =?utf-8?B?M2xpN0MwYjN3dTA0SW4yaEJEcFJZWVVTb0tDT2QvbE5IWXRjVEVwNFl2TmE2?=
 =?utf-8?B?eEVUcUJxWWVXYXFKVzNtUjl6Zlh4SjlXeE5Ua2toMDdBNHhMaEpuVlliQjRh?=
 =?utf-8?B?VjBuR0RUQjM2dDJBYkoyOUxxanlIMjJyVzRldU1UOFFOMzZMQU92UVpRZXZu?=
 =?utf-8?B?ckVDT204eXliOGxLRlZzMU00bk51bmNsbDNyWmhsQUxXbE13ZjQ1N0JUbHpw?=
 =?utf-8?B?dkgyc2Qwanh1dVdQMTA0TitWSm9xOFJSc2tqNW1oc20xV3JZcVNHbmZqcjE3?=
 =?utf-8?B?SUs3cmVpL1VTNVpkVFpER0t5akt6NXJHU3E3S1Nad0FKSGR6Z3d6NkR1U1Ar?=
 =?utf-8?B?Q1RWN24vYnhqTkVXZVlzaldCcFUzcGhobGVmTnFMbTcwdUtTL3hXTDlvelFk?=
 =?utf-8?B?dG4wc1FHdldoejR2RHRJR1NnWUtRVEFUVFBSSU53NWo3VjRFWHNGaEFvcmQx?=
 =?utf-8?B?SnlvbWFOdjJiM2pacU9UQzdZbFhxN0JhV01BWWV4NGpXVEtnd1pEMGVqMitu?=
 =?utf-8?Q?6fFu4ZSExnk3XmgY+I2ATYhVR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x/EqUypPEY/onntB/hLn/E2N04B6UmouigscL4eV08Plhm38vwvk7oVzHS0SkhZH9Q5s6WvVwFcP8oTO/pyeewSzOz9l0VrioFDepMj0ctMHlBPmOjRAOSksK7/HafMHPLzGbNWq+ShnwSCfQNo9DFS464jBQUBJyuskzd1NvrzbqJO2qnzkLZpvP1TdqFLNn1BOSuZMjpJMiwMBBwZJns0a2wJbrvoa6bVvz6IhB1oP6AtT/T3OIt0f5PNN1LqsOHHIQva3+kA0qAUCJRwdaO147wPhEhN0tE66k0wNyztwLXDJTNyjIyyn0lkoijAW8bpbM0Qv3T34nQXdEdL9Dbn+4lvMhn8O0/UNE1xaGrFl7s3fYvO09N0l3uqz0Y1zlK8PT95Bvz+EodaAsSud6yTcPY5uFQ2Ngo3/PKX44uvkZJv2QhdPSf3YWHq9mmB0lq5r8h2NY+2SG06ifI6hF/E+B7zFq6R2sMPvOSvXhYG7xmkGvxOMVNhjvW2a5dF7XXt6TCMPZOIu+ftlq5KqDKy95YtKTLbZrFonTOL4QAUTIahyNaQf01xc/t2+meLLTSJmSok481jTQiX+QkIJsRDJE3xy8CP1arzZZRl7S0zIcS7Ba0sa7Af6JY80b5G+R/bTGJx47y954W9dBJyF7pBZtkqiCL1F3OjkuM8mirqinPCFpLjXhGx742RO924MGYQ6r8Rlbmd2obEMZDCOT+2maa//375i1kXxnEcIM5F66hotIalw9ALwBNQdL6yeFVSlOtVBUDI6sINjpzvCQAIuqiue1xxC4pNNzFHLCR630ZmFC4CX0+KBL+L42St19wE6K4ZOUrWxT4Whl1XnG9T1+1Yi44YbNYz6mUjEMqO4X8sb2eLyQAySS7/8MuJ3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d046ab-2cea-456c-dac4-08dbc64cf283
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:16:39.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGXhV/gKF3E+OHAvF66pv9nLls8n5OXGNxZ3XQXIA3tgmPZpBhkQOBe84fvJCpS7pQ7epYLHs4rlYz0riZ5cVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5623

unmap_domain_page_global() expects the provided address to be page aligned, or
else some of the called functions will trigger assertions, like
modify_xen_mappings() on x86 or destroy_xen_mappings() on Arm.

The following assert has been reported by osstest arm 32bit tests:

(XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
(XEN) ----[ Xen-4.18-rc  arm32  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00271a38 destroy_xen_mappings+0x50/0x5c
[...]
(XEN) Xen call trace:
(XEN)    [<00271a38>] destroy_xen_mappings+0x50/0x5c (PC)
(XEN)    [<00235aa8>] vunmap+0x30/0x1a0 (LR)
(XEN)    [<0026ad88>] unmap_domain_page_global+0x10/0x20
(XEN)    [<00208e38>] unmap_guest_area+0x90/0xec
(XEN)    [<00208f98>] domain_kill+0x104/0x180
(XEN)    [<00239e3c>] do_domctl+0x8ac/0x14fc
(XEN)    [<0027ae34>] do_trap_guest_sync+0x570/0x66c
(XEN)    [<002019f0>] arch/arm/arm32/entry.o#return_from_trap+0/0x4

Fixes: eadc288cbb0d ('domain: map/unmap GADDR based shared guest areas')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
unmap_domain_page_global() and vunmap() should likely have the same alignment
asserts, as not all paths lead to detecting the misalignment of the provided
linear address.  Will do a separate patch.
---
 xen/common/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b8281d7cff9d..2dcc64e659cc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 
     if ( pg )
     {
-        unmap_domain_page_global(map);
+        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
         put_page_and_type(pg);
     }
 }
-- 
2.42.0


