Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1A6A411D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502432.774224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbwI-0005og-Nb; Mon, 27 Feb 2023 11:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502432.774224; Mon, 27 Feb 2023 11:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbwI-0005ly-KT; Mon, 27 Feb 2023 11:45:06 +0000
Received: by outflank-mailman (input) for mailman id 502432;
 Mon, 27 Feb 2023 11:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWbwH-0005ls-E2
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:45:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac7008d-b694-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:45:03 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 06:44:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6434.namprd03.prod.outlook.com (2603:10b6:806:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 11:44:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:44:55 +0000
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
X-Inumbo-ID: 2ac7008d-b694-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677498303;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PLYPO+K+PZYmlc4wnkp4s8nj5lDx2gVX19lZzf5OGwY=;
  b=cUDqKhmFC+HCXiaCAQgTJdfHVlbSqPv3xa2mzcCUzftl5N426dkfIQ0O
   1s2l2EN6r278/PL0SPZ+KmwtiyVaCQXMm2QGHPTpi7D2ZQZebVBzR4Ruz
   gk+jJVRReZi76uzzjbo+M0VOwzNomP7Svf3d4j16JEQiUXVys1tjfU4hs
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 98051954
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RI4K+Kw7MYakmBOt1RB6t+cAxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 mMaWTyAPfmJNmSkKtp+YYjl/UgD65XdmIU1TQc/qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP68T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWBp0
 vMoKCIGVzXd3/vpmoD4etld2+12eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCNpPTezlqpaGhnWLzG9CBxs4cWK1uKGU2wniGMBEM
 HEtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLe/hyLD2wDQjleYfQpscY3QXoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNpFv6zh9isQDXom
 WnU/G45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:esflJaEV7TzQBXUYpLqE7MeALOsnbusQ8zAXPidKJSC9E/b2qy
 nKpp8mPHDP5gr5NEtApTnjAtjifZqsz/5ICOAqVN/JMTUO01HYTr2Kg7GSpwHIKmnT8fNcyL
 clU4UWMqyWMbGit7ee3DWF
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98051954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXvhfaRGFwBCSHFQiF9YQK4JCXDS97oxchCpVODSDx4ySOD2yphMvle99HMW4Se2r9W0l8gWnl20eO43SAEw05nYvV6piPGUsOfIo43ZG3jxXx8LCwlVyAyRLNBe3r5SC94gRll7Z6JxXXxLzrvVH1tf+UtikFXmMumm1h4y3AHYseOmdVJifSYmSIooYnTEyQd2hQOtv0sTBeMap5IruALJFqeVYD8p66zOOMQlXGXgGh70R29nEeZkEq7NjrG9hUfMdfAMOycICjH8H/cx3cDijylE6dh1gT8jwXYw0ePIrD9AWROLEjrrF+554BY5StmWo4/YTvS226aHmJnISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBw3KyrQmvkshusC9L5CMRs+YOmuvKEumuAIUYK7BYA=;
 b=AZ8aLExKHVpHOYvAU32GeVwGTnYsKrzsnmXKbXDPLe6SyYP6l7Hztfrhrwg5bAzvLIwYQI5IjnfO1jlTKGF2e+38ANGugRl0UG3mKCeOtm7ylGD7co1lEQH3d0zHOuvy1ufocQeZFqWg1bnylb8Z67dVbA6FYon0QYzN87fzDwTn57ScOcQPxbJbAmU09h88HF6BeKEBPBF9IlNO0yXRALUNIcG29GBvTAnAk3mZVBmeJSYNIEV1U6gTOsubzeiqpvQwDgd9xKBKt6xaliUEDj35gXhWVvo+/1ND98UtecCj7boyw300LPszYQHAAXNZBmBfkGq6eXgzMqHAt8Jxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBw3KyrQmvkshusC9L5CMRs+YOmuvKEumuAIUYK7BYA=;
 b=UlIDtDJrQ0HPIHDqUqC+ifQ6pxchOkAQtEvZELv3lLyO8YAGsCs9+ggdQLvZ5zCAOu4NPS4hYhx1rj7QXzC0tG7YNnM7FhHeow7KMMtrsuGEBTpsB0bHvEPx3/EJQXgU1dHEhRCeqx3gc2qtb0Mpb27V/KvQtoaHOWpsTTWMnJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ee5bb5f6-3d2b-0deb-9215-4bd8866cfa17@citrix.com>
Date: Mon, 27 Feb 2023 11:44:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/svm: Decouple types in struct nestedsvm
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230227113533.2848119-1-andrew.cooper3@citrix.com>
 <aa33e30d-831a-d0c6-4495-0c01a380338f@suse.com>
In-Reply-To: <aa33e30d-831a-d0c6-4495-0c01a380338f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3e497b-fde7-482e-ee7f-08db18b80be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tYls0KK5OraoILXZOmqoAe9BwNpu1HtxaPrZVrpFEDFERjXSXIt20PcHGQBTkD8fQRGo4hZyMumlny0fRqvQrxfCyULKBj97oRXGyI12WtODYny9c/FelFbaCB8u6cACnmvmwUvTNPyOzKEVRr2zlE5RskzS2H3Gr/qV81l8JXbVwVu4feAMytwhJHIk6Jo+ckgMp8XY2cImqyZzglPM4hDA/WmL2bbQXgReNRv6wh386ZKpzsyi9PRryrK7g7PnhDrJ7gDWnkAPzKt7NXgr7GuPTL8jm7HRqSLuxknlEL7ScPaL9gV65gPR6WqBCxhjaoJhBBYJnrw/giz+COuOMJyKTWbzIVLiUNXiCx2WRybZw9h+ZrOZPjL+6PYdT4wHRVPovawDAZVAjPFb3ApSNNR5Za0cEMfb3yHugpKGqJjmww6kyTygyDNwRYHbL0phupBODzCjZfHB5Eitk/9Vhqyoq+lv+u0yMiWzz16I+LPCO1UqNhvJbmhOIeXXoR0Mx4OtUOre2ne6huTndHIbghybs5lA6FIXiwRppIhrILwgJ+3cFC8bryxxOEdcseBgpj3qwPEtMx4wF4j+goCkv4Meil0x7YkQDHxqy9NAPQaGqBQXOfCSqKIgCZ05l16JDaclYRqmTuqntRxKjL+j/7YrseaaURtDRf9Kzur2Dvmaw85eyX6M0Nyx1LkPQzqUuAjRIUO+DhRGtgTxPd/CH7XIrCePYPQ6H/GacON5g00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199018)(66946007)(2616005)(6486002)(86362001)(316002)(66476007)(66556008)(31696002)(36756003)(6666004)(478600001)(6916009)(54906003)(41300700001)(6512007)(53546011)(8676002)(6506007)(186003)(4326008)(26005)(2906002)(82960400001)(31686004)(38100700002)(8936002)(4744005)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFFvKy8rdU1hbkRQODA4WVZ4YkQ2aFJSRWMzQllCbElMRUF4WkFTSHN5NjhV?=
 =?utf-8?B?TEEzNTFIUTYwMG9zYjJKQk9Jb3VsTmd5cDkwWkMyeng2b3JnS083ZWxBZGk0?=
 =?utf-8?B?VzJtVmYyUW5tekhNTlNJWHJFQTN4OC9VakFtWlZ1K3VnMzR4ajJiY0FBZ040?=
 =?utf-8?B?cWxsMElTa0FyUndGTFgwOWE2a2hrb2RVU0FDamVnUTAyZHJhN3MvYjZBOHJO?=
 =?utf-8?B?blNoN3oyaVBtdUFvL2JtRmRzd1JPQlpabUlRVE94UTRHYzl3UXpZWWxYNm1w?=
 =?utf-8?B?NkZqRTdFek5jWlVmcSsyckppRVlxa205NnpielpmbmlDTkNYNjVGNEZtRFZV?=
 =?utf-8?B?WFVlRFVpWittdGQrd1c2TXIxT0hZTnJpQklEaEFpOHJ5aE9qTEhDU2FycGVT?=
 =?utf-8?B?R2kzQUt4WHAxT2thNk1BQ2VBdVU2UzlpMFlxTlJUSS9XOG9NZEpIQ2IrbVdH?=
 =?utf-8?B?SHRPelgwQXVmeFcxYW9WbmZFa0FIakZ5NHE5K3d6dTJtMFFJRlhGSDI0VXBa?=
 =?utf-8?B?NUNNaGgveHdaemtaVnY3TnkvTDF4L1lXNVNHNHRVR255NlVBQVp2OTQ3VDNu?=
 =?utf-8?B?SmJKR0NyS0ttKzh5QjREWmVXS3FTR2lwcWErQ2UxNjVaWmdlN2c3RnBibVBn?=
 =?utf-8?B?Um9aK00zdDVUZG1HdXVIOG9vbmZ5QVRrdEVxRkZjOHBmd0toWlloWk5OQnh5?=
 =?utf-8?B?RURBVXIwVDZ3R1NYUFVpNEVPTTc1QzEwYk91OE9TSFFUZVhxRWJnTWJZcUhF?=
 =?utf-8?B?bUMxQmREVVBvSTBjdGZQcjVlbklNYTMrcGNCVjZudkpVbGlLMHBYcEZPcVlh?=
 =?utf-8?B?UkplK0pmREl3RVdLTHJsLzZyWUJISDlMVFdyUGlXOVVJRk9PMWZvaTdkdE1m?=
 =?utf-8?B?c2RteEVqN1BvbjBGZFhOSWtGTjFhbkJzaXZpOFlza1pxVU1hTy91RVdpdTZX?=
 =?utf-8?B?djB5TEFDV0NGOGFqeDJiUmo5VW8zbUhVWkJoT2pITGhJeUZ6eWM2T2hEbTBM?=
 =?utf-8?B?V1ZSaUt2djhPbUdzTG8wdEF6NnovdmxoRTRSMitwdWQyd2RIc2xjS0djOWRy?=
 =?utf-8?B?Q240Tk9RTWtRMWIzTGRUcEh4bmtYeHpZYU1HVjBjWW9aWmJKeXNYMzNMQnI4?=
 =?utf-8?B?Zm01cmlxVUYxdGpzc01ISm8xTFdlaks4dmJGNHhCdGJnODFOK1grUFVRYTNQ?=
 =?utf-8?B?OWtQQ2RVazd2YTFFaG5lcGQwNVljVXhjTmd1Zis2aUtRMnpFUS81Y3JEVUJh?=
 =?utf-8?B?eGJIQlE3S2RqVGdPMVAvV2tKa0pUZEJ0VzhpTHh3SE8yamNkRXJ4MW40NnFI?=
 =?utf-8?B?eXRqdndKSXdGanVGSUErZU82ZWdrWHpPODNsY2VqMmxBalE4ejY5SG1UaHBt?=
 =?utf-8?B?cVQyc2pmVVpRMEFiU3Y0ZXNHNWY5UWpRVDl2VCs2b2R5VHkyN2tZRFJRYnZz?=
 =?utf-8?B?djgyS2N2eU5BQ2pxN0UzaUV1dXV4UTRpZHdVdWFlUmh4MTkrUmtGZWZSNERI?=
 =?utf-8?B?Y1pyZEdzbldOV0ZrU1V3NUVaUnQ4K3k3VmFFZnd1NmxlL3Fza1Z0cy9DTVkz?=
 =?utf-8?B?NGpPWWJTY1ZSN3BUNFNhbXJsNVFzTEp3SnFiRU54WnNLU0UzYnhUaXo2R3hT?=
 =?utf-8?B?TndYc3hqVWdBamEvaTIvakUzeUk2Ry8xK1dFUnlYVWI3M1FHU3I5Sm9iRGFT?=
 =?utf-8?B?YjA1MzNXZitLQm1MWTd4bkNLd2lHZmtXblBPRXI0YWFOUFd5NWEvdGhCUWhY?=
 =?utf-8?B?MmJOQi85TDBIK3Bmak9FdCtxNmRncEpYR0J5MndHWm5ESUcvM3c5UVl6Yk1Z?=
 =?utf-8?B?UnFVcUJKdFRLK2YyN2lHc2FwVHF5WEdPQnlabk1CR2xlSnltUDFXRUpxZ0o3?=
 =?utf-8?B?UnJ0T2VwbjA1MzltdmtCQm4xSUxmc0lIZ3JQTjRoUEFmN3Q5UDNHZG9ZT0NR?=
 =?utf-8?B?UjMwYU96UTVLMEhzM1FlRUdPR293K3g3dDRDUzNHd1NTdzRWT1pIMEIvK0Nk?=
 =?utf-8?B?elBDSjN6RzdlTWZkWGNQZE03MGVNYmNuemZQcWNFWWptZXk5Q3ZBMU5jeU5M?=
 =?utf-8?B?RS9XbEt4TlFnNDBZdUU0dTRpRVZnRnJVOGh6NjY1cmVWczZwdVpWVmtMb3hz?=
 =?utf-8?B?TmJqL0lMZUkvNWpTcWgweXdocXViT3lIRDZueWNoZ2EyRzRwWHNwcEVFOEdi?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TzaATgD+LwEAx9SqxlBhrATYl/F8+dkjLOuJcyUEXKs84LvdUpvqIb47CkDpxST5fnn9vDDaGePLNa79UTDFuxUIKX/cudYicQ31PCCJtoNEuqzhkVvGy7mXCLqJuhNaMsLQc64JLzHgyS/RnlJDf0lP/I7MFyyPFVmq1KiG9wyLN//yUuWAPCdl+NboDBms+iQwi/qbDp4LJ4wueow0EM7WxwQ9mTJHNggRwtVdlopaTbWjKUgpfEOXUfPLIIL5YIV5KYqYkfovFSvLJWRsewKhmyKs5dx5eAaV0wMtKVOUKBhk947nuWisU8lFPsM2DYachrK1QKE2f3Bnt/5qek80NTO05mkIx/SigvGG+xckZBDpQcyLnY3hWUaPDfuDE5qHudLL0BBpsYv5Ri64vvyBqmmZP2MwzimEKAmQHqOVWiKuauM3ZadI71wiFOZNMQ4LDuxSnQi5JGPveKcq6Doj45Nifle2JfXTrGr8HFqghCEYhjsWzU4pR4TG4ycB6R8N/f78g+c5AWoUAi+zz7jHbH2UZrCA0P/+ty3n/3xXZqzX6F87uaPZYgnwFsV62ilQcu+l6CVXifpWIN2GC5Hub4nd5iN0ETGfG5o5cwDmEpHKgdpglDl4EKbm+avJeH/KSSaEU+GhZUWF7sXkO2w4tjpTNoNHOY0afX0zbmzxkwLsAAIxjS5YS9lInWNjbinWuQ4tkJPuvzDfKuunTqmHa88PuFtYHUDqtiYo2xu7UfyMsyYCBV/gwUseT1DRzPPwseyubSUrMp+IRSQzQx4X1ymT48qWX0RXZVts5T8EdTaR5bo2yfKIPh1ChQ04/mNkthWm4WPJp/W1OlKBqg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3e497b-fde7-482e-ee7f-08db18b80be6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:44:55.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTyO2RelGqy5wPybUXLJZu84BO2idijxPagbQGTTT0yqtT0NjfQiT5SXbNnyzY4WgJM38LB9FS5xRHI+eCSFQFAJDGwqRe2HSSFa2Yf+Q3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6434

On 27/02/2023 11:41 am, Jan Beulich wrote:
> On 27.02.2023 12:35, Andrew Cooper wrote:
>> struct nestedvm uses mostly plain integer types, except for virt_ext_t which
>> is a union wrapping two bitfield names.
>>
>> However, it turns out that this is a write-only variable.  Delete it, allowing
>> us to drop the include of vmcb.h
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> v2:
>>  * Delete the variable entirely.
>>
>> This probably means that nested lbr/vmloadsave is broken, but that wouldn't be
>> a surprise at all.
> Well, yes, short of figuring out what's missing this is probably the least
> bad option:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I'm pretty certain a working version of nested virt won't need this
cached information like this at all.  I'm pretty sure it's buggy not to
be referencing the appropriate one of the 3 relevant VMCBs.

~Andrew

