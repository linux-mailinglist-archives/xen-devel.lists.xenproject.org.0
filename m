Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B494B5460
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272425.467262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd6O-0005Nr-3k; Mon, 14 Feb 2022 15:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272425.467262; Mon, 14 Feb 2022 15:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd6N-0005M2-W5; Mon, 14 Feb 2022 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 272425;
 Mon, 14 Feb 2022 15:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJd6N-0005Lw-9b
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:17:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31832514-8da9-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 16:17:17 +0100 (CET)
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
X-Inumbo-ID: 31832514-8da9-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644851838;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=nJEXXGOIu7GTBpNx6WSSGGD8wujL8FeB7ue9x0gxe6A=;
  b=NhZrxDlgoO5twlwqHR4qSQ/iJFzYufRQKES+33zMo0/5DNkLEsG1Jdte
   AL5vqylJEM3nw8lTNSLiryRFU58uFgBH3RqTmvDsglLKunKhz0CTWsk1q
   ro4qyllsX6DEn1gkW2bbXN0CRyQTnKgyQE04gWM1McE54j7bEUjmsW5Fx
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kJ6PhcQhzJeHNRGLFtUBxsPTmMRAbODhrJX9CJxLzGoLfIIX6g+xmrhoNuNLn/xfeebpA8QFlx
 SlWPUpV+rqUEwP/iBLTfh6YKyNFzh01wkEJJPogjYnfbtyJ0f1CgNFra6ioF1gbMi0UAaB9/ad
 jKvCJUes+hokLedp9PzxN1w4a9R178OWpzzu5kE+d/F3cxP5dK0Xp+5nj6l9ibbyX84KFWi7yG
 8GBwg/sHEC7nuw0pQuRrXJVGRiLarI1FGoZ7oK0E4zyjB/l8QWL5CJ8zuLUcHj49awDKGdAlUs
 Me6FJnMsEI0dXOlAz3GKEjBL
X-SBRS: 5.1
X-MesageID: 66389482
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RW7lB6144WFc6w+qO/bD5Z93kn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/2yp0NVv8fTzt9qTQRr/ihmEygTo8PMVYvAdxr9MijCfseZFBk+s
 88SNtKddclrFCPWqkf8O+Sw/CQtivHZH7akYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Pv5+sDSZAD8gTUqOGhP5a7b8h0x5P2qtmlIt1ZvPa8R7A6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqlt/G6Ezaua60TKm0xK6YID/xEgSzsAO+vxjbqBEMx4L02/hc+1Zk
 72hi7ThEW/FAYWU8Agte0Ew//ZWZPAuFBfveBBTgOTLp6H0WyKEL8ZGVSnaCbYw6OdvaVyiw
 NRDQNw7grJvsMrtqF6zYrEEas3Ot6AHNqtH0p1r5Wmx4frL3fkv6kgFjDNV9G5YuyxAIRrRT
 5I7TgZhUxrpXwMRHG8LIbEOk8KComaqJlW0qHrNzUY2y23azQg327nxKtvFPNeNQK25nG7B+
 DiApT6gREhHaprPklJp8Vr17gPLtQz2X5gdGfuU6/huiUW7zW0PEhwGE1C8pJFVj2bgBYkPe
 hBEoELCq4AJ6xeQaoPkASGBsSCB/UcDRuRCCfADvVTlJq38vF/CWzlsoiR6QMMinN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLgqs+kxbORdZLC7Oug5v+HjSY/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZlYXwTnZYWyM0h0nQra5Tq+Y5n3xyekVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW80ap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voXsGia24hTmFfK0QfUYXY
 8nzTCpUJSxGYZmLNgaeSeYHyqMMzSsj327VTp2T5035jebBNC7IFO9cawHmggUFAESs+lu9z
 jqiH5HSl0U3vBPWPkE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZEQEJ0iz4XE/bO6HteFHH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwRFmWZq2xFN8GVQU4LXE3DuD9i9hGNPVAXV5VhWxbI6pnjeA7u/zMJFS25qY01p
 LjI6+8RacZrq91KAJmEZfSx4Um2uHRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKxQ4Ys4d1H7tx47g54t/j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQdIdgQ/b+mF2fUFoRXo7Kw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgqu81IAILvjQZ3mFhObYaFV33z6ZCLLd5NLlMrM
 nmfg6+b3+ZQwU/LcnwSE3nR3LUC2cRS6U4SlFJSdU6Untflh+Ms2EwD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0ef2D8joAaBKvhIxw99Wt3CGkx3E=
