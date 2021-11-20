Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1238457CBA
	for <lists+xen-devel@lfdr.de>; Sat, 20 Nov 2021 10:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228347.395095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moMym-00086U-Lb; Sat, 20 Nov 2021 09:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228347.395095; Sat, 20 Nov 2021 09:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moMym-000846-Hr; Sat, 20 Nov 2021 09:48:16 +0000
Received: by outflank-mailman (input) for mailman id 228347;
 Sat, 20 Nov 2021 09:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jW2u=QH=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1moMyl-000840-6D
 for xen-devel@lists.xenproject.org; Sat, 20 Nov 2021 09:48:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8f15619-49e6-11ec-9787-a32c541c8605;
 Sat, 20 Nov 2021 10:48:12 +0100 (CET)
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
X-Inumbo-ID: f8f15619-49e6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637401692;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c1wAg/KbnweCue2RhExb+omQUa/824rmtHlhGs0GQbI=;
  b=ByFA9dtuPA9px4IoZbk4hHaYgSYreN/KVdBnzCjqs/VBesvqwznR7S/f
   DAsZbnPwq7FTawNBS62Y0NunigFRhKxhpycJjcnYkbXUQTfjnrit1xD8k
   Ca7pyhyoAUZctqOCFBILs/hEBB2blHL5XJRXD74tR/cUyqD7kfipbh9Y2
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SSHWVwRKHeVi6UB/OFt+8/JZniYSBQ8zuglfn6PqsfJTRALRhLMKFWGo9DLrXWyfxBbpd3KXxH
 50BnURwoPC637d9DKqSB0yZJgsu4zQH4Zc1J1ICsFLaV1BsFeZYWoVFmw9xESG2DWdoUDa5f7X
 m55pvLGG5n8Q5uiYLLOEBZ9F0Xcm7hhb0bzlzQGOhZFqEIIq9GfyNI0qZRGDBFtbIB5+jvhoe+
 SetfI3GMVo8DNZtHwe7JTPI+t5I+vQ3POuDvkrelqe7wYL508DZOWe6xnSM8ZmXDpzb6B/yIaY
 GsIUbiw85a25wCyTY5td5rK2
