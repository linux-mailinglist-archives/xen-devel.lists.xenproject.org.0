Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE9620F49
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440010.694064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMws-0002QM-Qm; Tue, 08 Nov 2022 11:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440010.694064; Tue, 08 Nov 2022 11:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMws-0002O0-O8; Tue, 08 Nov 2022 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 440010;
 Tue, 08 Nov 2022 11:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osMwq-0002Nu-Pw
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:39:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9cef45c-5f59-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:39:18 +0100 (CET)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 06:39:11 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6747.namprd03.prod.outlook.com (2603:10b6:a03:40a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 11:39:09 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 11:39:09 +0000
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
X-Inumbo-ID: f9cef45c-5f59-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667907558;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=58ZD3/jE90zkuiDXhR1Z9QDeDp4KrVJlX2KilyZXQS4=;
  b=AbobeuOTeogUTgVka2OYYHUXV3qDFQlr4Xdjy2XjgzwcPigwMf8P3ZyX
   A9GnafLwIKxWNKIy70UJ12IEJj795Q2bmUPO2CL9anaC8W1nW8tcLJUz1
   xKXBwM6VGg+YeaUaNrDSAKrKLVwuw+akLLPbfiwjqBHBtDRyIuUZSwmV3
   8=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 86915644
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mYwPoK0+aKOdj4g5sPbD5eBwkn2cJEfYwER7XKvMYLTBsI5bpzRVz
 jcaUDiOPPaJZDanfdogPYm1/UMAvJ7RnIRiGgM/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLkQex
 f8kGjw2bxmu1rO3yuuRWPtIr5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFMZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r82L6WwH2nBOr+EpWF8PIx0GysyFBPSzMIcAOKi+jmjRWXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRRturCITXOW9p+PsCi/fyMSKAcqeissXQYDpd75r+kOYgnnS99iFOu/iILzEDSpm
 zSS9nFm2PMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:GfCMoKqoMXsWprTyOh/QBJMaV5vEL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFmbX5XI3SJTUO3VHFEGgM1/qH/9SNIU3DH41mpN
 pdmtZFebrN5DFB5K6VgTVQe+xQuuVvm5rY4Ns2oU0dLj2DPMpbnnxE40ugYzlLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmX+zpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+78oAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKjQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgAdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfRsRLQkjQ9o+ao7bW3HANhNKp
 ghMCic3ocfTbqiVQGVgoE1q+bcH0jaHX+9Mzg/U4KuonhrdUtCvjUlLfwk7ws9Ha0GOuZ5Dp
 z/Q8JVfZF1P70rhPFGdZI8aPryLFDxajTxF0/XCWjbNcg8SgPwQtjMkfwI2N0=
X-IronPort-AV: E=Sophos;i="5.96,147,1665460800"; 
   d="scan'208";a="86915644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EitHfZOpkcPa7bzv7OKL5Z22f2SIJo/mMQxnNi9FD4SJhCkAhf7Mkq7DxPijq02lNXR9teqc9MfPRSuWnxYKk7lenxsRALnRNWMGaWxtu29wKjF69py3E1axzOZtioEaiNpCRB+Od61JHSp+Ax0jFfz8Wxv2p76vAo8bacP/waONrl2Uab6LWTDjj/wVgTr+hsKIZoG7kLA0ABwnVE5Dx1iq47ZA4Nu+ceW+9AyDDcD2OZAakpCh6xe+13cvxXO9ut6i0fklC8L9X/4/y08rzejojResVIgakz0DKQwEpe+EgML+eEJOnadRpnm+PlNEQE7EGr1IzuQw7TCEzQk2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuHguRhkn384S2div7GHC9RgTOUnCSdIgdLDcC0eJSc=;
 b=bsEVIgIY1KrWz4haKP2DON1DNQsjCgV4lT/zEpO30UD3Vxd61OfBMojtrSsOANxHuMblvSVNbx8xSpwNZzZD++zVME6ysOSWakjQVUuqNTNy9YGdpZ464oQ+qS3qC3E96KzhDnstzLFbJJ8Mqwfux56JWq2igcpmHD286Re9ekbCwnY7LivSVkPdGTp3u4UrJOAJk+TqaRCUJ+0eDQ6eQ44bc2brZ2afZZgGZtAgrDLRKM+GFZeLENplVuncauLeGkVEXfcYfKHz4dpm8Yl0y2pUOXaEVTeIqhM6rM6fzlwPYCBicpFuAwZIqQPl43bDEuc61/2Y2m7GDf2B7z5kqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuHguRhkn384S2div7GHC9RgTOUnCSdIgdLDcC0eJSc=;
 b=sHPXz/awwik6X6IS4JRqVshfwlqNun/Hq31vr4CayEAkUehLL/d3iVRSKYWLa17IAgCxCMepw/u+F0kiS0a+5W6RiuPrR1SrOFl3XLYoltSiAUuMwGhAuAwESQMj/ERS5Nla+rDcIMomrAiQ4+caeEq7jAIOgloxger9qcpI1us=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
Subject: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls for dying domains
Date: Tue,  8 Nov 2022 12:38:50 +0100
Message-Id: <20221108113850.61619-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0385.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e7e1f7-bf5d-4390-56b0-08dac17dd99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nd6nyQcHd6brlgUgUFm0ojqXEzvOTmTJJ89qORBoAg1z8ZxjL49U60AwwPgWUq8bxPVbRx/zartRz5+JU7raCn+sHMWu8emQi5UZUVJ0k4sI2oZPGqaIMrXdJqjUNUjPEl5yAWrYSIvsXk2Bu4eG1vpWJ/MXSRKR5VXdO+/44D6hiBUyv5Xt3U/VdRA+w1vaoRD2444DwHwdBdttK2tXxsA5Ejwzth4/FPNkQkrQVK+ueJJdLhBj1TCO7dwsgcKz1blAJ4xvE0dN8e0dgsAGBEYgjEgeYLPgcYoi5MZOedgXDxd1JXi6vSZPv4eYA9EXDykSF5+qYVCd1YwGnt6h5Yxy6c/J3ga2W9e1aZwWVBynaz39ppcyBWknJnO2SWd3FthpXgjpRXzjdmjhmNBiDN19pov8GTwESn5kroo9wcCKNeDat2JBUFsV3oeogvjCjJTb80jlSKKd1g8pHr1Tw4GCjAhDg5RBWTZE1iXymS5Q96HmLOSUMrE1GrvavufYdcqs+ejvIPAS4VlKPdedOwmAROMixbCepwGCXYyUD43VLNnQf8yHrSLgeTwmWoYCBuLd6GDSOFg1mRrfXwx7xs9eAj3YavPp14LH0xKv7BwtPcJcK1lfsnt4wPNWTk/ABBLASEG2mPLvC6qcX+J+Fv/mKtqPQ5nYJw1XJRCP/a7Z4/mJij66WnyAji0prDg3uZM/G9cO5g3kXu+9yl62Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(36756003)(66556008)(86362001)(82960400001)(2906002)(1076003)(26005)(6512007)(5660300002)(83380400001)(38100700002)(186003)(66574015)(6506007)(2616005)(8676002)(4326008)(316002)(66476007)(41300700001)(8936002)(6486002)(66946007)(6916009)(54906003)(107886003)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEc3bkNzNzhoczdvVk85bEpPL1hVQVVlWlJTV3BzUXVqZDl6MXJPTzhaNnU3?=
 =?utf-8?B?dWVwaXp6M3VGMC95NWlEQVdab0YwU1k1R2FVMTd0R2RJdGZHek5QSGRhNFp3?=
 =?utf-8?B?YTc5ZExMVnhOMXZpVWRKQlkxZ2kxbk5hT1RzL05BOVFJSU5MMHRBUWZ2SVpK?=
 =?utf-8?B?MTM1S1FqangvOTNDZ0NQc1o2NTVxcjBaLzZHcWlhSnJ5WmROaFBJb2NZa0Fq?=
 =?utf-8?B?ZlphclcwUWxYQzFsUjA0cjMzcExZSmpnYkFQQUdvTnY4RlIyZW5TNDkrNjFF?=
 =?utf-8?B?QzlwZHFpOHRSREc4T3dOV1dNUWZUODdJNWVGSWlxSk5SUkFYdGhER0JLbzVX?=
 =?utf-8?B?YjAzRFpGaHhUblJTZFA5Tjg5enlMU281SGxUc1lCdUlBdjVFNjhaek5ZWmcv?=
 =?utf-8?B?RzBTa3ZwS2FuMTBRakFaMmlBbTI2Zmp0bWVsY0ljTVYxTW96aFMrQWNHRlB1?=
 =?utf-8?B?a3MyTXFxUjZYTzFPTXFSRFp5VXZHZkNxZnhQK1RHZE9XMWpERjQ0aXpoM1hH?=
 =?utf-8?B?SVZqbVZJQkVDcWoxNFhLN0ovUEpJa2w0a0RtY09mblY2dnA1WHYwSk9LdG9J?=
 =?utf-8?B?NTVKVVpoWldXTi96MC9tUkhHZjZ2UVM2QmxYa3FBemNHYWxvNFFRcTRaYWJv?=
 =?utf-8?B?WXBJVUtuK2hiZWpCNHNMTHAxSitJSk43cUVLcEY2RW5CSHRNZHRFWHBiUXpi?=
 =?utf-8?B?TzJaeUFYdWs2cnJRV2NwTkhhU3lxcC90OXQ2Qk92ZHpaT3hHOG9MaVlwazg1?=
 =?utf-8?B?NGNFTUFzYlNFSVZTMTFwaU1JbWdzUmt3RFB3STEzbmJQUXMrVkw4RGdQSG5G?=
 =?utf-8?B?endkWmVSUkxkUnZBNnkxMnVQd2tsdmVlazM1NzhzVTZKQnZjR0RrTUplWmpR?=
 =?utf-8?B?TDVIK0l3SVQ3NmJhT2dhN0s5RVE0L1I3bHptUDVzU2ppWlFzZnpBdzBCVDdp?=
 =?utf-8?B?c1loNTdhYmRJSGorWHRaa0ZKNFc2eXdtaVhPNi9VbENRZUJPWC9WdTNQejlo?=
 =?utf-8?B?Sld3Q1NoVDkveC9KRTVrWmxCOERucEdEWjZkODVDdTV4MGZQQ1kwNE5LMGZv?=
 =?utf-8?B?TzIzaWNkZXl1d1Z3a09ZUWM0d0s0SEJBVUpYdWthRC9pLzhMRXhnaVplK3Vt?=
 =?utf-8?B?NFpIdHJFZVU5ZXFzVUVQbVo2aUFoaHJtN1hRQ0lqcS9GSlE1czVlaWZ3M2JC?=
 =?utf-8?B?eU5sbHM1ei9VSWNCVkVsTWg3VG9DYXEwWkJ6ZnkwODNCdnVTS3JBSERuaTRp?=
 =?utf-8?B?YzNrNmQ3b09NeFQwUlEyMVFSRURsWitWZDVUc1NCTDhQdC8za1JheVZ5US9W?=
 =?utf-8?B?Q1pPczNXam5jM0lDeTZpclFiV0lLYWJsQmN2YTVuSjNPeTJTcFRlOGN1T291?=
 =?utf-8?B?TTFKK1V2cEhFYUtXaUtCWjRzVnM3TGxkVVZCbHFnWTVzTFVXT1dYc0YwdCtZ?=
 =?utf-8?B?WUVEeEp3UUMzWUgrbm90Yld2YjNyd1hTM25QV1Z1UHhyNjdnZ21VM2dSLzVi?=
 =?utf-8?B?eFRHeFNXZzl4akxNdFRqNFFrMnZjc1ptZUd6RnBsNFJmWGs4aC9XeGM2RFpE?=
 =?utf-8?B?cExHNlBkelZ4UU5IK1E4dVNiMDBRM2dFNUVGNG5tWTZqaHpoejFodjZEUFA1?=
 =?utf-8?B?dURLMTVVMWNCQVBTeGR5Q05RNmpGTDRxNlVvODlXaDZGaVVkVlY2dlRpaVhF?=
 =?utf-8?B?bXJMekwzQzVFK1dydWttZ2VQVjJPMnhWUlIyRE9LNHIvTG5JYmRLbXlTcjhy?=
 =?utf-8?B?dnc0dlg5dmFxZENqYUVnTzBqb1VmeVpNRDhSV08zaFZEWHhWRnlLVHdlaHNT?=
 =?utf-8?B?eVVNbkpMVFRDc1RuNm9wRG9VV1F4ait4M2tuaEF2ZmNxaVhTd3FMTlIzcmxn?=
 =?utf-8?B?NmtTMENSb0pMb1g5alZLbGhTQTdRcmoxd2ZjQUdSbmVoWlVyaXljeTBhOUho?=
 =?utf-8?B?M2tQQjNTMmNXdjFpa0x0dFhmQTVzQ0JwTmNzWDc2b0hoa1k4SmN3M0I2ejdB?=
 =?utf-8?B?YlJoWXlDSUU5YkExN3I3RFNXR0dUU0tFMzhuZG1aY1FaZjM4c0hucEE4OXhZ?=
 =?utf-8?B?dU9KeVhDemlWVGlIdXM2V1NOcDlZUW1pMkpvdGdFS0hjUjJlRFRtYkU1QkdT?=
 =?utf-8?Q?HBT0zy1mqd1anUiDAiVoFXgo+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e7e1f7-bf5d-4390-56b0-08dac17dd99e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:39:09.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8ZFg3FIACuZ2vbZKn6dSf2vZWza+JZxKTC5esCRZr+Mo3pMFz3HSHTswMusETTYpwjx9W2coDsUwFtQOO4rBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6747

Like on the Arm side, return -EINVAL when attempting to do a p2m
operation on dying domains.

The current logic returns 0 and leaves the domctl parameter
uninitialized for any parameter fetching operations (like the
GET_ALLOCATION operation), which is not helpful from a toolstack point
of view, because there's no indication that the data hasn't been
fetched.

Reported-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm adding the for-4.17 tag because I think this is a backport
candidate to older Xen versions also.
---
 xen/arch/x86/mm/paging.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 3a355eee9c..3e7be07e86 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
 
     if ( unlikely(d->is_dying) )
     {
-        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
+        gdprintk(XENLOG_INFO,
+                 "Tried to do a paging domctl op on dying domain %u\n",
                  d->domain_id);
-        return 0;
+        return -EINVAL;
     }
 
     if ( unlikely(d->vcpu == NULL) || unlikely(d->vcpu[0] == NULL) )
-- 
2.37.3