IronPort-HdrOrdr: A9a23:L0T/Sq08J6Pl5yvszJaLkgqjBRtyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHO1OkPYs1NaZLUfbUQ6TTb2KgrGSuwEIdxeOlNK1kJ
 0QDpSWa+eATGSS7/yKmzVQeuxIqLLsncDY5ts2jU0dNz2CA5sQtDuRYTzrdXGeMTM2fKbRY6
 DsgPavyQDQHEg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7nvZKqm72JeNt9MbsauWsRSGqr12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwturQaC50YvIbf2RYUh5rD3xnklWqvo3RiKn7wPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJgHcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3d07lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rdV2G9D2MSyAtBjWu7RjDqlCy8vBreDQQF++oXgV4r+dn8k=
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="66389482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkFcz1YxNAQEAPWDwlVD0X9riGZL2sAuQSXcu3FKrLqPI6xk7naG/3V2KHelaJ2ODG/VmBk3MfF6IqSOiuWzLVLvNJyR3vCfEGhacREx740ndDXmyb1HglqLLi6KtNlrT2qbcE54jYRWB42ePep3PWuZrli07mkIT7l0KmTQHCIPu5e8mNTZ0axUCg6KWj4+eHZjqLRguziXfyYCkhJS4NDwXh0qnn0XwKofAx/DjpO7O9IUF762ooCVPv5/ZwXVj+pwUIztiH7IL8Nss+twHmeFMJxsVtShHoyKPnNZSQQYUTTuvxipg5IuWxg24EgCng4ODuogiwrqzZ6XhWFodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QDCjobhHRG4WvmAcU9SKx6bVChagoBEnZR9RONAsKs=;
 b=CRinQ8GcqoBQwr9pNSkqzC6uKpHMegYViCVFuGZCtHXnRL6ytBgmxF9Y+fepvqoQpvRGV0L/W38VHvZO/TCS0vBfGKMhKSO1KNIwByOA33XVEFBm62k9SBUyEi6NNjIa16p1hxowEMxHL5olFFPsMBBWqoPS3qXzJTRzgf6/xtLUG8G0/QwP2AFozlekQ4uKxWZTRVdYyB8AdmkQsKh1A1mgHxgpm55I/v5qbKt6NGm8MwLbpExgvsctFzOPvWdIFh9ljnBlA/U9GKZWxRChwULA2ukgL7rtN1lM/LJCRN6vzxOiURrXCITbDjVdFZ7ZxmrUjbvlf01Yvd4c2ztmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QDCjobhHRG4WvmAcU9SKx6bVChagoBEnZR9RONAsKs=;
 b=VQqogCFJ8LM3+Od4cJPwCFeouW2VWtlE+ywtAvd/LVLpXbuQjbPY9yIcSTy4hvjLWgUU7PVhrAGsyD+reBIBLW7ys7JQY0za3yw28V3FgR4jyLuA+BM4D+gS0SyvzoaaWUvB4QGriRyE2wu5+gIdsyvTR9pI9cMY5oPhbQbJr3Y=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 12/16] x86/p2m: re-arrange {,__}put_gfn()
