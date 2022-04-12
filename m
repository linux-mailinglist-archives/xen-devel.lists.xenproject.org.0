Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF24FD35C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303550.517850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neCyF-0002JQ-4X; Tue, 12 Apr 2022 09:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303550.517850; Tue, 12 Apr 2022 09:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neCyF-0002Gv-0V; Tue, 12 Apr 2022 09:37:59 +0000
Received: by outflank-mailman (input) for mailman id 303550;
 Tue, 12 Apr 2022 09:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neCyC-0002Gn-Vn
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:37:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 394876a6-ba44-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 11:37:54 +0200 (CEST)
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
X-Inumbo-ID: 394876a6-ba44-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649756273;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VGAE9LuMndY8zJe3XtxHZm2gQveeVOvEOwO//HrQdAE=;
  b=BpeAwPN4m/Ja+wXVcqLyRLcd1KH1Le9dgDOaFEqCtj1jtIDojqhf4isp
   aKtEM/hCXaYjzByn8hgUCki37Flry6Zr/fMTuMCMLk6Qs5vpkV3d/ADSr
   HhsrTQ6GSm28YAt//TvWKrnOyyY9GRJw28YUaQjO7+gd7UF4H7rkwtlan
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68063990
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g0AJqKhcTYS7RuVYqhNjFaFeX161dhAKZh0ujC45NGQN5FlHY01je
 htvWG/TO/fcNzP1coonO4i0/RxX6JHdz9JlGVFs/3wwEH4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rX4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUQrPoLGgcYSaCVVNXsmGYhp9oTAGXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiOP
 5RCOGs3BPjGSwBEfXQpGb0doMGt2nTDWDpipECom4NitgA/yyQuieOwYbI5YOeiXcxImm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcV56gGiwLP27D2lC05eFhpkR9Ids/c5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZb2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1Y5lcKG+5O
 RKJ5Gu9AaO/2lPwMsebhKrrVawXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLqdVDcg1QdSFT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV/ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:GNNIdaqJ98iegwV6yNgAOqoaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68063990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0y0v55D6fhx9qYPAeldAmaNpNppc5cwh/NYuBAxPwh14eJpFztHPRhJyn3BtMjwMnaOCKb/7ZcG/U+w0WVNiFWIh2vEPrw8Yu/ypekDxBqUYWOAs+xBlIYjbLwLPYYotdZ9Wy/0fpWD1GYkApQehrhpOABHAAj34Az/GFBBNn6MuLMWDvjZdjxH2nvkn6XqeeCwLEuZEnajHt/Q66CZGd0zMHQLQGg51B5Wshb+MK2JWFhCTPmbpITH+hNClp4j2h+hH5BsObM6f1fvQh97JlishM6zBE16srS425IMwJNaO/n95aU2F/GdkO0Jl5T09sXlrfYhXJ4T2HlAtkg9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/T0vPYmoer4+e0tl/wDRTRTIttKBw2hVazDdcDYM4w=;
 b=IJmbcKu2Rc3yhweb+Nv6hujAQLqz1HTjIXrwkWO2vxfRG++CeGE88d8mT/gEc3yjz7mR5zEZT7RXwEuBA/+cSDfpZ+vHsbicK9BkVqCMxHTdPMso1Op+CgE5ap0zDRTpfkSWDAdxV6hz+b58bqzkoUJ+98pt/s/q1rTYuevPeaJAXnaFcdzKhS2keSw+rwlXKWX3UMDTjc1exKCqy+6qndUs9chET471RmuiY4FzkTZo1nsuamldTLXSii23Jm4zV0Oqhm949sZR4mR/Wljpjh0vs6+DE8vehtxJyTKCKmB1xNl2fp4E9B8Gyh5hzQq/FSlVP7fjXkLBw4ntomZejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/T0vPYmoer4+e0tl/wDRTRTIttKBw2hVazDdcDYM4w=;
 b=ALiA1S+h8x2+RPJtNifsHaUdNlnKFEtSoaPEF8mug6Dy64CK3Upbi/V3So4dY6JzNwP6cnJSX/0yicAZP4dYLhU4JEovHnxPrLO7X9S1X4VfLFFI2u3+T6akcpHBF0SrC95pAQW2XDGTea6KbKUluRX9WYyiLt40poKAUawsHxw=