X-SBRS: 5.1
X-MesageID: 58663106
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VTB5EKonIkvIz59OtamUr6IUlTdeBmIhYxIvgKrLsJaIsI4StFCzt
 garIBnVPfncZWXxf4sjYNjioRgC7JbQx4VqSgI++Hw1EH4Wp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd/3FDUjMYvNoedHTwIfCw9xDbBP3oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0eQ6iFP
 pJHAdZpRDDLZhdAC1kGM8kjk9qv23WlXiYFrV3A8MLb5ECMlVcsgdABKuH9YtWXQe1Fk0Deo
 XjJl0zQGA0XMeu62DWM83+yruLXlCa9U4UXfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLO6gaEAi4fTzhOaPQvrspwTjsvv
 neDksn1HzVpvPuQQGiE67aPhTqoPG4eKmpqTSYCQRFfu4G7iI42hxPLCN1kFcadjNf4BDXxy
 DCitzUlivMYistj/4K/8FPcijSgvK/gSAIv+x7XVWKo6AB+TIO9bonu4l/ehd5nKIuaVVCHs
 GIzp9mF7OsOAJeOkwSAWOwIWrqu4p6tKybAiFRiG50g8TWF+HO5e41UpjZkKy9BMNsAeDLvS
 F/ev0VW/pA7AZexRfYpOcTrUZ1slPW+U4S+PhzJUjZQSts2KT2N8wdvXE3Kw3uqiGYjobw2H
 67OJK5AEk0mIahgyTO3QcIU3rkq2j0yyAvveHzr8/i0+eHAPSDIEN/pJHPLN7lkt/3c/G055
 v4Gb5PSoyizRtESdcU+HWQ7CVkRZUY2CpntwyC8Xr7Se1E2cI3N5hK4/F/AR2CHt/gK/gsr1
 ivkMqO99LYZrSeZQeltQio9AI4Dpb4l8RoG0dUEZD5EIUQLb4e197s4fJAqZ7Qh/+EL5acqF
 KZeJ5rbX68VGmWvF9EhgX/V9tIKmPOD31zmAsZYSGJnI84Iq/LhpLcIgTcDBAFRV3Hq5KPSU
 pWr1x/BQIpreuiRJJ2+VR5b9Hvo5SJ1sLsrByPge4APEG2xoNkCA3Gg1ZcffpBTQSgvMxPHj
 m569z9D/rKTy2L0mfGU7Z25Q3CBT7EjQxEERjaDtt5b90DypwKe/GOJa87RFRj1X2Lo4qSyI
 +JTyvD3Kvocm1hW9YF7Ft5WIWgWuLMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:HNYE+K24W8Rm60uM2kewwgqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,250,1631592000"; 
   d="scan'208";a="58663106"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leOMy/iUrehDiUQALjngrtENvjXkka2/Dj+GWk3f57iM6IhGMGK5YlflNKb4aW+RsB20xdQbiH1jsdiUk3oRyD0FaCt4RzZoJSstdGleSr+V0jV0nRsj3AosWBjLwg+TKUv70C8mM1tDCw06bsOIQwdrwJDs3at1dsGOrDdhICWdgfzrSLozdsJmFqatDeZDIRrmkGbdI9ShuYWiojSbsc3R/blA2tMXNbtO+ULOce5qkM7MgItHRNrTnaF854S8Gc2ufzXtUbPO6K9b1DPU7XixxYCvv4nJ5UWdV5xbNlHPhnBxwOYmsZWdyRYoNRj+2v5pxCX+d2AxHapnr6Pfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehUyi/TGDlV1obCCjdzq8AHo0+nUUOz6fGvMROWkWDk=;
 b=imHRnwa9okjhCvc1nqWM2uqWNrM2Plgfs70T+oO4kDhiQs6yPAnH07MPNpYF976to2cJM5udjzthw2SJ7Xcwj3omnTEYtD5QRDYJEA+kGWNc4ieAxf63VtnPqAdoPcWrJvSu2h22mvKsvT25T8yQ8soouWrTbVdpop1pXyFstZuqZii7U8gVlwZSrrN/PtVvynEUDkNCOboKglptR90MMhOJd8yq9R4Ed0Lu7pyTH96j5O7NQ4+MWy/7SXbW2F95kI2v5XpPHP2ml8K1Et7UI3ZjPHBTV5p9OdYI7Uvj+euScS72Ya63opVazdjXHcjslRN2UIywWeo+WF8QNmtWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehUyi/TGDlV1obCCjdzq8AHo0+nUUOz6fGvMROWkWDk=;
 b=HxKQQ2jEGDrf2bZa3tdfp7RECawtZqt59k7Vr5jM99Bf85BwYOrmU2oNPUdh2lHzG5cdkLVnNxaZMxvZKN5XJdJM+TN09ysckYzS+t5jX5kUAH9JyYGfIQbLHS2AeRZP1X2sPoFqTwRV/LPSpJV9+6MYvSJgDfmaDPDVIwoGOJA=
