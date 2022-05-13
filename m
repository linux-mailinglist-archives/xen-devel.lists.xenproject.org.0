Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB68525BE3
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 09:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328255.551240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npPM3-0000zV-KV; Fri, 13 May 2022 07:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328255.551240; Fri, 13 May 2022 07:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npPM3-0000x9-Gn; Fri, 13 May 2022 07:04:51 +0000
Received: by outflank-mailman (input) for mailman id 328255;
 Fri, 13 May 2022 07:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npPM1-0000x3-VM
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 07:04:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f901c16c-d28a-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 09:04:48 +0200 (CEST)
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 03:04:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2492.namprd03.prod.outlook.com (2603:10b6:3:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 07:04:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 07:04:43 +0000
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
X-Inumbo-ID: f901c16c-d28a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652425489;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EQPNm6oizKUTl/Nk/M01c1cy7Kwjr+OT4Va+ySoxXe0=;
  b=V0LwpWpujYkrkjL15CHU3W9f9strJz3PLFSBcHtaWGf5hmM1T1a5lFZv
   f5D7qUC1OfZIO5CpXQ+eiiybnaf8oC0LfYxFnM1Wug+B0QuyrDasOnox0
   wgCV1FhY6uK1sRjqdhTnBDm8LYKbVjkI1F9ftHp8ym+CqfNGyO0PZqOU3
   A=;
X-IronPort-RemoteIP: 104.47.58.174
X-IronPort-MID: 71241815
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5qa+U6OffJKMWPrvrR3TlsFynXyQoLVcMsEvi/4bfWQNrUpx3mMCy
 DEaX23SPfncYzPyctF/a4nk9B5VuMLQz9VqHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Uw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 4pTk7a/ZyYVOYKXh6daVRVKIwBmFPgTkFPHCSDXXc276WTjKiKp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7EdaaHPmiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33yOjKm0B9Tp5o4I1wlPKlj5K7YLpG8XJfeCOdJhep0iX8
 zeuE2PRR0ty2Mak4TuH+3mvnejJtSj7WYsIF/u37PNnhlCVyioUEhJQSFjTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4FuQ77ESHzPrS6gPAX2wcFGceNJohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:MSw4Hq8rC2bRbCJukD9uk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71241815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQy8KcMnT5E8hPxFStSFRmYhB0L8edNKzxLJILb51QHCb/A6cLSqSKpqD07t1mmjPaY3kV0IR5ukyOQQI0PO6ZUakNBO151OS5BJSaz4aEI4ImoODLA9jSOyOwwZroW8drF09el8slERaC1GbsZC29UTUaIndvKRWt6TLwO1l8X1rtelhdOimNlrq51eSqXPUUgC09h95ws2vvDS4Fj3lyFCFQ6fhsR12L1w2zyaKb5wCmitkZtOoWHe9BKsZK4lhySj6pla8Eq8hVmvbIRwUcAiTZHA5en9OIxpXTX2BeXbG/7lBmK9aCrTY6Vbhit+zV7m6ig19saiUL4mW/rqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKEi1H2M7gd0WpbJ4Wgq1vXG/vUa0Ajvvk3f4N6sCw8=;
 b=Nb3jQmK03+7aVsTY/x3ZqIRqaLF654EKoHThvSDvx6aIX0gSmO92aBr9DCQQzBPYtb01ZTX99aUHT8fEZq5oa90sms5lTK49mnNynXC4tpOlRq+/Q/pK5HFFcUbPyHrhS8Wdf9ENE9rdbDnFzcfK92K/GfaW6nslIm1ZdlhSGQBU21YdPvOn8aIg5v/LT2Y2xePU0q2MnuKMfn+VOy1SXIpUOQsKeJcacsL59IeRqkKIx20IHrzdzQnTFu/zrbZLes1f5gn0NaQZrr4a0NjVXgjxcSNrNdQtdzh/gv9pxcLRaGxGYX4ih+nv6I1+JtcH87YZtRPcbYsnXNSFiLj0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKEi1H2M7gd0WpbJ4Wgq1vXG/vUa0Ajvvk3f4N6sCw8=;
 b=CnRy9yKzhUEGFOQvWqfX4YzlnPJYPsGjx5Uyl3KHizwlDdxXMtfZdeH4uYDyuffturaxiUcJVJGkSDyXzRfVmpYiZIizaWVSq0KuhmM2VvCEPZkk2XRuc/DP2ajG8EdFMheGCFTlmLkg+fUR2RJYEF9Av8iZOa/O80NBgFbHa0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 09:04:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: update Debian Buster install CD media to 10.12
Message-ID: <Yn4DBs1ddZof2JIE@Air-de-Roger>
References: <20220502151448.19578-1-roger.pau@citrix.com>
 <25213.7948.2636.838505@chiark.greenend.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25213.7948.2636.838505@chiark.greenend.org.uk>
X-ClientProxiedBy: PR0P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0352c6a4-b1a8-4844-b3fc-08da34aedb44
X-MS-TrafficTypeDiagnostic: DM5PR03MB2492:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB2492F8F3B82559E738FE57DE8FCA9@DM5PR03MB2492.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tYfHX8jm0E3gIyb86bK8XLMcpUJG9CCnXo7rxyODKdTiU5eRhE0aJTmizE82zl0gyaR0wXkBvmCOiDYE5GhUm+RnUac8RZ8eQhooOf18TrF7w0yNQ9a2eRmR08uRDnu5H4ldnDgwcsCrpWqgI1MLt1zqq6/Vk5Navg7rKq4Wn+LqG9pSziEyBpX+oPGPhrCUD3QJ1ELY+2f5ru6+7o5dOktg6CxBQ92SeZYfcnh0FGWeF0hisOlpkGnO4JBeldIU1n67hxmXt9qZXjpWDlg75V7tMvRDi+WlfdRS9ZhGqy1WZDW1WWmMHw56ODxlXuOL8aFmC7Mch6KLfSmnsEXam0EHuXN1193JkhAH4EusSqLWt9q1qwaiMpPFv//eYVy/Yi2bD4JCBtgkkYYprdjU/XAFkFm4H1NC9Q6VymN7K5sLr8MBGEyA5ViVLE0JP3HRl3eWDx1crDtJ0uhFfmz459gw1byDD2OfKAIVmyPeK4SahSLC8HrgiZO+Bwwwh0aN7gxQcp9hbIilWPn3vCICMW5SK9iLo+b+xVEbJJkk9p7Zb5cQccWjG6ZvC2LrhPJMlx3CKU5CsSHKFB8VPkifcyFtrWF7GeUdPfbRYdFT1TIJ3HNJrLHaK4Lhp8XNn3ZNCC9h7yxNo1C5hAtNy5aG3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(6666004)(6506007)(83380400001)(6916009)(316002)(66946007)(9686003)(6512007)(26005)(66556008)(85182001)(4326008)(8676002)(66476007)(82960400001)(5660300002)(38100700002)(8936002)(186003)(33716001)(6486002)(15650500001)(508600001)(4744005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNRMytBTXB1OEFRMHZid3hKMlVYV0pyUUZiTENKWlordE1VMHdMdUNBZHNm?=
 =?utf-8?B?cmlaMTE0MXhoMlJrTnZBOUFiTXVBQzVoWXVkVVM2RUQyZGJNWHB4enVvY2Vt?=
 =?utf-8?B?WGJhNElMSGxJdlRmMy9VcGVyQ1NOdVhhUW1pNmROWGgwSys2QUh2TnJWUUNE?=
 =?utf-8?B?M2RZTVoyWmxFbm1WODVJMWpEaVBiS2o0RytNeXRIMWRYNzVZTWpaK0ttK0I2?=
 =?utf-8?B?a0RYOEl1WldPRW9kSVZoZzNQYlNselgvOGI3OUEvMDkvT3hhanVBOGRlZjZP?=
 =?utf-8?B?VUduMUN0MEFpU0VGRXdhWGUwNU5HWUtvU1NIVzFEREtNVWdHdlMxaVpSK2Ry?=
 =?utf-8?B?U2JqUXhMVlhzQzNwNW1qU2RLTllaVjdLWnZ6N0lHM09qL3J2aDlwQ0dRV0pB?=
 =?utf-8?B?T1h4TkgveHFjWlBFSk8yWnhIMnhPTGZ3RXVLR2NValROUmVrMXRua3A1QktQ?=
 =?utf-8?B?YVMwNnNZMnJHaHNDcEFKdGRlbkJhcGt0S01WL3BtN2svNk5XWFB3TzV5Ky8z?=
 =?utf-8?B?bS9senBLL0laWGJFYlJRblhXZktuVG9ZTzdSc05XcG9kaXdPZUduVUlXejl2?=
 =?utf-8?B?SGt6N0RiWXp5UlVOZUMxcWt2T0U1NHpRZVViTW9JcC9NblNRcHVzMVcydDhS?=
 =?utf-8?B?aVY2WTRXSDZTVVQwemc0WU9zcUdkOElTNGNmWmpaOXpRTm9rL2ljVDJtRG1L?=
 =?utf-8?B?WjBFZm41U0xaek1Sd1gzZVhmOTJHL1pSb3FMY3g2dm5OMlNXRTR4dEZVMXFP?=
 =?utf-8?B?cWtIRmt0Q0hQK0V4ZUdhNU5DNXN2TTYzOVV4N0lVMHNUWmpGcE1QWW1IOHlZ?=
 =?utf-8?B?SE1UUXZHUVFpdFM2V0dTUjk5MkR2V2ZmY0J4Ky96OVA2R3JoWGwwNHZCOVZH?=
 =?utf-8?B?WkVnd0FpbG9vNGFBVExBN1NneUFsZCtaUTBTMUowdGxZc3E3aGJXMExhSHAr?=
 =?utf-8?B?L1pkUVNIb001bW9RZkkycE9TSkMyYXRrYWdkNlhEVjJVZC9CSEJqeXdhRWtP?=
 =?utf-8?B?M1NsejlpQ2p1dFFqRGdkMnYzK3o1WStSMTB5ek1UakIxZm1HK0tDdXlYM2hh?=
 =?utf-8?B?NEJrUXAzNjJFek5HVzhMQkJycnhRaDJTMzZtMUZWSUdDVmpQNGlIRTk3dlYz?=
 =?utf-8?B?NkYyYTNLTW11dTVUdUo5WitXdVRrbDhhOXpXTzhEQlczZVgzcnpjTnV4SEE4?=
 =?utf-8?B?YTdwRDdtdGlUZTU1ZFN1VUd4dUFEOEdqKzY5QVYvVEE2MWEwU3JVc083WGRB?=
 =?utf-8?B?SnBPSVVRcHJDQ2lQN0pzUXk0UGJ3WDUxSDN1cnZTaHNzdGFKZ3RPS2F0ODdM?=
 =?utf-8?B?MHBIRVVaOThzRlM5c0F2Z2ZVSWJkbkZDeFZqQU1hM3ZidmxkSnhadFZacTdw?=
 =?utf-8?B?MkNhcTJsWStLT3ZUMTNnUXEwT3p0eGJHU085blB1cTBsY2ZqaWtOZVNXZWdK?=
 =?utf-8?B?WnM1M0dTNk0yTCs1V1ZQRWhTQ1poTDlrRk9pMXZnYUVib2w4dU03QXYzYkYw?=
 =?utf-8?B?dFZZcnhTZW9NbHozS00xc1pBK2hlYWtXMmd4S1I2Tmhsemw2TW5KT1pEeGlN?=
 =?utf-8?B?ZlZwSDM4emdjNk5wQkxpWFhDNG9vKzNucldtbEk2UFh6aGJ2UU83aE9GM3VD?=
 =?utf-8?B?Y2hsdmJEZXdQb2hQOG14ZW9YVWRhbnYvTmsyUEV4U1FjSEFZS3MyMFV2UnFx?=
 =?utf-8?B?TlJPL3A3Mm5jekUrdkNqUWptcUEvalgzTEpmcGpIdE1oakxJakRCbkkvbEI2?=
 =?utf-8?B?L0hsTVRjTDBScTRLYnc2ZFRGcFpCNDltczRqejJjT1ViKzluVWdtMStsVnl4?=
 =?utf-8?B?WmdhTCs3YkN5SXdTWXdocGVCa1U5S1J6aDZxUVovRVZEdkFYSkxtN0xyUmkx?=
 =?utf-8?B?dXJqYWRZdXRFNlZqeExkUTMzbVNDM0pqOG1sL2lhdkRERFFqVkozOFgwS1M0?=
 =?utf-8?B?enRZZVFRVzhYbDFkRkFxMVBKOVdLK0lTTGFTb1VlTFMrVUU5SVFSUmU5aDNK?=
 =?utf-8?B?SmtzNWt2NmlTL1RrbXJFSldpajd6cG90bVJZOStyWVowb2w3eW1JdlVkTE10?=
 =?utf-8?B?ZDhkZnNhWWMwa0VZbjNTbCsxNHhhNFBMTXo2bFpmMWxVNU5SaWo2dGRqTVZQ?=
 =?utf-8?B?aTltd1l4NkU3WjZhK0FZYXdNdG9DZDBqT2t3aXlGR3VhK2lQZ21YMUJGVDVu?=
 =?utf-8?B?dTRCb2c0cUNmV251TUV4SjVENk1CQmpkR2Vxc0JYNFUzam5tTDNBa0NKNnBa?=
 =?utf-8?B?TURRU2xIdDJYY011VXkwc0QyYk9YYU83Q1h0aDlKSU1tT2ROM3VnWXM3dUZR?=
 =?utf-8?B?cmFsMUJwSitOSVFEOTZ6ZDBZK0Y1R0NSNmdKTGxGMitCSzM4WlpRamtxdE9K?=
 =?utf-8?Q?rRhk812toNEXrDzc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0352c6a4-b1a8-4844-b3fc-08da34aedb44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 07:04:43.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYP0g1ulDkiXT/OTu6ilFyxKxIi4VuE2fLzNxqgF5OfxV6zHeujL/bhfTA9zMVYSPxlE5kg1haQSDKHAl2VaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2492

On Thu, May 12, 2022 at 03:51:56PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH] osstest: update Debian Buster install CD media to 10.12"):
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>
> 
> Is this just a routine update, OOI, or was this to fix something ?

Mostly an update.  We have also noticed that in the i386 HVM installs
sometimes a softlockup happens, so an update might help with that.
It's a heisenbug so it's early to know whether the update did fix it
(it didn't happen on my test run FWIW).

Thanks.

