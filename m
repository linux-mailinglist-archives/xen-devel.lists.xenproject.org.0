Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCE4CC0D4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283432.482430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPn5j-0000VR-Lt; Thu, 03 Mar 2022 15:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283432.482430; Thu, 03 Mar 2022 15:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPn5j-0000Sh-IU; Thu, 03 Mar 2022 15:10:07 +0000
Received: by outflank-mailman (input) for mailman id 283432;
 Thu, 03 Mar 2022 15:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPn5h-0000Du-Gj
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:10:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffbbf00a-9b03-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:10:03 +0100 (CET)
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
X-Inumbo-ID: ffbbf00a-9b03-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646320203;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9Pe6pzaygyrnnTsI35jSXGO2y4aX3uuMk+PfPRtQFRo=;
  b=QqzMrw4kZuciz0sTLk5cX7U8Lo2q2dHOK3UpdaJtv1qFHq0WBgkAar6B
   iJSByaAT+imkR482M44XvCljHsu81jI8XuFOEPuoN1Qj6mOxFLi5uTNg+
   gEZ99V63IX4rBpOkn6XCVMYT0T4miJJp+RT1aA/SZnbbrE2Y/wpcq0N3l
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65395156
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lIG+Fq+NZUC/5/pIshsMDrUDnX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TAcWGHSPqqJZjegetwgOdzg804Gu5LXmoRnTgdory08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbjgGRckJ4rjorkmCQRVKQRhM/J5/qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TRqeDP
 pdHAdZpRCjwPTtSKnk3MsodsNf3qFTCbh1opXvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0f4oAA+Ajzy63l5GO/gujI3cKEQFHd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb5
 hDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0gfhs3bpdfJmKwC
 KM2he+3zMUJVJdNRfUqC79d9uxwlfSwfTgbfqq8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWnDqDLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtZCfQhXdiFgXfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:FdfipKCpYTe2d5nlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65395156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlh6HZGMpH3FV7Oy2K1lcLMKEi+YyqjcOwC0+9N8XqzgKQLJTwwvpmV1DcaQLoAlxkOetmbuQq9etBpTnBN4mekuh5oQUZ9vYx8UIRGQYnvlFdtM/al1RQknJZbvh2xA/K84VjmYhAMbCnYdbf9801hsQuhXSFEaGhPeecq9WOZPKMKvvs0FqRqERxa/PlkQl9FtDBMAuOHxLTopIeAJ8+zp0fHUi2gI0gVUK8dkQ19nunL6i2rlBWUXrpcK1X3n1vJxvrH/6gymugtAFy8P1/pSM98FLFSZRxzgN6EGtABMjLYtWxaNflZkTM1z9uDUSnB8X/JWRGukzvVMRme9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqaQBEpyIqc9Ja+A48GISfACovbD0WUo0m4jHCbVC7k=;
 b=AALoqIt6zHwL645o+jnWKG+UOfyjgi8EvtDBQkFgb7DrxAKyKcPscLSGDrscX4RPEfsJYx/jA/C3B+c68vWNDvW2xuKFIE+xsa9sok8rbjqNBW6C9EL2+v9R8ScAAhRwrmyHkr1QIr1tSzVjaDJ6HfyJza1B+6LyuyFV4YraEvFfsoT68xa2lyKgc0+Ru0UpPkDnCCjCRYIdvnBJBDRVgxIiCiTeP8PHvOXDNMeryQ/GQ8/5HafftgAvMqFN+ekDbCBmaLhJ3PdudU2Irlq0wTOgGsZJd8nmbiqMUV/JSWyGpywDFPOuDHk71q3OHdUnb1WUQ8gEhBWEHp4Ulk8qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqaQBEpyIqc9Ja+A48GISfACovbD0WUo0m4jHCbVC7k=;
 b=RHtGq14sftk2iWk/ilano74MAJpgTQwW5x+omfLUyrNtOq7igd+HinvNJEzYLuB7Rlz7NoM+9yJDp+a1wG+nSrgSamzxM6ijx/Qa5FPq0BGdbUZ4VHNf0OU/c0oHpzaoqfFXporq6AwVCz9CWZx283r0Z+ohP/ssKCOc8KBrGBI=