Thread-Topic: [PATCH 12/16] x86/p2m: re-arrange {,__}put_gfn()
Thread-Index: AQHXcbin3fzAUbYfoEmIVyqXxoG/7ayUiG0A
Date: Mon, 14 Feb 2022 15:17:11 +0000
Message-ID: <210E97D2-FFDE-49D9-B04C-1D001F1A4B3D@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <61ea9272-c4ac-c2da-e1da-8b8930d85264@suse.com>
In-Reply-To: <61ea9272-c4ac-c2da-e1da-8b8930d85264@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b53cbe23-f699-47a5-3990-08d9efcd12f3
x-ms-traffictypediagnostic: MWHPR03MB3136:EE_
x-microsoft-antispam-prvs: <MWHPR03MB3136D135E82EEE2C5D3BC69C99339@MWHPR03MB3136.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4L4oWprF0zCrvXoaGXKOMKrP38tYF91oKVGW2pQMkMUMEHFM5d6GkatjsjdPOXcL1BXdlDVRI0Mtbt1FUKqzxd0iBZUhhgJPDrd63Y30IhaFRtD45zGwEuHerVh8V9oFgEF0ym5JobJYUKdghoJAH/9qDJ9P5ExFT+Zhr+sPK+tjkjPMajsEtMsHlAZXKLeZG5M4rJKdRISPTnXaDPBa0FGaKkxZgjzAmBtnN9k4sIJu9JosydkBR06ILBvjQMtWdCTIW3UWOy7K5hrSK8SAhBy8rSS7mR3UYH0Jc7Ba6aboOf1UGph6R8MtBxNpSjhoqdn412lTdLIre7AfoBeuaeCD8j4oB+QxKseCxcBa7GJC3PfeKyUll+6kAC8zKE/UHWvReNhNOFUK4SG9niz/raDyL1PHPFauMDX08giF6adkd6SEqbnE0Lp4ZefE62d8C1NSYY8YdUQkTnKaRjyEnDUHmr1qC0AbdCHoyla4CaY0Bc+QtcPubFH908J4O0YCejZmi6jKg7f1uxHdxRa0KP4eFUlJcmHGZjZz47B4qw9b1hzaJSHjEPmBAtwkbYNTXoLN3sA0gwtDn/NnNFHag7AvWKTyhbEspissIBa4AOmxYmugQyUjy2/QUYWdkQ+PUe37eQULJbYPSsDdLK9ai/+Dn8If7X9s3q+eTeLnwSIMLD+68lkKKK7+PCqAcYwY0MnCuMVhdNWCaZqBEPD8aDpdamfFckJK8kPD6C8CUhvJ7NUGCM90qieK7o23tuAa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(66946007)(2616005)(107886003)(53546011)(6512007)(91956017)(66556008)(26005)(8676002)(76116006)(54906003)(6916009)(64756008)(66446008)(66476007)(508600001)(6486002)(86362001)(316002)(71200400001)(82960400001)(122000001)(99936003)(38070700005)(4326008)(38100700002)(8936002)(5660300002)(36756003)(33656002)(186003)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dlx8pZhJX/0Ann/1ApSZkktC7kkhaya2UhUTIGTY+4CnEGcBY77s5SWpgE4b?=
 =?us-ascii?Q?Dj9Dt8qMJUX8oOfnnyTfkk0tH4Ivt3RFiUX/4Yq3Hu44AJGFmBCvVj/bkRe6?=
 =?us-ascii?Q?PazlQURC2EHXFrUwuEy2rdLwbrxlvMaM0XZ8+U1i6u84XNCdIDHIzueQ8FFx?=
 =?us-ascii?Q?D3Ygj5VaIpwaKAUGoIPitdMKoj10w/Rfa689o3ZMulN2w0ppzn3ILutPghj1?=
 =?us-ascii?Q?xicsDqmEU1j5KXT+drNrawUhTui1mVzWSC+6PEePOpA+XXAoErZqLLSpkneq?=
 =?us-ascii?Q?G0LeqE8WPq8oxzSS4dJhBHmTfWn1RKrzDqP+YQHAFx60hW25wCNKFQDyTyzm?=
 =?us-ascii?Q?1Y6BSdlxZAkw6p7v+vtjoSI47DlSFHU/d08bvagUnQOU+Ua7zCmst94Z9S47?=
 =?us-ascii?Q?yvt4c2CAEX4KiQUW8qSQ7GCCdoQWXAqwj2NUT6er+nkdfxVkQuq1lVZx04AT?=
 =?us-ascii?Q?WdujYLCwQihm/QgcK8Grv5ie7D8+AsQAzQDM1mLuIBGqsUEIs2dUK/dDcO+Z?=
 =?us-ascii?Q?UhdI39npQvHX9IuO3/pphY89GsFKGoljFvBgQ0ahyyxPLVulx23MhONmBohe?=
 =?us-ascii?Q?VmjPGIsCGfS6kFhVUFx+9cio1roV+gBVrH4kVqG/ol5ZeC1p4GCTHCOWoy4n?=
 =?us-ascii?Q?gNauYA/utZ/lPdcC4UG497RlMbbgQYkc10AW4FrmZ6CEMBBBRKtnVrOWQQOy?=
 =?us-ascii?Q?WqSdrCSAjYOW0vVC0WrRhAivB+57JlEioLAFUuDZ/UCnjnU6kLk1gCSZFbgk?=
 =?us-ascii?Q?/rU/h115lc8jeKXdU//rDI4l3GI6255JzfFrQMKe9YHZScHnVFXvxDLMTACM?=
 =?us-ascii?Q?5HndxsdBXuCL8VsDhOjd/KRR5PHT/broWQjWoJPHrqjHp3048OAl8Psk+gnT?=
 =?us-ascii?Q?phm0Kr+bMcJ3b5Kv06HyqbheYng2Js8lQeSi5Be9OmRjJU7NJtUXYZrsderF?=
 =?us-ascii?Q?pSYn4m9keC6k7H0f/0LWCM79lwIeYDAnZbRyKY9uZI1nvGbec+h+ZkqmmMgJ?=
 =?us-ascii?Q?s+I/sk41P0OSg6E0D0YMha350qHDArxobTqyA8Wyz2qhflKShLBIRSTY88dd?=
 =?us-ascii?Q?9RD9FZcJU/nxmi1s3q6t14bvRxQnzRgmHiVcmr2nPD9xp43tklJEGbN0qFlY?=
 =?us-ascii?Q?gzh8yx0zq5ZCBnf/5cFTITLvW9aR7RqpNNWdN2bwttjH/4pyPDTJsGh0U+Pv?=
 =?us-ascii?Q?Eyl5z5ESaVs8l1FWmeXIbZ6acfCS6nlljilhkrcofLuC0g4GstiN5JcTgZjH?=
 =?us-ascii?Q?VmeaH2rS0nqggsNMG7sHaNmwdiMhqG3kpv2YtzVCuUTSt+RvBu3xOJlGGqQ0?=
 =?us-ascii?Q?zhs6xfOB0GdQp+uRmoYYx67t8zs2FQQAC/JALHzRgnjXAuJXjDc/dtbny/gD?=
 =?us-ascii?Q?ig+MmrGMfxptTJz88XWYQAdpZIIn9jDUyt/9RSgQvP65mXMtJVulJ1ooTK5n?=
 =?us-ascii?Q?upPupp8+4Zi+WKh8y6cRdWLLEa27Vlsg2n4b8MxP8I7Q673maaK6pr06dsvi?=
 =?us-ascii?Q?zf3Io+G2rmOanT1yAWfqbSzYa3JZkaOeUs+VqhM5xPCM8jXXxjiNZmNvgCgx?=
 =?us-ascii?Q?7jl5i7FOJTcn27ZMfih2m1mGl60g8CVvRtmezVpjk7/L0YGwztBLzm+Y+GhC?=
 =?us-ascii?Q?8XSVaJKFjJ33TbaOhZXKTWP2J0TAEoYVQ/VpoKHOR6fBKhx/jBoWOQvRyiT2?=
 =?us-ascii?Q?28pa4CEo/f1dIu4QpB13QW0k1Rc=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_673BA740-E3D6-48A0-87B1-FDF59DA24E59";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53cbe23-f699-47a5-3990-08d9efcd12f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:17:11.3649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZXEvWiL1/Na4Y2PAj49ASm4xiaiHMHVZ2vBW8eg1A9VmKyFXq/1pXHPlfLotXZPF2s7Tj7FOGZCoe7t23SQvWK3wWQVT7RWpBtgOkxOewQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3136
