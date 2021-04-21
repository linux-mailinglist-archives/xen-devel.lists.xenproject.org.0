Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E81366EFF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114833.218923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEf4-0003Iy-Ji; Wed, 21 Apr 2021 15:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114833.218923; Wed, 21 Apr 2021 15:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEf4-0003IZ-GX; Wed, 21 Apr 2021 15:21:06 +0000
Received: by outflank-mailman (input) for mailman id 114833;
 Wed, 21 Apr 2021 15:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZEf2-0003IU-Dz
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:21:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ba62af1-fb4e-468b-a5eb-b044a10417ed;
 Wed, 21 Apr 2021 15:21:03 +0000 (UTC)
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
X-Inumbo-ID: 4ba62af1-fb4e-468b-a5eb-b044a10417ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619018463;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vQXMXG0vz+VKlSEImM9pCwAG/MRBFzoUit988+J3aSo=;
  b=RTRuhcEnpupTq65p/Z2EskGM1K4CDGjZRh5UPATSNKOo0pT3X3Dmdnn/
   Mz7FkshWILDaY7i2l4TeEd2qfKbeiq6/kt6xNdccgCpoc67YVKeLj6Lcs
   cwzQHRAfGJ4Fs9rT5q5dASG0AEZBPqfDZSSbO+3EAdoer1NHRiYfHd3a4
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CeNDIFiZ0k8xynsqjzHhQZ5xaVVOUMMLnxKahszUHRgj7GDNfbppHOnrSHm2JX+VykC2UMVUZ9
 IHNZ8ooiyIx79+v8UBRw8wr5gm3kB1rgGBQTAFVrWuL88DPSU9dRblqkcuAflb6jxQ59qnSbuI
 2iwct1Vl0+gyNZwhEsfh1b9TCc6iTTVBzUR8G2oPheSgI52/ZbXlPEsPfVQCS+aQEaZYd8wX2P
 FdL1R0uF4q7GBC+BXY+1fko7dvtBRAN4uIpM1lc7z0rDn+gfju7OKdDdxotZAnI1Otda09RKOE
 rNw=
X-SBRS: 5.2
X-MesageID: 43587219
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:30HECqkPbtAYK0UpNMyQTgjjG7bpDfOcj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW57LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm4m/TgkpX6bRkaQyM94A6Vgj+yrJL8GR6U3hAROgk/vIsK22
 7DjgD/++Gfo+i2oyWsrFP7wrZ3vJ/aytVFDNGRkcR9EFvRoyuheYgJYczhgBkbu+eqgWxa9e
 XkgxBlBMhr7mOUQ2fdm2qQ5yDF8BIDr0Dv0kWZh3yLm72IeBsfB9BajYxUNjv1gnBQxe1U66
 5A02KHu5c/N3qp906clru4JS1CrUa6rWEvluQelRVkIPMjQYRcsJAF+wdtGIoAdRiKmbwPKv
 VkD83X+Z9tADWnRk3e11MfpOCEbzAYGxeLRVU6ocqF0zRat2AR9Tpn+OUv2lgH754zUJ9C+q
 DtNblpjqhHSossYbt6H/ppe7r6NkX9BTb3dE6CK1XuE68Kf1rLtp7M+b0woMWnYoYBwpcekI
 nIOWko+lIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nVWKfrGTfrciFvr+KQ59EkRuHLUf
 e6P5xbR9X5K3H1JIpP1wriH7FPNHglVtEPsNpTYSPOnuv7bqnR8sDLevfaI7TgVRw+XHnkP3
 cFVD/vYOpa6ESGXWL5nQjxV3vhdleXx+MzLIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 tySYmX15+TlC2TxyLl/m9pMh1SAgJ++7P7SU5HogcMLgfRebYHsNOPRHBK0BK8V1tCZvKTND
 Qai0V8+KqxIZDV7zslEcibPmWTiGZWg36WUZEGmOmm6d3+cp01SrYqMZYBWznjJlhQo0JHuW
 1DYAgLSgv0DTX1k5ioi5QSGaX4bNlzgACiJOZOsnLBvUCgpcUiL0FrHAKGYIqyu0IDVjBUjl
 p+/+s0m7ybgwuiLmM5naAFKlFWUX+WB7hHFQyBQ41RltnQCUZNZFbPoQbfpwA4e2Ls+UlXom
 D6NyWbdcvGBUdntmlC3rzn9051cWuhb1t9A0oKwrFVJCDjgDJewOWLbq283y+qZlwOzvo0HR
 vFbTERSzkejOyf5VqwonKvBH8mzpIhMqjhF7wlaajUwW7oApaPj7s6E/hd+4tFONjivvQQa/
 +WfxaYIVrDeqUU8j3QgkxgFDh/qXEin/+t5Qbs63Kg2mUjRdXVO1ZrStggUqehxlmhY8zN9p
 p3jdg457Ttdkrwb8OL0qHRYXpoLAjJrWu/UuEvrtR1sMsJxc9ONqiedQGN8ndNmCgaBoPTsm
 g1Raxg+rDPOoN1ZaUpCmpk12tssO7KFVchtwz9P/Q3cl4shULKJt/h2cu8lZMfRmm64DbqMV
 aR8ydh7+7IciuK27kdEb8xKw1tGT8BwUUn2OOJbIvLDgq2M8lF4VqhK3e4GYUtApStKPE1rh
 xg5cuPkPLSXy3k2BrItT8+Bq5V6W6oTYeTBw2LcNQ4vuCSCBCpgqGw5tS0gyqyYTyna14AjY
 kATHcuVK14+3Afpbxy9DOzRKzxql8klFUbwQgPrC+T5qGWpEHBHU9HNgXFhI5xRjc7CAnQsf
 j4