Date: Thu, 3 Mar 2022 16:09:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YiDaQY1ToO8G2QYd@Air-de-Roger>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7dddd68-d832-4cd2-8191-08d9fd27e1ae
X-MS-TrafficTypeDiagnostic: BN6PR03MB2563:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB25634868C497502949EE03248F049@BN6PR03MB2563.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tOM6YKvIrKJoBSgObQiwWpXwnEojsbZ21s+LC80tqXB2uRRcwpCX6aLRoPdU+mXKmAuovsazCaB0tXuahQ0DRc3vTV6pVYgLgz8uN1FCXlsx+jFxvjp1C/R9MYshUPmDeFqtMWKrqC9cZEcfewIxdwqk9+V/6ze0mtkRs/BdNZzaUOpt/7M3qKec6G1dHr2fKEwOhWUy4aUnr/uIUqfsnxurrPtTaVPOGBrb4eKVKr3gWt+p9GCeq0/EcCaadwbuOfahGX/ieBG4uJfRgBYBXRXUjoKpkmi35empQlv6nI2bZ1rjiQ6Sbnlt0PnQGQMQbCl+sLcZ2kIazW5F2hs61RfHuTIc2gyXxtG73j4+NwnJZ4ubx9nqPahJUqRyY5ypqFjkKvTncatZ6q3D8u5p7lQIzAziCgwAthVH5ECNbwJBNBEwaKM2TrPRXEMd4Ed5oR7B4fsiAUhLuubkeuNDeK1f/2H/9OzhGD2HtcbBH6zda/NZRhy5btDXE1YiVmKaq0z0a8C6pEvUDEoZFFS7wRxY+rP3zmqDnDj8qNseKGekhZdBzXEbiMWQyE9XNtHG+rlh9rwe/7Rkpo7d7BpLL4U4NgRyf5s38MeMHMVwboT8vhWF6BZrUCdsdQp/bWZ6fblIOBjmRrbwqW6bSswq2sCGwkA3BYUsQKOl7mDW1N2nO7gbpPkKAwTNaMOf6lkIzDo+WUyGo5gYjEf61QdknM/bWg/XFjhtzro1X7U+720=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(6666004)(316002)(53546011)(85182001)(2906002)(186003)(54906003)(6916009)(26005)(33716001)(38100700002)(66556008)(66946007)(6512007)(66476007)(8676002)(9686003)(82960400001)(6506007)(4326008)(5660300002)(966005)(6486002)(86362001)(508600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVgrSXZJSjQrbXgxbFkxRDl4L1ZEdXdpeGg0K3BNdmNncXE1VEprY01jM0Er?=
 =?utf-8?B?NjBmb2s2eW4vRlJnMVFKbURFRVc0NjVBUHFiZlc5aUxlenZ3SkJ0VmlydWZF?=
 =?utf-8?B?ZE92NW5zYU1GNHJjbzdIN1lCaHdpN0w1Q0RtU25kcFFFMmZmNFJ4V3NZRUxR?=
 =?utf-8?B?NUZQQ284WDUvZDFRcGhLdmt3YTNtMFJ6Ui94OHgzRTlObitqL3R1WHZLWHFk?=
 =?utf-8?B?NXZhdVZjQlM1d2ZNbzM5d0ZybHdmbEJ6RkcvYkpCdWVtU3VUMzlQcnFkUFdP?=
 =?utf-8?B?cG1TY1ZZRFNnZHpWTjJTSk1YLzRrVWlkUUZXeWhnME5Pb0RkbU42TG5xZ1Q3?=
 =?utf-8?B?MVAvM05hU2tabHY2Qm83ZHdQNTBWN2pvVXJzZVFleEJ0emxCUFpodlR6Z3pO?=
 =?utf-8?B?cW5UQnEybTF3MXBRRVRqTjdBajJsN0I5czA4ODFxeCttRTM3b1prM0F0MHRR?=
 =?utf-8?B?eWFOQkxFVjBab2ZicXdEQlBEaWFVbFBEQ09pNm5HWFFET0ZOZHJPV1cxSFBu?=
 =?utf-8?B?c1BBVkpwUEwyRUxUclJTcTY3Qkl0emlMUzQvTCtaWTFPTG4raVJzQlluSGFp?=
 =?utf-8?B?RzVxbTFZRSt2a0kyeFV1R0ZMdUErUUpDajFVeStPWElTRm01ckNlcEZHZ1Yr?=
 =?utf-8?B?U2Vuc3pLNWJpRzdPa3p6T2crZVJFcUdzVHdPcXZYUlBEaWZwKzUySmJYbjBw?=
 =?utf-8?B?Ty9wbUpYSmRhUTc5NjlESmt1Zi9tWitKM29ic3ZIa0gyNlgzbGN4UEM1cTRJ?=
 =?utf-8?B?d1c4VlhoTlBBanNSVkovOWF6SkpReXNtekMyanNNZlZWT1NkUWJ2VVkvZ0p4?=
 =?utf-8?B?bnlCZ0loajg1bk14ZFJHazA3b0ZuK0xMTjliM2ozMTdpbkZxbnRNUmRUYWpn?=
 =?utf-8?B?OEdpWGlRaEFrRGlsUVB4bHhmdUZVU3R0OHdmWmxPSTBzZ09VQS9JZ3dQa2pH?=
 =?utf-8?B?Wk9UcTVuemROVXJkWFpINHNLV0VnV0NTWVYxd0ZaV3BGemovdkxNR1hTZ29j?=
 =?utf-8?B?a1dmd3A3d09vcU5pYW5xdTNjcVl6bHg0MHl3M0hkYUNxRmlFaHQwUm16UGVo?=
 =?utf-8?B?VnRreTNPcTZoR3A0MnRYSElRS3ZLL3BUS1kxbHhOaG0vT2RFR1hMVkp6OUZu?=
 =?utf-8?B?eXhYK3JsL0N2NjhURVVJNEoyRmh4dWFRdmc4SUxScnZGWldFK3VXQm1vRzEy?=
 =?utf-8?B?QVVsT0xHNGEvMjZNUHVyandmT2tST2NrSmZXVzVqWlMvTXk4RnZhM3dTL1lU?=
 =?utf-8?B?WEQvVi80eGR3bVpmQ3EzbDNvbFgxSWhVanYvMVluVHYyWmRQbWgzY1pjSHRK?=
 =?utf-8?B?T05kaEJ6WnhRa0dHMDJEYllLbVdZcU0vSEcvM3RyOFJLRFNDejVoWkZYaDJp?=
 =?utf-8?B?U0xYSjkvTWZUYVFLL1ZacDZOd2VmUC80U3AvMm83TzhodlVjS2VtTmIzQTM5?=
 =?utf-8?B?WlBDSFdSQVgvc0x4aGlLT1ZwR0VRSHc1OEJXSEUrVlMxbjRrNVZYZmw5VDB3?=
 =?utf-8?B?SkxuZk4wbWt5RkZuWDZoaFUyT1EzTVhxUkx6SWxmKzdvMW1aamZiM0NMS2Fs?=
 =?utf-8?B?S0pqbGx1QzlqaDdiemw2cUFTbEh2ZEdUTzQzdkxucEt4ZnFYNXgvZHA2ODdO?=
 =?utf-8?B?TVpjcVA3bE9RMkhtbUpzb3ZFUGFoVmcxQ3B6Q2h1Z05aVmdMRWtOT2Nid29G?=
 =?utf-8?B?bGs3UFJVYVZBK0NnMVAwZS96eExTamtlN0liakRWRy9wdUhyOEFldHFyMm5m?=
 =?utf-8?B?RVN2cTJiYzlsMmltV2JvT0cvRDRHNTR1Lys3dDUzbXhCL2FvWTRDbnVmM0lP?=
 =?utf-8?B?N1d4bWM3VjhTYmM0R20zOUZWbEVhNUlRVVlScVJZTnVqTjNmOGhzU1RNZXlj?=
 =?utf-8?B?eHJ3YWVPQkdobEF5WVhkR3lOcFBZbDVaZXJON01sblpGeDA5RHQ4TTM4cGow?=
 =?utf-8?B?UFNJWWhVYUN6T0xLZU4rQWZzM2dNaHBuYUp2YzZpSG1JOWpTYzRlYllWOExP?=
 =?utf-8?B?Mlk2ZjI1NXdxcVVheG4xUDBOOVRXNWdZZWl4M3IxTkY5QlZBS21KUkRRNUtk?=
 =?utf-8?B?QkEvYUl2aFpBMHdPWklxM09NSzg5MWdtOWdxL3dGZ1dYY0pXMUxXMytOYUZJ?=
 =?utf-8?B?MXB2VVB4YnBhN1UrZ0E5eUIzd1ZXSzFRbUZOSzhYZWk5MlBudzNWVklJRFRP?=
 =?utf-8?Q?xVsD7Wqst8AAZVUMjiECWHQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dddd68-d832-4cd2-8191-08d9fd27e1ae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:09:58.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwDxTKypMNVlKSruhK+Htiu06vaSlBw7K+AZq8739M6k98SwaZ33P3YWrdMvGS1YR29otpOcmr2Iq1URLeTS+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2563
X-OriginatorOrg: citrix.com

On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
> On 03.03.2022 12:19, Roger Pau Monné wrote:
> > On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
> >> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> >> binaries"), arbitrary sections appearing without our linker script
> >> placing them explicitly can be a problem. Have the linker make us aware
> >> of such sections, so we would know that the script needs adjusting.
> >>
> >> To deal with the resulting warnings:
> >> - Retain .note.* explicitly for ELF, and discard all of them (except the
> >>   earlier consumed .note.gnu.build-id) for PE/COFF.
> >> - Have explicit statements for .got, .plt, and alike and add assertions
> >>   that they're empty. No output sections will be created for these as
> >>   long as they remain empty (or else the assertions would cause early
> >>   failure anyway).
> >> - Collect all .rela.* into a single section, with again an assertion
> >>   added for the resulting section to be empty.
> >> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
> >>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
> >>   .debug_macro, then as well (albeit more may need adding for full
> >>   coverage).
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I would have wanted to make this generic (by putting it in
> >> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> >> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> >> LDFLAGS would mean use of the option on every linker pass rather than
> >> just the last one.)
> >>
> >> Retaining of .note in xen-syms is under question. Plus if we want to
> >> retain all notes, the question is whether they wouldn't better go into
> >> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> >> notes are discontiguous all intermediate space will also be assigned to
> >> the NOTE segment, thus making the contents useless for tools going just
> >> by program headers.
> >>
> >> Newer Clang may require yet more .debug_* to be added. I've only played
> >> with versions 5 and 7 so far.
> >>
> >> Unless we would finally drop all mentioning of Stabs sections, we may
> >> want to extend to there what is done for Dwarf here (allowing the EFI
> >> conditional around the section to also go away).
> >>
> >> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.
> > 
> > LLD 13.0.0 also warns about:
> > 
> > ld: warning: <internal>:(.symtab) is being placed in '.symtab'
> > ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
> > ld: warning: <internal>:(.strtab) is being placed in '.strtab'
> > 
> > So seeing your mail where you mention GNU ld not needing those, I
> > think we would need to add them anyway for LLVM ld.
> 
> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
> pre-processor conditional keying off of __clang__, as that used as the
> compiler doesn't mean their ld is also in use (typically the case on
> Linux).

Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
but I don't really like matching on human readable output like this.