X-OriginatorOrg: citrix.com

--Apple-Mail=_673BA740-E3D6-48A0-87B1-FDF59DA24E59
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Jul 5, 2021, at 5:12 PM, Jan Beulich <JBeulich@suse.com> wrote:
> 
> All explicit callers of __put_gfn() are in HVM-only code and hold a valid
> P2M pointer in their hands. Move the paging_mode_translate() check out of
> there into put_gfn(), renaming __put_gfn() and making its GFN parameter
> type-safe.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_673BA740-E3D6-48A0-87B1-FDF59DA24E59
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKcnYACgkQshXHp8eE
G+1yTQgAgN21xcHxiNFqLivrunkopiFrBq4YU0++OyJAIfy3FwfKNza4ywPG0Ft/
MNRDBTIaZudpQt0ZloZHoo/PGl1nY6sWleudCIzsD7r6RUJVaQ8nkL6Nl4x6S9ll
2f5QW7feOlP0OVqmmLRlbAwqBpKUC21SjdMODlyPo11UGZLLzKy3KXcvdG+tmZHr
G/aX0wz2Ha4w8pbD2eZicq0Upnjr+g2nQzPvk/QGoMl/69tDR9GKIYUyXBEoE1Fl
E/qTHLy8i6ptY0E2+U1p1p9tvJQRVvQ9RkiFAWuqbw+tFVzQlVqSMunytOzB9Y7F
/7i5Pqzozi4kZ7eOgIKSWcPmtea4mA==
=ktOw
-----END PGP SIGNATURE-----

--Apple-Mail=_673BA740-E3D6-48A0-87B1-FDF59DA24E59--

