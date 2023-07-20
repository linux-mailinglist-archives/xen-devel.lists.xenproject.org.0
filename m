Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA075AD03
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 13:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566552.885517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRtJ-0005sP-GQ; Thu, 20 Jul 2023 11:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566552.885517; Thu, 20 Jul 2023 11:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRtJ-0005qk-DP; Thu, 20 Jul 2023 11:32:17 +0000
Received: by outflank-mailman (input) for mailman id 566552;
 Thu, 20 Jul 2023 11:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMRtI-0005qa-AM
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 11:32:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101919a0-26f1-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 13:32:10 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 07:32:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6259.namprd03.prod.outlook.com (2603:10b6:5:359::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 11:32:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 11:32:06 +0000
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
X-Inumbo-ID: 101919a0-26f1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689852730;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qkBYpkALUN8qEadm+JA4FoVCVr30vzBtw5/VkogHJoY=;
  b=ganEd10S/8umsADZRs/oWvYUvj0lS9BJqSbM/H7TG1b9rTZIVG65ORN5
   Jktj6Kwj/7l/MGpTioI9vGxuZtLAxZQsUlvP7FxYSDiqvTatpmy+sTetY
   iJL3ADx/we74sAlAV5GU9vtDgnuqOwwDOvp1Lo0ATPJPR/aEFFur3DDlp
   Y=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 117287329
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Tcerla9m2UkRQ8nigBW4DrUDR3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TAZXDuOO/jfM2vzfdEkYYy+9U8CuseBxodiQVRt/Cw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklfq
 u0gbzc8SCuPis3rmJK2aPRUh/sKeZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUujNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwnmrB9lIRdVU8NZ4qVLOx1UxDiY5UHCR+vq+knKnBtNAf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hRS2NCsOJGkOfxgtSwcf/sLjq4E+iBHIZtt7GavzhdrwcQwc2
 BiPpSk6wrkW08gC0vzi+Uid2m3w4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1XdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:P25i3qhfsbxq4GvEq9x68IetJnBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-Talos-CUID: 9a23:ujmc622TAD2L7M8FIlcEjbxfC580Sjra/VHrL0KXVD5JRZ+IcV6v0fYx
X-Talos-MUID: 9a23:esZclQnp1N9pnFBgKkYEdnpwHcg14p2MDnsilL4s4MqDLRBpZjaC2WE=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="117287329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfWF3ELt+U8XYZ760YiU2MfQ+fW9xAc3BMgas1RFXXI6wiY6heupJ/oz9oHkbklIB4JFbzVCgvtip+KBGnEwKScouaSrn69ip3jBvOvnBkY4PVA1PQcWJjLTz8qpuYOqkpLd8z+i0DailaLRFn0+pJHUyzr/BO83ILvij2BlHCip9j3FkbkQfiI9yi4I9SZHoozFJnbCSaUcBo+vC0aaURvaIo8WjFyd7G/oZ1bT2dZUqPN4wHHrXI1fJ86SlV02LAThBynzMFDr6/U9lqE82Dc82A9cXJQ6CuK//dMoi+414zzMrjbMeaXR35f5R8VxBjJjW2EJY2P72N7+225B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c653+j0zoweL4IRJptdfesKu5HCIHmQiVtweC4/qRXU=;
 b=aB7KUcvtrTNB2CMKDxbXPhJH57e7/Nlb8Y2v5zfyj6wuQ2RmX9SOrhwP60qgGVUzbVIrYrMasFQNhWHnNiwuo9A+EFo78RN6ytSxw0opmbJHIwogHaMNeGYibr0z1Noecz5vsvOCkouRHbp/3pnSyq5O0hehkvcgqq/TDK8RjVcR9IHYNJgVePiTLHsRZf1HRTTDRSVx/XTa4Lxj8iywQlGfpBCFVrT6hpi7zyRyZAOvGnSW70n33y/Gk73tolB1pmGSfUs6/IM6Yzhy+PI/lE/x+SubjdtKq731gwrJQx82vx3cSmfI37WJTOmzniYfHd3vtGbefdfySDpp60Wlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c653+j0zoweL4IRJptdfesKu5HCIHmQiVtweC4/qRXU=;
 b=lx6uV7abnxh6b7jn1CR81BHcKU1eUkFrKmZSHJvVheMwdcTWTpDSTedFIrLXWMgMKtKFXUFmXnCcrvtzdbnQMdLFUB90vlH6+EO+P1DPj6w4fq+kKLIik//9N3zp12pgfKES/Tv7Gvcm3KsHpU1kGS5PXO/dxljuEWSn3ITw1KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 13:32:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 03/13] vpci: restrict unhandled read/write operations
 for guests
Message-ID: <ZLkbMcRNZ6trjE6X@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720003205.1828537-4-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d92a9b-d946-4684-17b9-08db8914f269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pGytQU2fZEld+2jB0MMSsp4VGa33HkErhQEnV3K9hFCi2RgB2q3/Zyao/QENq2q6MBBT3rZiAjL/mrsvPkoinzTTqPulhdxtXuyBxLA+BXUXn+jR6ZZ2lJwcULAhcq8sUxBpPFc4lY0bf7uT+LCXMzGSgtKnC6JSOQHO121Uw5vOYAV2KlMcNZc2z9LtNDyzm6p6Sir+OTqSq5QoEK/SxI4QT5rGOeFc6jO0dIG7XpwA1WArKmiLbT90cSyrC/VMSKSuidh8MKM3PPV4+9PWaUc8dBmS0683XGY+plBS1Zol4+IrTgmXvezeLOMu3++gsIowXF42KtpUneho2QYl/iEv4KRWzgbU9yRxo4Bz9SRqNSprXgGNRn6mRtQfdU2I9jw5ZKmZdw29oZcbfrBr0mHdbSjzbCtjoO2z+eM4IO/86BjfFHY1S7PIv0NfzqYwHIVHAFCHKOlt3k0O0qu6j4Yr+oTBdMh9ayfjWzi2p7bFTko02ga9cxZSvGubfke5wWYC3lyN0UHu+x4SJPP8dsvSZJ1Nz0D6oOuYWMsf2xCddAtWK/Czvh7T8YCGbRkI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(2906002)(83380400001)(86362001)(85182001)(82960400001)(38100700002)(26005)(186003)(6506007)(41300700001)(9686003)(6666004)(6512007)(6486002)(6916009)(4326008)(316002)(54906003)(66556008)(66476007)(8936002)(8676002)(66946007)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZuZTRtRTJaanRnQjdtMU1mU0pGdVNCR3A1Q2RUQUc3NjEyMHI4TDdxK0pV?=
 =?utf-8?B?NHdEY3J5eHUvRXFFNmR3N2RpUVpHeEx5VkZQVGJTQ0lmbFljaGliMTZ3VHRO?=
 =?utf-8?B?VmJKS1orQVA4OUd4ZFVaOUR3LzBYTm1NQ0c5d0pjcGx0S2M0RXZLMjBPZjMw?=
 =?utf-8?B?dzBUcHJScHhPWXE4NTYyajRnZ0NxUXVQdHB4UWJXZVpKZ0RMR01HQWJaUmlz?=
 =?utf-8?B?TVVtQjJHT1Nrd1BtN0VKUUF2WTJPNjVjbEgvUEpPUWloTXRUb0Q1bUpHTllu?=
 =?utf-8?B?Y0hTWTFpRmhyU1ZOL1lUWE9kZGVHaFRzMFVIR09EYjExcmcxSE8rNnZQOXN1?=
 =?utf-8?B?cWhlaW5YOC8wQkFSSjNyd3krMzVzQTVVUEZRYlRwOW95SkRHdExZUmsrSHJG?=
 =?utf-8?B?VXMwb09NUnN6SVhkci9Jemh5d0FNU3JiYlNDQ0VjRmRXQ0ZLUjVhQXcremtG?=
 =?utf-8?B?TVFVY2NxZ2VtM3l2YmVYU2dKb0ZNVUZUVTB6d0QxTlRzUGxlWVlqYnh1TkdU?=
 =?utf-8?B?UXZqVDFNNG9ueFZNVGxpZDZJSTNxTkp0TzdGUzBQZm1DYkxYdEk1MllRMXFG?=
 =?utf-8?B?NnBnMmV5Zmd4SGRrbk5sNFBUME5WVE15VDdQekw5T3FqUmJFODNLRVhhZGxJ?=
 =?utf-8?B?ZnUzN01MdFM5YWptTDhWaTQ1dmJMZUZudGxZMXpHVVE3d2QwU0M0VHJCRE1o?=
 =?utf-8?B?TlJlaWlGUnREc3hiUXNvMG9pQWlmenlKMFhmb2VoelZGYW9qOXliL0NxOHRW?=
 =?utf-8?B?RE41OGFCSnIydklCdkdrV1VQbG1VNjJUbnJXMEZKN3FNdWwvVFh3ZXFta2xS?=
 =?utf-8?B?eFdBSzI0U3I0a3I3VzRXRndELzBiQy90MEI1bEU5SmhnVHRSU1lWN3lPeVh6?=
 =?utf-8?B?bUdkcTFVdFhOanZ1cWdOYUc1QWhIdURpNW8zeVVRV2tCbVBiVHR5djAwS3Fj?=
 =?utf-8?B?ZkJxb2tReEFoSDVERUpOQk9QdktIU0NoWjhVMU1ZNi9vcnN6OGhFZWVNY1pF?=
 =?utf-8?B?b3diZitNaXR4NFpsMVhITmlucit3MlVHMGpWSWIrRVIrdTlEZjkzWnVEa3BT?=
 =?utf-8?B?RmFOM1QrdkNUMHo0TVpoOG5kMkgvYzVoRVRWdkt0ZjdwQXBuMHc0dU5TY1dK?=
 =?utf-8?B?d20wbm02NkRDMjg2bksyTjNWRFk5aklxNFNBMHo2ckNOWGRjbGdXdkt3YjQz?=
 =?utf-8?B?MXBPOTdNdVl1T0RYbVZUUk9Sa2tBUlZDRTVXQVJPMElXUFpPeDVidG5HUVBa?=
 =?utf-8?B?V1QyMm9tdnM1bm4ySGF1VUJ4d3ZwYWR4WjkrOXpMaTcxZjI4c2UraUFkSVpD?=
 =?utf-8?B?V25DZUxka0ttaFR0VXlKNXU3Q1A5UjltNGx2dFV6U1ZNUEJ5a2c2MlgwMFlN?=
 =?utf-8?B?RVYrL3IvSjhNNzZSQUJEMlk1cGFxQXdPck13TEMwYmVWbHlRQVRPYXJtL2oy?=
 =?utf-8?B?YTBma1lUaWFhUTEyOTVpWXZvdGFBaHRBdkRhbUtWZnFKRHduc3N3VlA3Qmxq?=
 =?utf-8?B?L0ZYbXhOTzZlRnNMbWxhTEllUnQ2T1krWE8zOFdoZnc2bzRIeW9ST0FrNm1P?=
 =?utf-8?B?UTlPdFZHRDBnMDd2RU5TbW1IcnFmSnBEdCtRdEFvU2xBalNXQThkK1JOTW8w?=
 =?utf-8?B?V3NacVJINzFodE1lY3VjM2RYZGlMSXVuQmlXTDZFeHdSV1lPWEJRRUx1NFR4?=
 =?utf-8?B?Rncrd2kzQ2JrZE9tbDZTMy9PNTM0T0pFWXN6aHNDSnRoajJnVEZGU2NmMzBm?=
 =?utf-8?B?cmpFU3U3aWdlN1VNQkR4Y2x1UllXQTVDZ2lhL3VjalZsR3FZS1RPQWp0R1Zj?=
 =?utf-8?B?ZTFzNC9PU2lDQnd0b0t1V3R6ajJ0Q1NmQ2dhOTJHK1RBOEFyTHBaaFBMWGJz?=
 =?utf-8?B?bTR2TUF3ajdXN1I2bFNydGg1TTVNNXBnSVNzRHNYbkhROVllVnhiaWNpYXNx?=
 =?utf-8?B?M1dKUFBnblZMMXAyVEdMYlhRY1IrRUpYVHFaSm5Ec2xGR0x6MDNGeGkrWlho?=
 =?utf-8?B?ZklUZm5ZaUdBRUJNV2hCWE5lOHdiZjFtNEFJYTBBRm10b09tQ2N2cTV5cklS?=
 =?utf-8?B?dXhFUWsyTlVDWW56WmFRWnBZR0gzMzVlcjNPUlA5Z21xWXNNRmM1K2FEcFVE?=
 =?utf-8?B?OVNKdHVRTDQzbDhHSXZHaWZ5cXpBRis1bGU4ZkdvNEVBd29BMkRlR3ptNUF3?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qGCcfxrAD5aw9o+Ykmdi9whvuKs3sJSu9qIeLQS+cOrw02LW5rpm3GayD+wDF5Rth3gJd0DnDe9totLZweGhn04GI6NwfEAzSkmKgTYRiLieK38l2rruU477K1ZAjMDIjzOYm4WMCwGiKeoS9RJ6DipJSykPr2VpYrT94SWH812M3XoHZGp58eNiR6dbKeybPAqVRY0ztfCb89d9Odyp57+pDd2pUGDAAp/3kyrAMlqqrA6ahT5I0wzjmmTTGtFPJkowGtm3SurxOAM1FDElgN2O9Yc78U4tM8z838VWKIb7Rg7qeRNxDMIwZ82zpEWOb3VQteZAfwA6uYHrnjQ7s9vQqYssFfRyhdKqlnNX/aUzsok6J0quV7ht+4mnmXqenhzO/ZyHJC7dd2a60a7pOrRuaRLmWJEtRRr8B1P/JLZycGffi4RhkT5jj4DjHdKCxRXc4GT2xBnHLqeQL0mVHhlydVDR+5ag8bFCIAvfIP+C+1Nbnr0WrNViWR02lt/ygs7q0V0uo3MQ+3GQxQJA0g9FkjeEiIKUeS94WydrvMx+j7CK4BjVQR98AmtjaJ4YzRRgPLEvP9rxYjR3ekzaGNbHHgGi880WGMnhFMEZ91+MUgBXFGlfcXaNSRgqZ3IOYmVey8wu6SgkpMokX1mfi60+ylFD49SgwU1jt6Lju0qVqzPKgfYLCWVng3PFoRD9GQLXejmTkKP6hu+M772EjRZA7S9ic4zCDs66ZMc8Rrrmjm9nUMg1MednXQcqPbUxSuT7/hcJid+0XHblyhG3daMrRFd9k5MkIdQtg4aMB2KnOICCn1v/8edeqduyfIF9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d92a9b-d946-4684-17b9-08db8914f269
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 11:32:06.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs7vsUxIhuIqjjbmLRANNB6noOFDjulZ4DZ7M/OnlNLV1iMdYg30GasPY6zOikgUZEfQdqGXsln6mwVupv0H/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6259

On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> A guest would be able to read and write those registers which are not
> emulated and have no respective vPCI handlers, so it will be possible
> for it to access the hardware directly.
> In order to prevent a guest from reads and writes from/to the unhandled
                                                            ^ extra 'the'
> registers make sure only hardware domain can access the hardware directly
> and restrict guests from doing so.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the stray change below removed.

> 
> ---
> Since v6:
> - do not use is_hwdom parameter for vpci_{read|write}_hw and use
>   current->domain internally
> - update commit message
> New in v6
> ---
>  xen/drivers/vpci/vpci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index f22cbf2112..a6d2cf8660 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -233,6 +233,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
>  {
>      uint32_t data;
>  
> +    /* Guest domains are not allowed to read real hardware. */
> +    if ( !is_hardware_domain(current->domain) )
> +        return ~(uint32_t)0;
> +
>      switch ( size )
>      {
>      case 4:
> @@ -273,9 +277,13 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
>      return data;
>  }
>  
> -static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> -                          uint32_t data)
> +static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg,
> +                          unsigned int size, uint32_t data)

Unrelated change?

Thanks, Roger.