Date: Tue, 12 Apr 2022 11:37:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/8] AMD/IOMMU: replace a few PCI_BDF2()
Message-ID: <YlVIZHMSgmMvhMyO@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <68a10516-7737-5bbe-e9e5-537031251fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a10516-7737-5bbe-e9e5-537031251fcc@suse.com>
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: addb4a6b-80a8-4dd3-016e-08da1c68194c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4922:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4922230268C4665643A1FA0D8FED9@DM6PR03MB4922.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ykI4Y5eeJc7w4baFd3nWml9xwtu00wpbfAPhJ1+Nun2mfVrJb8GAGgjQtf0N5zmuWSn7RL9Vdf4lbRTifZfiejiVFss08CToj/9yz9XkDGZT4VyJQnKi0HL880J8W103NiuHVWRbBSyxqv9h96N5r33/zEvDZKSTfuFBMGWRSI2kMmw2+z2Su+j4py5nz5qHD+hqKg7DBDEIIRbzlIi47ZCkzE94kKrWCu9RkY088VqMch7uLBLTAQGpJLvv8rdm9T0LaNhqV1eSCopsugGGBry/70Sr6jKAuMkWqgPnGahjBoESAzVyedxVgmioxrG9bpG/GbNR0E/6VN4qyPNSZXVmvJR65KQWX1UTFD3VmQsp8Fnddomph4IUxpTd6PlZKkNmsjBEUoE/jaZse59K8Fpt/+IoD6Ez2TVV2qvwtkg6cSXWZTPx4V1jDZtRi6+J3tET1iC5DDyZhtYLJL4f3teypgSdCq/hliRsD9G8+DE0MlUe0XX9J7aErin20J7Wqa8lT6gqjJVBEFiRNW2vViHoIRSjsOGYjWnY82oc8t09yKWyMTnrOym5ylyTHQsu2kk0Im/pLoWCWpNHX1RXdLyCEtsPOgKPbTqCwnhxrFrO4nawdgqBdRVBlEhlPcf+O7RQVMwycSz5BqyKfEJjnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(6512007)(26005)(9686003)(83380400001)(6666004)(107886003)(186003)(6506007)(508600001)(5660300002)(8936002)(33716001)(2906002)(86362001)(38100700002)(4744005)(6486002)(6916009)(54906003)(316002)(66946007)(82960400001)(66556008)(8676002)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVVandRNmI0TGhPZzduekRKdXQzM0FEUnArMHNyVlF3ZUdtRklUejA0M0ln?=
 =?utf-8?B?WVFVVW9qOWFmK2xPSlg3Ym5qR0liR3hCbFl2ZFBtblVGakl4YldlRUpQcE8w?=
 =?utf-8?B?N2RLUXJaN1BSYkhKVURNSDUxMlVaTDlkdkVhc0ZteTM1d0V6UU12ZkVzSzlm?=
 =?utf-8?B?V3BOWmNDSnYrVzVVT21mcnNEd1FSUjU0QVBTTXQwRzNIQ0hBZC8rQ1NpcVhZ?=
 =?utf-8?B?UDdPdHdVaDFqY3FLSmUvS3FKdkRYbXlsSWJJRkY3aGg4RCtyUlNtTkNCNUdn?=
 =?utf-8?B?TEkwNTZMQStFVVZoQ01Qa3lpS3RQdm5jUDM0YVNSWkk0UEJkS3VUeXNXOHJk?=
 =?utf-8?B?NEpwc0Uyeko5WnlJdFJLbFRhVXBuK1c5SnF3OFpJOHdlT0d4eWozSm53ZWVS?=
 =?utf-8?B?M05BLzc5Q0pISWs4cllJdUVMR0ViVzRyVEJ0Mll5VUdOSDArcDRKN1loWXRh?=
 =?utf-8?B?U051TU9QL0wydzM3VEw1clFhTGJmSzQzYkI2WDFDMHRqOE9RZjhsYTRkQUlS?=
 =?utf-8?B?bm5qK1l1RmFrMFQ3R045OWs3WVVHSUlTYitHcy9ubGsvL0xTTkpYL2l0RC9Q?=
 =?utf-8?B?V3lFZGVkNnJqS3V2b2hXK1Vkd3ZnaGFaaDZMbGNidndVVUFVTU13SEwzSjY5?=
 =?utf-8?B?WGhYa21CMWhOSXpoTnBmU3d3M3k4UXBocS9YL1h1d0xZRWYyQ2x6ejNBaGNG?=
 =?utf-8?B?MTJzazluajc1NlJyUGdyVXJ3UWw4eHQ3SkgyazlseUJyeG05Z0VHdnkvL1A0?=
 =?utf-8?B?Ym1DVlNFbDBmc05oKzV4YUtHSExZcHlNVWh0OUgzcDV4YjArY0NMM0Y5Sk4x?=
 =?utf-8?B?MDdUMENrbnAzQjl6YmdyQ3FsakhJNzNpKzZSckRuTy81VmJuZ0VpRUwzMENC?=
 =?utf-8?B?OWVFM0hDa2lvL0d4RFhUTk1FNUR4STI3UytDc2Q4N3ljay9xd1ZUNVJENmN0?=
 =?utf-8?B?dEx1bzA1SWVrRTJ0amRxTHVmdmdIQkZKUUwrSTZpQWhnK3B0bm9BbmFuS0Jv?=
 =?utf-8?B?YkN3clpyWDNOUjFsSjA5WVhRdXNOdnRKVEFHN2VBUWl5MkZtZ2d4aWNrUGZY?=
 =?utf-8?B?WUhqT2JNWmQrMkxucWxuanlGbEZqbWM5aXNSbnFmV0NYUGlNblJWY3JERlhV?=
 =?utf-8?B?OWpPRTBnZ2VUS1phdkJvaCsxMkZwWW1XSFFkdG41a2ova3JiZXpzZFFzT0pk?=
 =?utf-8?B?VkFxVmVEOXNtdDVVNEhYTExTVlJsUkNIZERCMzN2RDhSR2dhWEs0aVJIRytw?=
 =?utf-8?B?eXI4TFhHcEh3QnJ2dkxlaE15andVdXpnNmx1T2hpYkppZ1VGNEV1ZGpsdFVj?=
 =?utf-8?B?YzdielRHa2hOK1pWUjNSZGNUM2J3d1ZTeUdWaG5QR2FIbDhXcUVCZUVPa3hF?=
 =?utf-8?B?OHBoWVpobVNtTTdMTmNGTlBFVDgyT0pGdldMWWU1dElSZ1B4RXhYOGpZbHhp?=
 =?utf-8?B?S3FPMGw5UmdMMGlSVjNDWDJkOVpFTWdOdlhGYWRCaG00L0E2aXVRVDVkQXRO?=
 =?utf-8?B?YU9ieXpWL0MxbmpSc2xhVW5TeCtvNm9KNUN1U0p1OHh2cjZDeFVnTmhZZjZx?=
 =?utf-8?B?cGZ1Um4yTEZ3OStWQUozSU9MS3N6blFCVm54NnhoOGN1WnM5LzdyVG9Pd1o1?=
 =?utf-8?B?RWxhTDh3UmRMeUhvZUNCSDFIT2RCbXlBRHlEZTd6cVY0M0NMT3hDOVVpRmc0?=
 =?utf-8?B?S0hjNjgxSDBIcUdjQVpCd0k1TGVwaC95YTZUN0VLa3lXSjdrYzZaM1BJZkJX?=
 =?utf-8?B?eUppanI1YUxkVGNIRHI1TWZndjJsMTA0R2tGMWpIWmlGUDFWclBrUmM1QjAz?=
 =?utf-8?B?NGpOMk4vQ0NaVnNUVDM4Vy81a2owOEQ0akdiNFFiOWJBM3JqaGZQcXF0N0dr?=
 =?utf-8?B?aCtGWFZQTU5KQWV1dEpVRmJwakR6aVFFOGdVZkg5VjcwUTRWVElxYjhOV3No?=
 =?utf-8?B?NlA2Y3BWNnloRjdFcW1nSWNrVlE1d1BOUVQ5WTlTdGl4RVBxdWthQ0dtSi91?=
 =?utf-8?B?WDNndjBTSXU0MzJ6dnpNajRFV3dvOWlpMlJ2b3FiR1J3U08vamlRSU9Xay94?=
 =?utf-8?B?TFdzNUZxVnhMcmtyQ3JOeHhua3hEM3NCSStUWFZuWldVanJNSmtVaCtQV3BU?=
 =?utf-8?B?RFFjcVZ1SjFiSC9RNVQxMmliTlNmV1NaSWZTOGVUQXJIS0FJRDlCb2w4d0Qw?=
 =?utf-8?B?OHJ6YnhmWXVYTTlFQ0R4QVp4RldjSlprcUd2eWtYdUt5THc4UElOVVlwQlU5?=
 =?utf-8?B?aW5NQndxSEJaV2UyRm1BVVV6NGo0OVViVFk3WS9GNXJweUxORU5xcjZ1bmZl?=
 =?utf-8?B?cU84QVpweTZrRTlIQWk1Rm5qSjc1enhIcTRKVHRUbVRnL2ZJNzlZeFZoQjJM?=
 =?utf-8?Q?yvLYA0hGOlKfAyOA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: addb4a6b-80a8-4dd3-016e-08da1c68194c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:37:45.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t9PLsSmHJGdogZElTt4SuqfaY1mLLNvOP3CjjVCKvCsfN89bCpU6I7HrQW/CthrbuNfn1aUaTPYMfT9fKUNyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4922
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:37:52AM +0200, Jan Beulich wrote:
> struct pci_dev has the wanted value directly available; use it. Note
> that this fixes a - imo benign - mistake in reassign_device(): The unity
> map removal ought to be based on the passed in devfn (as is the case on
> the establishing side). This is benign because the mappings would be
> removed anyway a little later, when the "main" device gets processed.
> While there also limit the scope of two variables in that function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

