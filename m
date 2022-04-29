Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA705514A8B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317321.536601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQjI-0005Rk-Uy; Fri, 29 Apr 2022 13:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317321.536601; Fri, 29 Apr 2022 13:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQjI-0005PP-Rl; Fri, 29 Apr 2022 13:32:16 +0000
Received: by outflank-mailman (input) for mailman id 317321;
 Fri, 29 Apr 2022 13:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4Mb=VH=citrix.com=prvs=111705440=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nkQjH-0005PJ-8K
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:32:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66a7ce0-c7c0-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 15:32:13 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 09:32:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6726.namprd03.prod.outlook.com (2603:10b6:303:17d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 13:32:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 13:32:08 +0000
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
X-Inumbo-ID: c66a7ce0-c7c0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651239133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PQCU5W/XQD8n875J67ZnsOMiXLk2xOSxnSLeiIlvM8c=;
  b=cqVFEFQz1v0EH9sSENb4QGo1se2X0QeORnXZaUyrC4UDnZ5F9aICRlCu
   l82gtWH1yG4FY7tHHk2ts/4yi1oRtb+qeaB/qU9/wXa48pjplUFz7af7N
   MXYuvijWCayZ+nPmOY7jtg+cBkXfUTbkv2IwWN0CQmdqotJCbiNH4xGFN
   g=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 72697748
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mmXQv6OBAx8EUKPvrR2qlsFynXyQoLVcMsEvi/4bfWQNrUoi0DdVn
 WcfCz2EOvqKZzeme4x0Od6+8UMFv5eEz4AwHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZl2N8w2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 vtkk8eMTSoQF6Ts2+4WEAFiKj17BPgTkFPHCSDXXc276WTjKiKp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HtaaHPmiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IC9gPK+vZni4TV5BRJ/J7pbfvWRoK1XsRfoUexr
 Fzg23usV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJ4H/Mg4QuAzoLf6gCFD2JCSDNdAOHKr+czTD0uk
 1OMwdXgAGU2tKXPEC3BsLCJsTm1JC4Za3cYYjMJRhcE5N+lp5wvihXITZBoF6vdYsDJJAwcC
 gui9EAW74j/R+ZQv0ln1TgrWw6Rm6U=
IronPort-HdrOrdr: A9a23:+JDPBaj/CNL4jMOlhxpnTdtdxXBQX4p23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bsYOCUghrTEGgE1/qt/9SAIVyzygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3sZxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJriJGofy+Qzdktvfr2rCo+
 O85SvI+P4Dsk85S1vF5ScFHTOQiArGpUWSkmNwykGT3PARDAhKd/apw7gpMicxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfRsRKEkjQpo+a07bWrHAUEcYZ
 xTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tTKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG6fI3wNg6duP22J6IJzYEUaICbQRFrEmpe4vdIi89vcfHzSr
 K0JI9cBePlIC/nBZtJtjeOL6VvFQ==
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="72697748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMjgqo9j6ct2ng95QjtdKQ26crI4AJNKY9O8iWjIMm76SoK5DZTk4+Yz3MilNY9My6WGOEarukvuXA8xHaIRO5hbaDpjC/AH0Ijwdav4O/KviYsYREkI3KAOzul6QQgCUP7xWFHEzPpMBDIBeBqbEXqm0oASkiFXkjS8JLZhntWZNPC2Xmi6u6SImndw0nu6deIGxCba8lZg5ZJuZh48GIJ0p+3IVRBTc4DQoF4UDpZzJg9HFryxIRQb/nFuPpftStO75xqhKJe4NqIjSybvq2Zo+Rlhe60qXnyMjAqSlglbsSLWnuD/KoYQZFQhg7jXOAx2yCo6yGHmKCfYwIF4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQCU5W/XQD8n875J67ZnsOMiXLk2xOSxnSLeiIlvM8c=;
 b=AY4GUapjOc6+eiUE1meabYSKsPdYNctGDsr1zW2D1NitO6quRxz3jbJRITSvMxUnVzt9Gxmz/lZliqVwn/kx6srUtLlDPLinbUZzht2ph/vM9cYmqMDb4Xm/yGSLxeE8DTcmETRwhPwsa3G3gUgsF5Rs4FdCzJhsQhhpLBALsVEdf0gURQRqJcl+h5l+YHEd/gkhX/aglv6a6fGblu+872AqE8EiCr69KQX94is0T4Rodt8SRIGGVIbUc/t6PJVSINIESlg6mSZaIcw12qEl12CPIjYprdDikyE/2QmWsc9yyJZyCQ/v+V0HgZz3l/0JnDTwu2rNS0yZYZ6jBBXApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQCU5W/XQD8n875J67ZnsOMiXLk2xOSxnSLeiIlvM8c=;
 b=u3MncwH0dhpI1z1lXKqM/aXPyLU1F8C51Xu1Fsu1LUjxVSDH3HF/Tqrf3lnA/w9zmEU4b7Bw0vHusZNdaKD2rJuAdhgbRqdwOdZR1UIq6GQ8ZoLIXQ9AzSRVI/MRk1XTo6hsVT8OfUbdS7EzBO1Xm+Nws3OVvV0mzeWGO5/unyg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, David Vrabel
	<dvrabel@cantab.net>
Subject: Re: [PATCH] x86/mm: slightly relax TLB-flush-local check again
Thread-Topic: [PATCH] x86/mm: slightly relax TLB-flush-local check again
Thread-Index: AQHYW8v8fFOL6ISSr0eHNQGjo+Jqyq0G43KA
Date: Fri, 29 Apr 2022 13:32:08 +0000
Message-ID: <2e0c3b57-5117-e222-587a-b2261101bf58@citrix.com>
References: <ad64e3c6-9f89-c0ea-05a9-cff995ac200f@suse.com>
In-Reply-To: <ad64e3c6-9f89-c0ea-05a9-cff995ac200f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a71c73c-186b-408a-6600-08da29e4a890
x-ms-traffictypediagnostic: CO3PR03MB6726:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <CO3PR03MB6726F4BB4955B716AFD5062EBAFC9@CO3PR03MB6726.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZNfDIwlb5fOwljlwX6fSd1HM56bdeYnIJPlQVHdSS5JgG4rxtgvRAd1va1wNMC8ZiwDZB1RDfHDbxprb2cyVA7qgTsY8Tc2v8U5gst9IRu6fxpRy/bxITrJEkNXZGIILXU3BW00e+TpR5drCrlJvF5b1zHlwhS1yOvrNyu+5UaUNey4QfQ5OHx/Fjn+146Zq8QjpfT/CnGOCKBHAE8nutE/bYDQp/O1+qBY4lydrsRp1JrJ+lqyfFr8MMB772Im20LOMtEczmXTuKaeSAvxfGSzs1VxSQo18ODNNIKW1rPUBUb0r2hP7CirXIf3TjI8YEUo9KGi0fBaZ6EfWmr9LjQoMb7btXKNMqVXRgDZCqOdZp6dMydLcWTS5ZSngln0xLKySuTKNkLjGuFC/OHdVhe99yLEpXaBKWWv6zgcP2Da8SnwOmfEj+NpNnK4Q6F1ii1d8ofBfCkl4ty62XN9S4IukivrfsoEQsgETyMKG8s7x1RDfC5sVvb/LGGUWCz3YLUDk/ZXKGNoJdAlO82jwkgPnoYJ14EXXSf+q25UiPVBiqO8XgG0LlmPRtkNJLiyuyWyvl1IuWFYzwYviNtkRepYScN5vN1QUUzqSROy3LSY30zwBKbu6DXEyKOTNPOQVxdGp5bkDqKmt1cHPXIIJlEWpHmXP4kci+MQ6CR/WOqaEQCPPeHTXy3heFte/SGCyn5fyKUboCQ3ZXlyTAXR697cwxen2v4oBACO69n1GrhAN6AET1CH3muRWZ4p4kbBsMh9X7MTcU2m5g+EBI0wA3A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(66556008)(36756003)(5660300002)(2906002)(76116006)(66946007)(91956017)(66476007)(316002)(4326008)(66446008)(83380400001)(8676002)(64756008)(8936002)(54906003)(31686004)(110136005)(2616005)(31696002)(71200400001)(6486002)(86362001)(508600001)(38070700005)(82960400001)(38100700002)(26005)(122000001)(53546011)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFdEUHR6c21aZzV5VFAxRjFJTlpDenZqaW9WWmU1dGttUDRJdEJpZDFiUmEw?=
 =?utf-8?B?KytldFlJd21zcXZSQVlSUFBLbVRpNlZqejR2ZGt3ODdRcUtlQ1lzUWdoS1pv?=
 =?utf-8?B?MVEwdE9GN2VXTlMzazg1YWJ2TmIwVG1nbnluK2tZdWxtUEdBZEVZWWQ2alMx?=
 =?utf-8?B?ekdnWnd4dy82MkhYUEROTXVaT0xzbFVXaG1wQ2RKWEFacW04a2VVVW8xSGJC?=
 =?utf-8?B?bFJzdzNIUnFxczB3dHcvc2IrcU5xNENGdHhlMW5qb3FVcWt1TG16QkdUZG1H?=
 =?utf-8?B?MWlGOHBzQWlzYkNkREtiaFdJMXlUbzNPcmdRMDE4eVVlejVETzVnd3R5QkhL?=
 =?utf-8?B?eWpDYWdGcVJFQy9lNFJmSjRrb2R1KzFEY1VlR1ViaUFpNTh6ZnFibXNCb2R0?=
 =?utf-8?B?b0dkTkpTdGtTTVZMNkxqeXBVOTJqbHBkRU1FaWV6YUMyUDNRb1M1NTlpV0FT?=
 =?utf-8?B?SU5adlpZWGw4YzkwZ0ZWLzk4YSt4bSs4OHZwYjU2akhjNmJhQVhtdExxL0ht?=
 =?utf-8?B?U092c2RaV0ZpTHg1UkVpQXB5TjhURmRmUk5QSCtmVVp2a0tOdjF1N0E1Nnkw?=
 =?utf-8?B?R2tLMVJDNG1wUDJoaFFjRDVqd2FQWjlBMVVzN3g5SnhZdTNRTG9vQjNZUm9V?=
 =?utf-8?B?c0ZkODJkZW1qeTY3ZHNzS2xxckJra3NzU2JoM3VHdTJJd2Rvd0pkczRLTlY1?=
 =?utf-8?B?T0h1ODV6elVYMmkxcVRyaWdOa3c0M1JLK0RFRmM5Y1hqRng2c2hSVHJlV2Vp?=
 =?utf-8?B?SndSOGI4cUw0N0hudGg4b1psUE5Ebkg4S3U3K2xNZUdCZStsWmxscVdiTHZ4?=
 =?utf-8?B?R1lGQ0Z2M0hIbUlJVEN4bU9hZllDZGtxU0o0MFpNWlJyVElHL215eW51KzJB?=
 =?utf-8?B?V1JNdjVuODNZSVEySGFsS2wxWU9xeXlIOGI1eSs1R1NydXUrMGRIOXJpdmtP?=
 =?utf-8?B?ZDNmdU0yZEJDdllyT1E2WEp3bndHdGVzQTYxdkErNm1ReEk2ZFQvYWdKZ21n?=
 =?utf-8?B?R2s5bXVpVGxOYUpuRjU5Q0J5bGNTcGFWRWFhSk1kaDArNHpZYUQvM1RTUVpm?=
 =?utf-8?B?ckNTaDVSc0xTUVFGUVpTZjJzcGx0ODV3T2UrNHZjNnBxZXYwb0R4bUJZdDdT?=
 =?utf-8?B?elE0aGVRNk5oMDJyc2VIQ2hzVkFhYUp5UTRWQ3daVnpkL20wL1ozMis1dFlP?=
 =?utf-8?B?TnMvWG5SSjFoU1Z3bGdITkE5a0RSbzRBYjkySkw1dUEwSVJWb29VaGF2RGth?=
 =?utf-8?B?d1dzcjVsZU5FWGNNVDk3NG5vV0h4SytaNFFTNVloZGtLazdxVFJwUytjSXU3?=
 =?utf-8?B?aEFUMkFVNEhlVVNXcHB2Q1Z2QlVCSTBtMHNtVG1ib2duZG5GTk9uV25UMTRx?=
 =?utf-8?B?TGJ1U1dIT2M1U21SMVhNTmw3Sm5GbkpvVmgrNzdiSUdHb0ZIRmpCSTJmL3lF?=
 =?utf-8?B?OTJSdmRlb3JJcGZiemhuR3VvNUt3bG5BWENTU3kwZzMyeFlreXA5NGpXTGFT?=
 =?utf-8?B?dVE4S2xYeVJ6bTVHSk9mS2pXQWNhUXdRUjIyN2oxUXFvMzdMUHBKdjQwenFi?=
 =?utf-8?B?V1gxR3FWeW1oQnVib2NaVG5YN1MzZzFnYjFHR2hXd2htTk1lRnNONXRSUkpk?=
 =?utf-8?B?U2ZFQ1FJSDlRZlF1U2lzdU0raVhob1Vaall2cTY0SHJ1VGIyNWtUMDdoU29T?=
 =?utf-8?B?ZkFteDlJTUZQbUNKZVJNZnhJdkZwNTQxa09RS0FkUFMwQ1o2TXFhSURYQ2ly?=
 =?utf-8?B?MWludjl2L0N1WHg0SzFDTTFDWElrd3pDT2lSUm9MT2pTYXZKdUdKYmlYMVNL?=
 =?utf-8?B?cDJ6SUdmWWFhSWZXVFRqRi9hcEhPT0EwSjlCOElHWGw5eHVkYVhDOXRmQXJE?=
 =?utf-8?B?UWZHbWI1ZXM4RTRkblUwbzcycmQxYWVtTWttMVplWWVtcGZnOU1RM3RKT2Vz?=
 =?utf-8?B?aGp2WXRBZFdPRENQT1ZyV1lLdDRlSmlIVTIzczBrbHdxcU9ydHJ5QWtSVjVy?=
 =?utf-8?B?V2xUbXc2eUplVlNGbndWWG5ic0VTaGhjSXZxdi95akdQZ28wRzBZRUJzczZ2?=
 =?utf-8?B?Z0swaHlhQXF5eHgrb05neDBuK1crbzVUbkpKejllOG5RZEllR3ZjRnJ4d3JQ?=
 =?utf-8?B?dURFdk43ZW9ydDBIV3c1Vkt1QTdZTUt4d2pVM0plbFFtK3RKVEcrMDNWN2pZ?=
 =?utf-8?B?Y1BuV0t4cFlHbS9HN1RNTWdGNUtna1dLZ25yeC9UV0UyTklVNElucTR1YUhZ?=
 =?utf-8?B?UWpuYStMUis4NDIyZ2xHOEJmaExRMjlKSHIrNHNkUFZDU3ZuYWpNcGJueGhU?=
 =?utf-8?B?dVlpVDkveXcvdGcwQklKWDloZGdWTGtkZkJ5dEtLaFZEdHVmbzRqWVI3V1My?=
 =?utf-8?Q?PWUthlhz6YDi3acM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D62D6A42CA45824788E5466E75D4FFB5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a71c73c-186b-408a-6600-08da29e4a890
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 13:32:08.3351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsW1TtSzAOMo1VXlH88avSqtrWP7wUJT+tML75jF71POzJxj7OoAtmjWztFsfixfoz52IwM3aN2SJxep2gfLm56tLQ5JiTzLa9hwhkCpDYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6726

T24gMjkvMDQvMjAyMiAxNDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IHN5c3RlbV9zdGF0ZSBj
aGFuZ2VzIHRvIFNZU19TVEFURV9zbXBfYm9vdCBiZWZvcmUgYWx0ZXJuYXRpdmVfYnJhbmNoZXMo
KQ0KPiBpcyBpbnZva2VkLCB5ZXQgdGhhdCBmdW5jdGlvbiwgd2l0aCBDRVQtU1MgZW5hYmxlZCwg
bmVlZHMgdG8gaW52b2tlDQo+IG1vZGlmeV94ZW5fbWFwcGluZ3MoKS4gQ29udmVydCB0byBjaGVj
ayBmb3IgdGhlIG51bWJlciBvZiBvbmxpbmUgQ1BVcywNCj4ganVzdCBsaWtlIHdhcyBkb25lIGFs
c28gaW4gODhhMDM3ZTJjZmUxIC8gZmE2ZGMwODc5ZmZkICgicGFnZV9hbGxvYzoNCj4gYXNzZXJ0
IElSUXMgYXJlIGVuYWJsZWQgaW4gaGVhcCBhbGxvYy9mcmVlIiwgYm90aCBpbnN0YW5jZSBvZiB3
aGljaA0KPiBuZWVkZWQgcmV2ZXJ0aW5nIGZvciBvdGhlciByZWFzb25zKS4NCj4NCj4gRml4ZXM6
IDc4ZTA3MmJjMzc1MCAoIng4Ni9tbTogYXZvaWQgaW5hZHZlcnRlbnRseSBkZWdyYWRpbmcgYSBU
TEIgZmx1c2ggdG8gbG9jYWwgb25seSIpDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBPbmx5IGJ1aWxkLXRlc3RlZCwgYXMgSSBkb24n
dCBoYXZlIHN1aXRhYmxlIGhhcmR3YXJlIGF0IGhhbmQuDQoNCkknbGwgZ2l2ZSBpdCBhIHRlc3Qg
aW4ganVzdCBhIG1vbWVudCwgYW5kIHdoaWxlIHNlbWFudGljYWxseSBJIHRoaW5rDQppdCdzIHBy
b2JhYmx5IHJpZ2h0LCBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gZXhwcmVzcyB0aGUgbG9naWMg
bGlrZSB0aGlzLg0KDQpudW1fb25saW5lX2NwdXMoKSBpcyBjcHVtYXNrX3dlaWdodCgmY3B1X29u
bGluZV9tYXApIGJlaGluZCB0aGUgc2NlbmVzDQp3aGljaCBpcyBvYm5veGlvdXNseSBleHBlbnNp
dmUgZm9yIHdoYXQgd2Ugd2FudC4NCg0KRm9yIGNhc2VzIHdoZXJlIHdlIGNhcmUganVzdCBhYm91
dCBVUCB2cyBTTVAtbmVzcywgY2FuJ3Qgd2UganVzdCBoYXZlIGFuDQpib29sIHdoaWNoIGlzIHJl
LWV2YWx1YXRlZCBlYWNoIHRpbWUgd2UgdGFrZSBhIENQVSBvbmxpbmUvb2ZmbGluZT/CoCBUaGF0
DQpzaG91bGQgYmUgZmFyIGxvd2VyIG92ZXJoZWFkLg0KDQp+QW5kcmV3DQo=