Date: Sat, 20 Nov 2021 10:47:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Message-ID: <YZjERu0rkTixjHeg@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
 <YZezXShKi1ofH5Aq@Air-de-Roger>
 <28ae380f-703d-e266-a30d-d4d59615f647@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28ae380f-703d-e266-a30d-d4d59615f647@epam.com>
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34cc045e-2860-493c-3423-08d9ac0ad482
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-Microsoft-Antispam-PRVS: <DM6PR03MB35782A41D8A8FBADD3A1760F8F9D9@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gmd/PMdjReW3TIBFmm3/TvsB8QwOnEhQjKW6rGT/8lJVjS40kHmO6fzIA7dddJdi1xebVN3Ou/57U2tBJnNRcJYmNmUBPLRQaYlfqcv4vfYpFn99NC/E89UtT4q/SVHdo5aGm+MyXKFJz8KDjvT0hbLiCm1V97Wt8IKW0H0QZO0oxObB4yw5oaCm766UTIO1qrKphABfhBgJ9HoL80BDDQygwdFFMP6m0gkIUJK8H6msuA+bj+pp6rcphUOXIpFMpJeYDEDzdb74F/mvNHe2qULdbhJ432K71Dq+xo/KEI5VX0p1/F1AxgEaQkxc65bDT7urHaCnNb6MvIOCaQUe0W/pw7lt+FQUzw6CnpH8pzaUb2Xu9bHkW7EVUMYvCbs1f1XDX6BZrfiRtibK2Wls/qrSS07Ej0CeLxAkiKyUiQLcvTQ00lDjESpZ3b6bGnosKkt+qEj20/OsoVHmHhyF0Og2sOtrl6hW6DlG0PFoO8nrK1dqXnLUz00Z3tg1nHYGH3R0/91DOloWPqHm90r4InF1yZzIaTuxW2qMZylFsY5nXUEfgoCmMM2AQK9ekh5HBvae1POCwP/AJSSLOBh5r7QZFlkwa8n5bIc8ZHyRa++jvXffNx49s8+P3mNFtnZqIoKhpOf3LChEHEzCKwzeS/zC+bqKwQIoILGWoUJ6vhBFbKW+j+FDSiRs9Y87sSq4z3bazPv7/Q1DDvMXg+qy2+qz5DLDWWcrBxOMfkwfHeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(966005)(2906002)(508600001)(6916009)(86362001)(8936002)(6486002)(6666004)(66476007)(6496006)(66946007)(66556008)(5660300002)(38100700002)(26005)(82960400001)(53546011)(4326008)(186003)(9686003)(83380400001)(54906003)(7416002)(316002)(956004)(8676002)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emh2cG9GVUlOQ0pPMXl2YUlIMUE1MVJ5L1F0dDU1VE90TkdhYTZPZWRtQUhi?=
 =?utf-8?B?RStNUVl5Ulc5T0l1RW5aczkrbitRWXdZYklCWDBKdk5JTGxaeEl6THIzTUc0?=
 =?utf-8?B?NjBTaUNVMytiUFhYTHJObUlUUm1NazBYc1hOM3VrNW9FZnM3MzNpdWw2NUk2?=
 =?utf-8?B?M3BZZUs1UlhBTVFnRzJxU0ZJMXNEWkNRWnJOdHhUUlp5OWhMUTJSaXF1TXd1?=
 =?utf-8?B?cTllOWliWm5ETmxwTmRSQVkxWDNVR2lXNHZSYjNqeFhyUWJUSU5IRVQ2QWZN?=
 =?utf-8?B?WXdrekRHSmgzVk1BSzNGZnVJdEZFMDQ5SGpUNm5CV25Fc25KTGE5R0g5VDgw?=
 =?utf-8?B?UTBYM3lGRjlJNDI4aldFTXZGSGtqRkY3M3FXckt6Tlk3Uno1dEVJU1FzalNy?=
 =?utf-8?B?MXhCNFNWM25KMVowZTZpVlNISkczY1JSMHlQbFNXN2JMU0tlbDVVRzNRc1hy?=
 =?utf-8?B?SnpjZ1g3NHplaWt2dWRqMkNBUU1XOTlBU3hLQjAvZERPUTNYMzhGU3NYeE0w?=
 =?utf-8?B?eHMxaFB1WTdtdHF6VmdkRFlBV2RUajZXZy9YekZGZ2xFNlpGemZ2UmNUc0Ew?=
 =?utf-8?B?ejhyVlNvN1NjZENWY3I4RGcvamw4VzVOTDlZdEhoZ1BmK2dNRmZLcFA4K2pP?=
 =?utf-8?B?bVppQ015amlWVVlZQ1BIZ25JSlp3ZXRoU21FNjBsU1pSMzcwYU10QlRhRXVm?=
 =?utf-8?B?dzZFdTU2VDNQOFNEWGFzN2V3UGwxMHZPN0x1b1g0dUdhcjFTMGwrSVZ0Mldo?=
 =?utf-8?B?ODF4Zzdsb0VObFdJVC84Q1hLYUxHUlkwbEZxSnRySWJlaXZhN1gra3BQOWQv?=
 =?utf-8?B?MWNGclFnTHhRV2YyTlVGMFRyaXdIMkpIUnB1UTVjcy9BS0VoeDhxSVlnYW1K?=
 =?utf-8?B?aDdxczhKV1BaUWx6NG1rNEVwTk9DQ1BKemJzM3p0M2EwbjhTalVRRUowN3pF?=
 =?utf-8?B?Yzcvbzg0dGNmZG9xb2l0T1poejdodnM1QmtQRm9LS0pOQXhGWStCOWcvb0tT?=
 =?utf-8?B?aGY1Q3FDb3QrbU0vMzhyQjg1MHdvZytCVmU0ME1rSGluY0l5QXpmdk9OSWFX?=
 =?utf-8?B?QXhmSEJZSVlPUVFZWGpacVVMTWhScitjajJBMERFZVYxT1N4UCtHS3ptYTky?=
 =?utf-8?B?MFdDNVhxTEdpaER5Q0tsK2lCa3NUd3p1TWhIdTRvK0t5cE5Hbi94RnBza21p?=
 =?utf-8?B?bHl5NDYxYjRSd2NzWEJRT09ZYnZnMXVackZ2UktwN0Z6NTJIL0hTTXZOQ3Bs?=
 =?utf-8?B?N0xPNEZNaFMvRnZOVk5WVEhmd21nVHA2ckl4clY3eEZCZS9HcEVSYWlDTmRI?=
 =?utf-8?B?NDh1S1lqeTJGUHBUOTJoT3g1SFNVbXR2aUdSU2tzN2VUSTBMd2dFb1R4Y3c3?=
 =?utf-8?B?dGtpYkVXL0tlLzlBNTBReGlQMWhYeGdBVVpaTzgxbHZscTZqS1ZBc0pSVjJ6?=
 =?utf-8?B?R1puWTlyaUNhSC9ucjFMTlBhcmppUS81UXdka2VpcFlNZmpQZTZ1dnNyMFRK?=
 =?utf-8?B?OGpLNnlKNityOEh0WDU1b1BaNEt5cmRsdGU4UGZ2OXd1NnY1SkVRUzJNZXR6?=
 =?utf-8?B?aEIzaElWb2RHOEovZ2g2eXVia1QwK3BFaDJ0anZCWVJha054YnRLTG5JL3Qz?=
 =?utf-8?B?MW1ncnNBbkwzM253eGJ6Y3BnQW5sMUFpMXJBclREMTJoTFI4MWZ3dWdHUEJB?=
 =?utf-8?B?bHZSWTRGS3VzeFpVbkI4aTFrUHJ1eU02QStRbXhlWWdqVUdobnFialBMUnpH?=
 =?utf-8?B?bVkxajNJdVpRRmZITHVOZHpCTXVzQnhlbEhnWlFCZWw0OFk1ZTFyRGpFNHQy?=
 =?utf-8?B?Y251T2tnbXU1eUN4SzEvSmtucFFoZlczMnZTbWNxWlFoYnNjcHlFWWJKSkYr?=
 =?utf-8?B?UDJuT3p6bTJtM1E0Zm5UT1dMQnI4dCt5MU50cTIveHovb3lOdWRuQ3dzelRE?=
 =?utf-8?B?UU50QlIxZmQ0M2x2VFRvS0dpdzdDTXZ6S0ZPWHlIQWcyUE9hTnlVRk8yV093?=
 =?utf-8?B?Zm5XaERnR2VRbWJUVUNXVFJPa2g1SWxaaVZyc1p2QnNmVjRsdjk5ZTRUcnZk?=
 =?utf-8?B?VkVjZnFBMjJaQS8zYUFWbUt4c1F6czI0MjYzeDk4M2lGWlo0QTl1SkRPUGpy?=
 =?utf-8?B?UldjTFdldEcyTmt0NUZkVFhmaEJUanhtK3FxYVdDeDhRMkZVMi9hcE96VGpu?=
 =?utf-8?Q?e6ah+6JeKrwCgtc7r0QsYms=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cc045e-2860-493c-3423-08d9ac0ad482
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 09:47:56.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf4bTn4Zl1TCtpQwJdMFJ2jH7Au4dVjvJm1eBqGVUhEe27G4xQEb/LL8j3IPgChXeH5O0U1GmD0I5TGtGZVA+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Fri, Nov 19, 2021 at 02:26:21PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 19.11.21 16:23, Roger Pau Monné wrote:
> > On Fri, Nov 19, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
> >> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> >>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>
> >>> Hi, all!
> >>>
> >>> This patch series is focusing on vPCI and adds support for non-identity
> >>> PCI BAR mappings which is required while passing through a PCI device to
> >>> a guest. The highlights are:
> >>>
> >>> - Add relevant vpci register handlers when assigning PCI device to a domain
> >>>    and remove those when de-assigning. This allows having different
> >>>    handlers for different domains, e.g. hwdom and other guests.
> >>>
> >>> - Emulate guest BAR register values based on physical BAR values.
> >>>    This allows creating a guest view of the registers and emulates
> >>>    size and properties probe as it is done during PCI device enumeration by
> >>>    the guest.
> >>>
> >>> - Instead of handling a single range set, that contains all the memory
> >>>    regions of all the BARs and ROM, have them per BAR.
> >>>
> >>> - Take into account guest's BAR view and program its p2m accordingly:
> >>>    gfn is guest's view of the BAR and mfn is the physical BAR value as set
> >>>    up by the host bridge in the hardware domain.
> >>>    This way hardware doamin sees physical BAR values and guest sees
> >>>    emulated ones.
> >>>
> >>> The series also adds support for virtual PCI bus topology for guests:
> >>>   - We emulate a single host bridge for the guest, so segment is always 0.
> >>>   - The implementation is limited to 32 devices which are allowed on
> >>>     a single PCI bus.
> >>>   - The virtual bus number is set to 0, so virtual devices are seen
> >>>     as embedded endpoints behind the root complex.
> >>>
> >>> The series was also tested on:
> >>>   - x86 PVH Dom0 and doesn't break it.
> >>>   - x86 HVM with PCI passthrough to DomU and doesn't break it.
> >>>
> >>> Thank you,
> >>> Oleksandr
> >>>
> >>> Oleksandr Andrushchenko (11):
> >>>    vpci: fix function attributes for vpci_process_pending
> >>>    vpci: cancel pending map/unmap on vpci removal
> >>>    vpci: make vpci registers removal a dedicated function
> >>>    vpci: add hooks for PCI device assign/de-assign
> >>>    vpci/header: implement guest BAR register handlers
> >>>    vpci/header: handle p2m range sets per BAR
> >>>    vpci/header: program p2m with guest BAR view
> >>>    vpci/header: emulate PCI_COMMAND register for guests
> >>>    vpci/header: reset the command register when adding devices
> >>>    vpci: add initial support for virtual PCI bus topology
> >>>    xen/arm: translate virtual PCI bus topology for guests
> >> If I'm not mistaken by the end of this series a guest can access a
> >> device handed to it. I couldn't find anything dealing with the
> >> uses of vpci_{read,write}_hw() and vpci_hw_{read,write}*() to cover
> >> config registers not covered by registered handlers. IMO this should
> >> happen before patch 5: Before any handlers get registered the view a
> >> guest would have would be all ones no matter which register it
> >> accesses. Handler registration would then "punch holes" into this
> >> "curtain", as opposed to Dom0, where handler registration hides
> >> previously visible raw hardware registers.
> > FWIW, I've also raised the same concern in a different thread:
> >
> > https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/YYD7VmDGKJRkid4a@Air-de-Roger/__;!!GF_29dbcQIUBPA!gihX6c2Mg87AKSDMmh1xrRnPjTXZkgR3kqPxg-WPghAdbY59gmJK5Ngkf4OJFK6NU5IwCStYAQ$ [lore[.]kernel[.]org]
> >
> > It seems like this is future work,
> Yes, it takes quite some time to get even what we have now...
> >   but unless such a model is
> > implemented vPCI cannot be used for guest passthrough.
> But it can be a tech-preview

I'm afraid 'Tech Preview' requires the feature to be functionally
complete, which I won't consider the case for vPCI unless the above is
solved. I think we could only label this as 'Experimental' until the
remaining work is done, but the limitations would need to be clearly
noted, as it would be completely insecure.

Thanks, Roger.