> I also don't want to add these uniformly, for now knowing what
> side effects their mentioning might have with GNU ld.

Wouldn't it be fine to just place them at the end, just like it's
done by default by ld?

Are you worried about not getting the proper type if mentioned in the
linker script?

> >> --- a/xen/arch/x86/Makefile
> >> +++ b/xen/arch/x86/Makefile
> >> @@ -120,6 +120,8 @@ syms-warn-dup-y := --warn-dup
> >>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
> >>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
> >>  
> >> +orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
> > 
> > Might be better to place in xen/Kconfig with the CC checks?
> 
> Well. I've tried to stay away from complaining if people introduce
> new tool chain capability checks in Kconfig. But I'm not going to
> add any myself (unless things would become really inconsistent) up
> and until we have actually properly discussed the upsides and
> downsides of either model. Doing this via email (see the "Kconfig
> vs tool chain capabilities" thread started in August 2020) has
> proven to not lead anywhere. I'm really hoping that we can finally
> sort this in Bukarest.
> 
> > I'm also wondering whether we could add the flag here into XEN_LDFLAGS
> > and EFI_LDFLAGS, as those options are only used together with the
> > linker script in the targets on the Makefile.
> 
> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
> the respective post-commit message remark.

But the calls to LD in order to generate $(TARGET)-syms do not use -r,
and are all using the linker script, so it should be fine to use
--orphan-handling=warn there?

Could we do something like:

$(TARGET)-syms: XEN_LDFLAGS += ...

And similar for $(TARGET).efi?

> >> --- a/xen/arch/x86/xen.lds.S
> >> +++ b/xen/arch/x86/xen.lds.S
> >> @@ -12,6 +12,12 @@
> >>  #undef __XEN_VIRT_START
> >>  #define __XEN_VIRT_START __image_base__
> >>  #define DECL_SECTION(x) x :
> >> +/*
> >> + * Use the NOLOAD directive, despite currently ignored by ld for PE output, in
> > 
> > Would you mind adding GNU ld here to avoid confusion?
> 
> I've done so, but I'm not sure if implicitly you mean to say that
> LLVM ld does honor the directive when linking xen.efi? If that
> wasn't the case, it would rather seem misleading to have "GNU"
> there. Unless e.g. LLVM ld can't link xen.efi at all ...

So the one installed by default on FreeBSD doesn't have support for the
i386pep target emulation built in. AFAICT the EFI loader on FreeBDS is
built using a pre-made PE header and assembled together using objcopy.

Thanks, Roger.

