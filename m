Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D57428BD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556864.869704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsre-0000Uw-Vo; Thu, 29 Jun 2023 14:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556864.869704; Thu, 29 Jun 2023 14:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsre-0000S7-SV; Thu, 29 Jun 2023 14:43:18 +0000
Received: by outflank-mailman (input) for mailman id 556864;
 Thu, 29 Jun 2023 14:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPCb=CR=citrix.com=prvs=53747fb4b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qEsrd-0000Rz-HM
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:43:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 469646c6-168b-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 16:43:15 +0200 (CEST)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2023 10:43:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7121.namprd03.prod.outlook.com (2603:10b6:806:332::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 14:43:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 14:43:09 +0000
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
X-Inumbo-ID: 469646c6-168b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688049795;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OJKqDEmMQ1FCfTzvc4qujnDMbSK/MU1gPucHGaJGpuQ=;
  b=Wg6msNY9xDPhdWo+abmsgonVQxyjZyXwvL/ZL1NeaConBimHMMH7J1ks
   PT9SBMuVtcIzvsS66zfGBWdnO58nkgxYuneo1vQD/HavLtAnDMiGuqJmS
   JjfM33jHjsJGaCJL3VkwAVlbWxjbVz8iIDU1cV3o0CkeS93HAFq8+qIWT
   M=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 114639190
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/yGE7qxSAg8M26zdTj96t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkUHx
 2MaXjrQbPmCamamLd1zat63p08EsZDSxoIyTgpr+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRgP6ET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU9+8
 8AEAhBcVBeKu+Gowa6nTNNdmu12eaEHPKtH0p1h5RfwKK56BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDSVkFAZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiBNxJReTprpaGhnWMynYZERM9WWeirKeLh2WPQ/JeN
 XE9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+zpog21k7LVow7TPLzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:y5LKw6M+Ax0mqcBcT9z255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBYpTnyAtjmfZq6z+8J3WBxB8bZYOCCggeVxe5ZnOjfKlHbakjDH6tmpN
 xdmstFeaPN5DpB7foSiTPQe7hA/DDEytHRuQ639QYTcegAUdAF0+4WMHf8LqQ7fnglOXJvf6
 Dsmvav6gDQMUj+Ka+Adws4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiPuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjLf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W7AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABinRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1pol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSKvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdx2Gyj2MSeAtAnWu4RjD8ATgMy5eFOrC1zMdLkWqbrinx1FaferHM
 paO/ptcovexCXVaMB0NjbFKupvwEklIbwoU+kAKiKzS+LwW/vXX7/gAb/uDYuoNwoYcUXCJV
 ZGdATPBax7nzWWsznD8VfsZ08=
X-Talos-CUID: =?us-ascii?q?9a23=3AvsGtrGoGBgSFhJzYXkohw3LmUe4VdEHB5leBGUi?=
 =?us-ascii?q?xNWV3SaGJT2Wh5Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:zOX8WQjt2ai8PIctEyhGOsMpK8ty6b2gI0wxiJhYicSvBDRQOimgpWHi
X-IronPort-AV: E=Sophos;i="6.01,168,1684814400"; 
   d="scan'208";a="114639190"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb6xIWsVxb0yznrofvL/0W+zZ3iOpiNj9Sh6jMT32PUfDSjndQH9nSl4AwKJ8/YrYqLbOPH4HmSHVKUebNRTUaATssaPA8z8zuMI6I0LrPrevm/RbAPuP89rHXwuDf1ILHMNQpI/+LQ1cBM+9uqGLKMkksa+e/g0+TIHxCZYbljUtUveW4KQjRE5reS5mgjnTLEylB82+RHTNSo1rPP5B2kQ6ZV+RGNYPsZFf88jPBhrjkZeO1KOyuMJtBHorZnsKGHRqeZzKzRV/4c98M8EAjc0IJp6tEHVoZG1y5Lb36Km71giE+3kzzNUK0+ZWk+CYIlQ/gjkFtiqr1t9GSc6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJKqDEmMQ1FCfTzvc4qujnDMbSK/MU1gPucHGaJGpuQ=;
 b=PkYlOpx4BTulEq3mD66QNt7rhC4XRX6Xek5AJMCDM87cNQug+zfA1oJt49Ya/q1l6bevMOZYO1sf8b4X68nBPf0xZOIK82GVnijpOtCebQEtW2s1voDfGj6RCa6pFZHbYi5PLeJaT44Tg6lzZJmeu9Gn8T15ZFPZYoginK1b1pWuq/CjrvlKqj1G4mlUZbw3tXOijkJDZAniGt99x5V0E0uSUniCaGr07y8RY53ZgkQW5ObgiI6K7fquLRsM1pC2IKCqb6CO1ZlYpLqY+mA4hQJwJHRgoWRJqsjO4zRmRpjrfM86YrS0hLrMMEBckIUGgVUFxXccNOfPu6eEjFHyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJKqDEmMQ1FCfTzvc4qujnDMbSK/MU1gPucHGaJGpuQ=;
 b=A+ejZYOXNtIEoGD2Q+YEtU7mVAiWdYCtN3VIMgMV+5z+Nh+w7Hx3Gv8VW4EV+vozWDgPJH1JvsZixPE6AA7WEIykpztDgAN+CEmLnwgB+zeIN6JjMxItmxLwQUbs9hKg6HPd/4e/CgVFxCZ5d0ltDP2EkBLUH2PcXik2LyY1oWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a71be07d-62e9-d0a7-7eb1-64af90e7f209@citrix.com>
Date: Thu, 29 Jun 2023 15:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/sysctl: Correct comments after renaming
 xen_sysctl_cpu_policy fields
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230629102600.61262-1-andrew.cooper3@citrix.com>
 <ZJ1eDWXGzwyHTSsf@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJ1eDWXGzwyHTSsf@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b32ba7-fdc3-4723-34a3-08db78af282d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fFNp/xkHOKyBXMTqW2uJssuyKfgEWIWfxkDalOcrh75/C5Sy5P9st+v2yOpINUfzWnGW/ZTpcdaUdMLiNRVrtKsjwlW4vI9OXC8yHMBZdFiKn0Kwu3Frk/jVv3JV/skhfFMZTGFRu41udEQdQ7XN+4p4K1xmq4lajMPR6XM6lq6nE4YjhyDQEyAkiMUkftCn3UjVUUcC+0qeqE/IrlToRAUKiyEWPMNy3bNuPSDcpiKXQeLCLACbcjwCfRiJ1r7O7No5LAy5HCYgbn/SnMAMaUXAlrf5dQqFJ+nl8WRfuGrlHh6vndKFBdlSLGSomxE+rBlyuHo0Pb7vpSOlSv2WkKb2OmFN4JLwiRhI+peyai9lZaHkNWSlGNxaO3WOYiTn4x+1jF6shJulXbGa6OuKbxNluESNEEMoNobMKNrIGoHawY3Eg85IrdmDBTjPm3AeR/IbYAOg+7qr0BMFnOAZsP+hxfgQxCDMaVl9uUanrZTiSraBzx6WRxG4/b0HYDMb+tjF2yvPH+EbROWre6pvSIZE+PbtxHBRZHSVvnWaq4lDAwXHRXZJy1QOMiul03q7QyvbLwPGFxHTKteSuRBNXnoYyV3PJS1G+qcfFKWbdf81u0aedpF90CIDEE1LBFVA6FbpimlVATipT7+xWuQKcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(316002)(8676002)(66946007)(66476007)(4744005)(6636002)(6512007)(6506007)(186003)(4326008)(53546011)(26005)(8936002)(6486002)(54906003)(37006003)(41300700001)(6666004)(66556008)(5660300002)(6862004)(2906002)(2616005)(478600001)(82960400001)(38100700002)(31696002)(86362001)(31686004)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHQ1ekNPMHc4aEdobElRTTArWWNZbVFhYlp5RHdIdWFrZmlBbC95QUdmakxX?=
 =?utf-8?B?QWp0WFhmYWYzN1ZqV2h2c2ErdiszeEt4V3JsM3VTc29mbGdPWlJNK3U3Rlh4?=
 =?utf-8?B?NkJSSzBQMUt5T2xpOXk4SFBSdWZzUFR2STRZWlJabWFVWVJ4SmxkdUVjVllE?=
 =?utf-8?B?MmcyYkpRc3pacFM2ZzhaeHJTRWs4N2FtL3IvZy9BSC9kMFV3QXgyR04rWDNR?=
 =?utf-8?B?RmdaM1c4RTRKSU1xYXpkSDBOL2ZGcFJtZDZTWk9HWGtnSmhpcEVESk9NVWQr?=
 =?utf-8?B?MEZqU1BuOU9yaC8zekZabHFXRUJUT01YTE9uYTJSa3FJcCtUeEQ0anUrVnZ4?=
 =?utf-8?B?STBocmVxdVVKY2lDK2s5UUgyQmpMRGljSGxWZ01WODh5QlhuS3lxT1p5Zm4w?=
 =?utf-8?B?bm5Hb3U1SlVvNlpabHlVTmJpeXF3OTlWd1hRK1ZBYlZYMjZOMVNDM0c2MVZ6?=
 =?utf-8?B?bEs1TlJMWUdUMDhRUWdQbHQ5SmtyR2VyQWtCWEVIdjNKZzVMZms5WW44MTN2?=
 =?utf-8?B?NEFmbHBORXdCajQ0UkQvZjI1TDNhemNPOWFkbDJVU3pQdGQ4VDU5ZDl2dGZY?=
 =?utf-8?B?K0NxM3doM1gxclVwNkI0SkxBNU0yV2w0NHp6VTZmMS9wcjVoV3JraFZWdlE2?=
 =?utf-8?B?L0Jzejd2V0FOOS9oY1VpSkt1bE9vUDJ3Zm1vSGliWlQvVStYVFZCTS80M3Fk?=
 =?utf-8?B?VEh6OWQrZVZldGg1bHdqV0J3QjhaeUhIelRBVXRWYkhoeUFIMWJ4czFpRzhn?=
 =?utf-8?B?OEhRcHgybVhuVEM3UkQxUFlRQWFjeUk0V1dFYzBYTDFHRFppTXdiWWlqdHh2?=
 =?utf-8?B?Q3ZlM3IrQy9GMXVoM0d6OXlwMFQzNHl1V1hDRmNCK0xORFdxdzhOa0J4QjRw?=
 =?utf-8?B?dTZucXNpbTdCMDFYZGRyd3RUTW1NQ0NkaEduVTh0RjlnbGhMaUc4RGJzaEpL?=
 =?utf-8?B?VTVYT0tJVTV5ODhBcUpsb1dFczhoc2NmUDRMcjluSjkvaFZDbUFXSks0OGpF?=
 =?utf-8?B?NmtKNHI5MENRYkF0TjN1Rm1FdVFxNGFiWnhHMndpdkVKZ1ZndTk1VGYyV0NZ?=
 =?utf-8?B?Rmw5bzVBZVhCSzYzYlBvRnJYb1JVUDVaY1RmMVhJdjlROUxwZ1daQVZMbUdL?=
 =?utf-8?B?TFBiQktmVEdRK1Q5ZHV0L2dDUTF5LzZkbGRTeUNRV0RuUEp6V05IdU9SZUNh?=
 =?utf-8?B?ZExyMms0ek82L0IvZnZBa1ZGVlBVVWlRdkNJR1BnbGtRR0txYUdRU2JJTURM?=
 =?utf-8?B?UFhJM1hoVkFPcWtkT3dWWE9XWEFTN3pkNnR3c3M2WVJmM2x4SEtiYzhSTTZT?=
 =?utf-8?B?ZWFOR2JWMVo1emNPK0wzckEyL2VtU3NiL0p5ZHRDK1R6NmdpTlN2UllPeDc2?=
 =?utf-8?B?Um1iUTJnMWZMRU5RNDRyODJWYXFzMDFFRXIxR0FTSytGdHFaTGg4QkhNbml1?=
 =?utf-8?B?ekdBNWhuWEZGVlpaTXQrMHc5V2FFZ0JPa1FGMjFjazM4RVZtbndKN1h6UmNC?=
 =?utf-8?B?RnpLY3A3Mys1aTA4ZmVMQUsrQ3VrNlF5U3VuWGJOTDM1dWNiQjByTHUwejZW?=
 =?utf-8?B?cHRWZjlJemNFV0Q5bWk0NzFQeDVXYkcyUTZ5dlEyQjlLQVdOTDlQcWYzamMz?=
 =?utf-8?B?U2hnOVgvVVVJRkRqTlhETnl3UVBNZWNMNjFSemtPT1BtMXh0N3JjV0FZY3lh?=
 =?utf-8?B?MmFxdUMwZDBYZG1VOVgvWU5lK25zVytZOHV2cTNvRzB4cmhoaDlyQXE5OWhx?=
 =?utf-8?B?eC8zQzFZZnAyQkV3dFRWZGphNzVkWXp4S0dBdlQxQkNIbkN6MVVFZE43alZL?=
 =?utf-8?B?YzJaNDgxdy9xN0RoUXAvWWxpN1o2cmlTTDkrcWtFTEVzUU9iQmFnaE1NcWdS?=
 =?utf-8?B?a29mRUVESm82MmU5MTZuWHNGejlqYjJ5Mjk4ckZYOHFPTVJOKytobVY5MlJs?=
 =?utf-8?B?K3dNN2JtV2g3SEFDQmpMaHE2eGc2cWFlVzRHVVl5eEpMbGFldVJ0M29NaEFT?=
 =?utf-8?B?MkpsZ2hzRnltWWdtM2VXL0JPU3VYQmFCNmJFdEEzYlE0MHMxTVNHc1F0UXlV?=
 =?utf-8?B?eEErcE02c0o3WDRHcnpnNFVTQ0ZiTW5ETlkxYXg3MHFQeCtMdENqSVFsdHZO?=
 =?utf-8?B?ZmtvaGcxcUJ1Tmx4UHNSczNmUDRBOXhFYVdoMXJHTlRUaCtRV0MzUCtNMnVP?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5S2rsitoQLo+7yFk+Wf4pAFfbw9bEfBkLUW2XKKZML2HD9foy7Zf8gcNUJCoq9uK20vxhmkPW9PvRP0sEpzFljzbvMWdX4LlOuL6kGTXZzrBQstzrj4rL2IuW14jtT55Lhf2cYT9qIShG66L4aS50Om+g7hCJprchfisND0ctWwvga+wDyEJ1JXy9eLSNP24t6OEYDKv4WCFQ7+DEeY3r9Mi+Wqg+bgBUeHx6ySCvaCv+Gm/+oo6R0vgjZxR9au5T2qY9ru9jVYvKE8JojuL+jXw+t4IGhzPsPYGDj0r19Zw6BpY03bv6LjujcF2jjECG+BFsT8bQwKj0FDRbG7obuVlOgGhdl7INfumslO7fn+JRSlXjeKlcuw+gspcGCyzNGM2MUBLquL/Qajv/4oR8DrzClH0XITTBJgjjviBr03bQ52aUKI0gS67GZglUGiXCmL2LddlH0DiSo1Advuq1Xjw/DorjTi4YYeS1qmxfLRNhWI2cGG3Hq34aAwNTSJnDjgoOQ4196wlRM7sw9X1M5sI99LEspkDMl4WtIhYoMJdj9AInMxgOR2Rfu/cpRMTycrgLlzTUed4fihhrB+SA1Nd/CfNA/GE41VuLfU/ISFS2ZRv97ZqbnkEpTxR3i3CZ+HoGb6QTZbzONKs0Diioa2eg5c381hi0IJFGEWnqJLJXaG7TenhYh858stbwxqH0dH/eJ7LlLrpR/1xvVi9vwYMUhVecJ5zlsVRDEqyFZk5kZn5E2GtjoQLBp8Yp+jviipJP1jIhcg2MdJiRlPLa8HKIphzcBj7NyPdUEnlBM6TzDyk9Dma2XSefymKYt8x
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b32ba7-fdc3-4723-34a3-08db78af282d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:43:09.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjsAlMlELn9AJEjt+nNIz5Vx5tm0T4H4MGhQazVtC/M4la90Q9C6bYxYk4Ox/1O8U/3l7Y9WOZvrQbqpZvwZz51shD6kfuyh2dz4GqT86/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7121

On 29/06/2023 11:33 am, Roger Pau Monné wrote:
> On Thu, Jun 29, 2023 at 11:26:00AM +0100, Andrew Cooper wrote:
>> Fixes: 21e3ef57e040 ("x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but I've just noticed that domctl needs the same adjustment.

The Fixes tag ought to have been a clue...

~Andrew