X-IronPort-AV: E=Sophos;i="5.82,240,1613451600"; 
   d="scan'208";a="43587219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX10/zcYKt8WFP/HsftGNsyucT9ajDUVHwj5c4LrjG8ABX8JdRU5wDb/abNDR7KqVzGvhj0KjMbBWPbVAxYSdGLEorByk7cX6aqttsBGNCUJAXq/wJR1J7ovB5i4wDe8N9DLb/xZE3KpSGN3tlW+6AmPnVeLSDtgDflyyJ8GLxHv3p9IQlbxFla0TW7sGcnmEJAywBpG966sRi0YK29clh61W2PetLke9gi4RdY7C00/rvKil7Qmm7pQ8JEWIjoQ7MZmPwAySCJyND/pUFNlACwmB9v+731i1WfCW+OWfm5B5DkZtAqtw44rLj51P+Y+lfvDrS2qawMtOSFQK8gbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rnL1wrRC8Xlighg0QkObbiRpbkamEWJFLiMZEFD/Mc=;
 b=cDoDiKWMMQfxsDwSPtF0qsGOzm8Zm7cHj49HTx/f9XaNs8eM3Dyd4VXxH7JTxabp1Bd9C0YwEMbD89l1M/StSX9hhCgRlBmxTutTScMZInE8c1Tpz0dFwowv/X9EVQVO4k9fsJ7Ll2t3Kgn9CSGAd6KBUurDA/aPOqDAWbVAHFs1vxJM753KxXedAPxrb902qIu4YdtJf2wlcQWcA7y/pxEHDnzgVYg+TDfkjDk5A5Hsxzft5iTF3MXkUZ7+KBEWj6oz/vneUHgwTRLezKIqbd1cyqTtibqsDFqAaMqu+kSRVw/Cx9adKwpAWWLx2D9aKImCTpxbHkFIbvajCpu7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rnL1wrRC8Xlighg0QkObbiRpbkamEWJFLiMZEFD/Mc=;
 b=Kik8+1mw0wjmCR7cgBwMOif51IJ35f8LXE+Gi7m8b+QZWo8QgrmGecy6ykZYy558PW6AhnbYhqJa2wdN9H5nzVTtVxVANqajp3kH855+kTCzwKvVrPmvKF8oWrlUgAC6gGJiQjg/P+OSFjTKTAdfWEPJmd+75FIiY17Xqt7Pemg=
Date: Wed, 21 Apr 2021 17:20:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] x86/EFI: avoid use of GNU ld's
 --disable-reloc-section when possible
Message-ID: <YIBC1XWTQzjykk1k@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
 <YH/8rb0aENMqOLAn@Air-de-Roger>
 <dada98e8-3e4a-94df-0678-bdd2a0e8de04@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dada98e8-3e4a-94df-0678-bdd2a0e8de04@suse.com>
X-ClientProxiedBy: MR2P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2265463c-f648-4273-98ae-08d904d9113f
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60477344A49F1EC07E7396C98F479@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y0Zx/EGL0R40IpgqRDeoddVJgHdZsaVac7gWSJBvWmx9psYIANY0a/zUvQ2w26r8d9Mquzb8lD3FGyCAMCfyBHyc/X/OoY+ft88BF+ZRwfQM0yTaolUk9LmUjqVmfVeHfxi0apEBZ+/WFEuLEfMw7cp0RI7pqOIjmdapvV0zK/AVhB0OLxE+sj7rj7rGO5PiW7OPqhHNcHE57JeFtWweGMMhl82Jp5kPNDBEc8Q+UEuJqzMSRB2gCz3LrDJK8XODNxbZ0OSa62bNonK/ev+erCKKcJsOFIP+5l3yIB40zhMy7v6OybjWxo4XT/iIl2/ORHVCLoLZq5ohdzuyKCLFlR/frs+NbF658CRTbevRo/Q2Bhk95XgpU4PK/VT5ecVJPE2PONFPzOrcWQce6WdMRURwmh/KAZ7sCmpz9VACY76TCPH9ksN7ekoVmLGS7L9tucbyBgoMnAN7Lj9QolI0SKOUFeOnTZUkpm9FRA0uZvvZu3IIGTo4GTEL5CkDHkxKtqS1MJR+gmGORJEOonE3b7PDIK9vF9uECR72URR1qhEQFrL41+I5rKdmzGiw7cHuNPZM+leGCBzvd3enKCYxD4iM+hhnzs2i1j+iYPxi5fU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(33716001)(26005)(8936002)(6916009)(53546011)(54906003)(6486002)(6496006)(956004)(38100700002)(2906002)(66476007)(66946007)(66556008)(5660300002)(85182001)(9686003)(186003)(478600001)(86362001)(316002)(6666004)(16526019)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0RmdXI0KzJYQ2g0WURSY2x0cjZKdXMzRjRxRGtGdUxyN1EzSkU4Vmw1V1lZ?=
 =?utf-8?B?dmE1WGdzcEFRd0t4Snk2UG9VQjdBVmRINHNMY1VXWnBmRndFcmZ5aVBkNWQr?=
 =?utf-8?B?QUJZU0c5TDFlYy9GZE1mR29VUmpPVk52VUVSZ2krMFc5bTVuY20wZk9KRkZ1?=
 =?utf-8?B?TGdON0M2MkM0eEFsclJKdTJHZ2FaeGRDVzN6STZtM0NDeVlOdFdjU1VySmxr?=
 =?utf-8?B?L1BlWjJPdk5xclo2UTkzeUUydVMzYitkbGFhaHh6b241QXF5U0w5QmltelRF?=
 =?utf-8?B?SW5vY2hnUjVUTW9mV0tudzBieTlMY3hlOEJyTDNtMnFVYUgyRW9EQ0ZZR255?=
 =?utf-8?B?QytsR2lPVFYxZ2U0SjJFRkNjZXJCdEVGZ1dKeGl0SjA0Szl4ZGNXSXFoOU1x?=
 =?utf-8?B?WVBqMUhodUJuWTdjNEtVRDFSb0IwOE5ub0VPV1R5cDEvMDYvYzEydjlDS2tN?=
 =?utf-8?B?ZE1NelBRRkJ4Uk9PTSt6eGRzRkJXU0xwdzJjMUYvOHg3dHprd1BpMExROXJO?=
 =?utf-8?B?YzhyNFhnSWJVd3JvTEVyMUVNdEdMVEdqVXlSTlZXRGZSQ3loemlGZU5WSVJ6?=
 =?utf-8?B?N3FtcWxOWFFmYTlET1ZldUZXQW4rNWtOK2tuczNNNWhmUTJLSjVrdG1TcVUv?=
 =?utf-8?B?YnVqK0ZDNXd2TldkWWZXQ1BFU1NUaUVSWDROTUN5eWt2NGlyek5zODdFaEdQ?=
 =?utf-8?B?dERpUWkwaVY2ZDduYmx1eU9oeExpUDlNNUhEcG1CVDY4QUl1THcwc2d6dUo0?=
 =?utf-8?B?YnpHS2FqK3RPR1BjcU1mZmx2eXpHRkp5THJJM0RUWVR6cnI1R3FXZUVhWWIr?=
 =?utf-8?B?UUJHVko2bW8vSTU3ZXRIQzJpbGhsTkVXUFFTYzRsQ2draFRISlc1N2c0djN6?=
 =?utf-8?B?YmdiSjdSVG9CS0F6STNlL3h4aERCK2dOcDlxWVloeUN6RzBlY1ZyaVdDaWQx?=
 =?utf-8?B?eUMxTUkwcndNRVM1VitQUGVxZEViMytQUi9QOGduQkFZaHB0Q0pJMWljWVQ2?=
 =?utf-8?B?UmE1ZU82TU5xSFNCOGh6K1dhN3R1ZGQ3U3pGQ2hsc3ErWFRwTmtPNStqNGlV?=
 =?utf-8?B?MXN4em41YU9mNlc0Wm9Tb0Y1dHkxcDZFZm83NnRtNFY0WHhHQ1Fwb0NWQ3Na?=
 =?utf-8?B?US83Sm13Wm1zYUFkWUdWK0JQeTBIdEhqMG1uamZSSUhEdGV3VEhycHJWSnRS?=
 =?utf-8?B?RDUyY3BzTkF6L1h4NVdDVmVVcHNSRkZ3ZFFVbVpLOEhBcWJDeWRvZzROTEpn?=
 =?utf-8?B?cjNoeE9rMFkwcUNMeGN1Z000aDA0R0loSzZzb3p3NmEvYWRTUThGOVdyYXp0?=
 =?utf-8?B?WFpjdFovTWF5a3JjUW4xVjlSMXp5Q1dFU1haQlFRVGozK1dDdmwzWU16RGJS?=
 =?utf-8?B?NUI0S3FHeXAwZE9EdVJFTi9FOFQ0NUNGK0lEcTJWa1l1RDFhbUVIUnRML205?=
 =?utf-8?B?MzM1eDlXSzdXalNzZmhhMHA4RHVtTFdMc0ZHK2lmcC9VTG0wSUhVRTBSNmVt?=
 =?utf-8?B?OWVybjJVRGMvWHZmWW5xMkd0Mk1jTDhFRGpYenF4OFVwcUFBYzN0bDQyM0JW?=
 =?utf-8?B?Yi9tVkFjdUdsY2EwbjhuSUZoRlFpNXJKWDhGdHR4cmxzb3o0Y3BlU0d5TEov?=
 =?utf-8?B?dERTWC9zWUFaR2poSjE1L09UaFYvUjFnaFhDcHBhUkp2d1NGSHpZcmhibkp5?=
 =?utf-8?B?VHpRd3VFVC9uWDdoWkg1YWFhVnEyOTI3M2I5bTd2N0xwemlFckJNdmFYZHBn?=
 =?utf-8?Q?g3F7b5kQKQBUzDpTmb5urXqO8eau2YB/d4URRr1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2265463c-f648-4273-98ae-08d904d9113f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 15:20:59.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXaDaXkCznOpur5cjeobDI+CBQgt7qokVIKV4pHqywchXu8il9vAhEChZdXSClpcwt51UwD7IXnn1X4wPqJHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 02:03:49PM +0200, Jan Beulich wrote:
> On 21.04.2021 12:21, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
> >> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
> >>  endif
> >>  
> >>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
> >> +ifeq ($(MKRELOC),:)
> >> +$(TARGET).efi: ALT_BASE :=
> >> +else
> >>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
> > 
> > Could you maybe check whether $(relocs-dummy) is set as the condition
> > here and use it here instead of efi/relocs-dummy.o?
> 
> I can use it in the ifeq() if you think that's neater (the current way
> is minimally shorter), but using it in the ALT_BASE assignment would
> make this differ more from the VIRT_BASE one, which I'd like to avoid.

Sorry, I think I'm slightly confused because when the linker can
produce the required relocations relocs-dummy variable is left empty,
so it won't be added to $(TARGET).efi.

But we still need to generate the efi/relocs-dummy.o file for the ELF
build I assume?

Thanks, Roger.

