Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8224C8D98
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281531.479901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Ph-0006Gg-J7; Tue, 01 Mar 2022 14:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281531.479901; Tue, 01 Mar 2022 14:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Ph-0006Ek-Es; Tue, 01 Mar 2022 14:23:41 +0000
Received: by outflank-mailman (input) for mailman id 281531;
 Tue, 01 Mar 2022 14:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3Pf-0006Ee-6j
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:23:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e397192-996b-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:23:37 +0100 (CET)
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
X-Inumbo-ID: 2e397192-996b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646144617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4ObiUhpeQyuA1VDFdAzZ7biM4EWMeMxqTrJB4a4yTsA=;
  b=YJdzb6p8BuGKCIZibEhakwoJG9C/K/6jxM1Zai+iVXfa3oK5jn32i9cG
   CVQCMReDjICf5RobttQi9MGKb5EFIWPwiE9/qAnojp3C+lxjAMZjH1bCA
   97EbSbBjq0e1arIa+ICo75ygTPUBqBDr3L2uYhEGrSKt0ywbl+4EKzYWo
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65629216
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bmHkfq+YLqfsyhZhVSpoDrUDnX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 moYCmrTPviJZWCge48naY6x908Cup/QzdcxG1Rt+S88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncysVyNqGbLroec6XjN3CHxmEaQF6IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZdHM2s1NUqojxtnEHxQAZgVs9iRuyO4djRhr3CkvqMu/D2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcVq9B+piY3LxD+aIWUuYSUccPAv998PEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LGhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bphcJmS3P
 BaK4FI5CHpv0J2CN/Qfj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtZCfQhXdiFgXfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iNxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:+vD6lqP9ksTr2sBcTuijsMiBIKoaSvp037B87TEIdfUzSL39qy
 nOpoV/6feX4Ax6ZJhEo7290ca7LU80maQb3WBzB8bBYOCFgguVxdpZnPLfKlTbckWUygc678
 ldmsNFeb7N5DZB7PoTT2ODYq0dKHXsytHOuQ9+pU0dKz1XVw==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65629216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNJhvVO02XFWh/WZepET+ULDebW+yJ23PkpJjXl0ib7t/9NgZbIrGDs5ulDdWAQy2ltFEoamPF3lRB9CdRi22bqKCuwms45vUeiSmk2FLKO9aUKQxifWaplI0RSgseEE+qEH0V2pKXUBxwHyKUztSlfJiHaWeV9dOXOTWmd1sWcLOEUFpvf6alvQ3ET6x2D2YFgsNtY0/IHdqMDe0r1gylqElSM5R8/0zadWilUz6Wo4/tF/Ja0tOdN/7h6cy9uKyESDrcR+92/1WIYDL4lLocwihtKVaFs0O5ASOoKUQjQd+zjLT34scmhgWAVrHmR1jJhvMQVPgTD2RCQBIyWG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ObiUhpeQyuA1VDFdAzZ7biM4EWMeMxqTrJB4a4yTsA=;
 b=GfHzAxsrgnyzMoTD1DHGmgptAq5PTVbQnpWfJ7rzLlcgaP/rmhDsfqxVhwZX19ULjKzqaoSsX1XIkGA91Umape0ot0UqDCXNZ/gMtsufCsW5EwtG5Pcc0VCwSPfzlwqyfHni6gJria939q0xdzzhmRzr2st1wz0IG5z0TADoLpvmA2nqyKwQKWSmGwZ9pyaH27h+GHgnmtTrtYCvD63vsh/V6wzn8gHDyUVbEFov1llKeNRBQ/ESBG0GQO39VL2MW1wTThLQOUWi67WDGcF2o6Kt/8+RPbTnlgSb9hCbcbHiN2orFrdhdas62dYe02TWM1oeh5egEf3HGvzoBMG5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ObiUhpeQyuA1VDFdAzZ7biM4EWMeMxqTrJB4a4yTsA=;
 b=Cr68EAANKizvDbmk4hCFJV3mvyyK9A+GoW7Cndzc4lA7iEu2tapy/OH+JSKqLMZi+qUhSMWRHScJBXiLtjahKZlwTc2vX0cjn1xBxqmb8yVwUE2L6xKHIvcSsGx5dGNKJQ6sFHaQx6GRwKE4QcPJm0nB/eqD2PlOy6dNftm84Rk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/altcall: silence undue warning
Thread-Topic: [PATCH] x86/altcall: silence undue warning
Thread-Index: AQHYLWCYr1nVwle0TEu9TqkN6fmfJ6yqeogAgAAMyICAAA3FAA==
Date: Tue, 1 Mar 2022 14:23:28 +0000
Message-ID: <6f005e15-eb81-c41c-7296-4929e85eae21@citrix.com>
References: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
 <40306bc7-f61c-d330-0ec7-d986e4711d88@citrix.com>
 <06452eab-653b-458a-048b-cc709151353a@suse.com>
In-Reply-To: <06452eab-653b-458a-048b-cc709151353a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1597012d-3964-4b9f-f7c0-08d9fb8f0e0b
x-ms-traffictypediagnostic: BN7PR03MB3745:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3745319C6B9E782C709C0BC1BA029@BN7PR03MB3745.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLLCweoKb5T3scyQSJgs2nAphbhXfnqqIfc5ryxmG8i5aWQZ60H9bGjzI68VJHQAwTXtX6Fcb2l/PrxDnDviinXICAxXJHNmVIHQe7FM+Jzmw2jEnP53IJfiNeT+GG8ePeuXqokDJuF5J+/r6aiMy2VCdfSDzwVzIRgOnisJ9SzGwIXDlVLIY4n27eJGfMQhyZQDeCHB7EYAjubhx2CdzfkjznKXRlaKumeqermF//vnvI+ss9JYJb26F3CbZdaizq1DTnVXQ2vhStXG5/dDMs/cfTzyYGCojL8hovveORV9ZrGK94Ajiuvf2foISVVSPmJ4w9TwNJ3nHS/CFr8dRXcwdwOeH1CPabPJigboRavgRjmoNlINEABUcgqXFWtwdpJaQFRSq4+c0eDJpiaPJOPJ2bx/8bZBhydfn1XYXfVJY0CUdbrzNaesApwCFVeS2/KrD5/qxq9+9ujtFNAgtZL9mqgwdCpzkHy6eTKkVBZtPGXBbeKNOOplTPz0o/N6qXSpWqeImVBhbQzbeOlJJ1SbyaWDUQWiJW+TZXyRIc5Ba2Wb2C+mQHc7TzsrJ7ImkLzyDnL4rTthZiP1xk8xKmQKXO1HbFw1K/Cp9cPeRfz4aTrUHXZJY2UDXZ6SwQIAsxwbQY36zUYh8O/sonWKhJUREhhGx63V1onJSHIzvsmjQoHxJeRV/1NIwkQ9ImNQtsfyB47eFiWW8x71uneUCsiGbMGtOOUiHmKwXYitB3GKwJDqmADptUimQcCpnWx+HVv1XQRd4SBbZvGTKD5JHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6486002)(508600001)(8676002)(5660300002)(36756003)(53546011)(6506007)(54906003)(6916009)(316002)(82960400001)(91956017)(122000001)(8936002)(64756008)(66446008)(66476007)(4326008)(76116006)(66556008)(38100700002)(66946007)(6512007)(186003)(38070700005)(31686004)(86362001)(31696002)(2906002)(2616005)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVp6anNpK1ZoRVZFQXNtZWNZZVFqa2hlS2g5SVdSQ3FqQTR2Y2NSYUhueC9V?=
 =?utf-8?B?ci83Mit4VGZxMnJxeGVpcDNwaEhBU2xZczVzRmlhS0o0UmIwcUcydC9uV203?=
 =?utf-8?B?bUhmeXphZnBybC9KOUJsclY4Z1plWjdaUm5QN2lMdmZXcTN2a2ZVWlJyYUsx?=
 =?utf-8?B?bHhGS29hLzgxTGlZSUY1TzVjN1ZLUWJkOXFGS0xxQ2dUajIydjgxWUZRcStn?=
 =?utf-8?B?NHMvSnJnOGtmRXFUTDI1dmppTkI2UlF0U2cremZMVHI0dDdBZysxWFFpMHpR?=
 =?utf-8?B?dnBlT2JCRUswOFF5VGdvS2F5SHZwNnhtYWhNMnFyLzNDYjdpRlh1blVFMERD?=
 =?utf-8?B?VlZCUzhUUjA4NnF1M1pMQThOZmxUZ0VtaGhQQlhGbkdrelc3Sk5NOFBnckdX?=
 =?utf-8?B?ajJvdjVXUDdaTk8yandCd3docW1OS2dXM3JTV3pYYk45UzVzRXh2bmNYR2Q2?=
 =?utf-8?B?ZnBIYmV2MGkzYzJKUFR0ZXdYOWFSZlBSc3lhRGZHNFNwZlQvOVR4ellSSHRy?=
 =?utf-8?B?N1NieTI0K3dpVXFYRUdpYWlENXlxQmFSN2U5Q1JaZ21LaytWL3hRV0FPWitj?=
 =?utf-8?B?UE1VUzBVZytKNEVneXpScTI0Q0VwTGxFMFRacSthUjJuRzNLb21hN0tSVjlm?=
 =?utf-8?B?RUZDVmxrTXI1NENvZXc1cnFITkt3cGFQOVlvODhlWHhSL2pjaGdwaitZM1Rh?=
 =?utf-8?B?MXkybi9jbmNyUWkwQXZzS016cDBNYlVPNW9ZQVdUdjN4VURzbDM5MDFFZ29F?=
 =?utf-8?B?ajZIeDZpY1BJTGpMNjNrOWJmMDFzVlVCdjBkTjRrazQ1ay9YQVdQbkE5UTk2?=
 =?utf-8?B?d2w2cms5S21LenYxZFI0ZERQSllGUUJlR0xKZVdUQlBpTUtiT290MW9YNUZj?=
 =?utf-8?B?c1ZEYVJTVEY0VkFaakJUODV4eFBVMDVmbGtvY0FRejZ6eDluRXUzNmYrWGVv?=
 =?utf-8?B?R3BwSGJmNXVXTGRwdTRHWUkzZkJzK1NDeTZkZUpRRnllOGwrUTN3d29mRVFZ?=
 =?utf-8?B?aEt6OU9GR0RxMWRtaSs0bVJxSExoRkdPNnp0dlZxU2RNcGo5TFoyd1dycU5q?=
 =?utf-8?B?MlhYZmplVWhkYk81YXFidnVzcWRSWmJpMW1KRDZob3pNbnNOYVM3Y1J2NHlY?=
 =?utf-8?B?czZ1NDloWmJFbXdjbmltMElqVGZ1Umh6QklKcnhrVm5vaG50YVpXcFNqVlRn?=
 =?utf-8?B?S3h3b2pSWWw5ZCs5NEhubkVNQ2grdVpOaU9zeVlwTnhJNmt5dDArU1l0SlZM?=
 =?utf-8?B?TVBQbXRSUUgwOGlJZURSQjJNNTlNVVE0Qy9XVGszb3BBcytxR2ZzaTkzMGJl?=
 =?utf-8?B?MDhJRjF2K3FnMHFnUmJJdjZJcUMwMFhyMW1VaW9vL3o0MnpIYkhEL1JvLzcr?=
 =?utf-8?B?aUtsbWkvM3FyeWx1NjNnQXFUMzJ2YzVMeExaM09FeVVmL0RCaFRYVmVZSHk0?=
 =?utf-8?B?dnR2KzROeWtxajNiMkZXQ2RRMHM4d3hTeWoxMkRadUJEOXUxSXRSTmdzamUw?=
 =?utf-8?B?K0dCZDIwUnpaTEZxUDRNay9lM2FCSnlZT0VsVTNPYko1UzR6WWlaS01xUU9J?=
 =?utf-8?B?L0d2WTdsVXZES2U1ZTRXSUIxeDBMSFlLaUVuNmgwVFB3bHZGbTBpYk5ieGZN?=
 =?utf-8?B?eDl1MWtXV0R3RmVqbk9OSkRpOEpwUnI5Tk12MXZtSmlTYjJxQnpib3gzdXE0?=
 =?utf-8?B?bGJQL3pQVnN3NTRjOHcxNTlmVGRCV3pkUkF6TGFOdnd3Q0t0dm1WYjFaVFBY?=
 =?utf-8?B?Mkl1blpVRDlEbC95Kys4V0JZOElrVVpPZ3NQMmpaWHU5Ym5lMUNVUmhxU3ow?=
 =?utf-8?B?bHg4WFpOdUhLdWhLRHVRNi84OWJYaU9OOFVwcmF1azJVT3FVL000MkFuTk10?=
 =?utf-8?B?ZGtpMFlhUlZTeXVSYlcrbGxSaEIxQlk3QU5vS1dWWUxWSFFoK1FnT3d1cjZE?=
 =?utf-8?B?SDJEVVpCRUEzZ0pNbVlkNllIdGdLMisxODRPWVBURjFjbHE4V0ZXbFd1VHRK?=
 =?utf-8?B?YlpnaGxZRU1rQVVHQ3BNOVBUOTRPaDR4akpQSW5RTFg5QkxQUVVTU3Zmc2xS?=
 =?utf-8?B?ajF5ZzUyZGhwZUhSUmp4MURkWFNIejlGWDJSTFdVRXFmZ3E5TUx0WUdBZEJV?=
 =?utf-8?B?ck1hODk3TU9zczI4UENWUm1xV0dzWGFISlNtQUVLYzUwTHFUMzhCbHpnZENZ?=
 =?utf-8?B?RDlIUHFBZWM0MmE3T2FjalZJYjVMaGtMYWx1M2dIRWFsbXRNcE8xcStxeUpS?=
 =?utf-8?B?RzZvdUFWMWx2SGs3bjR2anNmam13PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59F963B3DB1ED249ABCCDB5F30F0509D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1597012d-3964-4b9f-f7c0-08d9fb8f0e0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:23:28.3258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3teThOSoQ3SLo2G+EDlb/vazwhL9/cmC4FZWo1yw2+D3XksFMryW7UF/85D9g0ZXMM5D5mPLHJxL59/Anbe/pl6T3VpmUOF9LFtWuYVtUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3745
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxMzozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjAzLjIwMjIg
MTM6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMS8wMy8yMDIyIDExOjM2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBTdWl0YWJsZSBjb21waWxlciBvcHRpb25zIGFyZSBwYXNzZWQg
b25seSB3aGVuIHRoZSBhY3R1YWwgZmVhdHVyZQ0KPj4+IChYRU5fSUJUKSBpcyBlbmFibGVkLCBu
b3Qgd2hlbiBtZXJlbHkgdGhlIGNvbXBpbGVyIGNhcGFiaWxpdHkgd2FzIGZvdW5kDQo+Pj4gdG8g
YmUgYXZhaWxhYmxlLg0KPj4+DQo+Pj4gRml4ZXM6IDEyZTM0MTBlMDcxZSAoIng4Ni9hbHRjYWxs
OiBDaGVjayBhbmQgb3B0aW1pc2UgYWx0Y2FsbCB0YXJnZXRzIikNCj4+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBIbW0geWVzLsKgIFRoaXMgaXMg
ZmFsbG91dCBmcm9tIHNlcGFyYXRpbmcgQ09ORklHX0hBU19DQ19DRVRfSUJUIGFuZA0KPj4gQ09O
RklHX1hFTl9JQlQuDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IFRoYW5rcy4NCj4NCj4+PiAtLS0NCj4+PiBGdXJ0aGVybW9y
ZSwgaXMgIk9wdGltaXNlZCBhd2F5IC4uLiIgcmVhbGx5IGFwcHJvcHJpYXRlIGluIHdoYXQNCj4+
PiAzN2VkNWRhODUxYjggKCJ4ODYvYWx0Y2FsbDogT3B0aW1pc2UgYXdheSBlbmRicjY0IGluc3Ry
dWN0aW9uIHdoZXJlDQo+Pj4gcG9zc2libGUiKSBhZGRlZD8gSWYgdGhpcyByZWFsbHkgd2FzIGFu
IG9wdGltaXphdGlvbiAocmF0aGVyIHRoYW4NCj4+PiBoYXJkZW5pbmcpLCBzaG91bGRuJ3Qgd2Ug
cHVyZ2UgRU5EQlIgYWxzbyB3aGVuICFjcHVfaGFzX3hlbl9pYnQsIGFuZA0KPj4+IHRoZW4gaWRl
YWxseSBhbGwgb2YgdGhlbT8gV2hlcmVhcyBpZiB0aGlzIGlzIG1haW5seSBhYm91dCBoYXJkZW5p
bmcsDQo+Pj4gd291bGRuJ3QgdGhlIG1lc3NhZ2UgYmV0dGVyIHNheSAiUHVyZ2VkIiBvciAiQ2xv
YmJlcmVkIj8NCj4+IEkgZGlkIGhhdmUgYW4gUkZDIGFib3V0IHRoaXMuwqAgVHVybmluZyBFTkRC
UiBpbnRvIE5PUDQgbWF0dGVycywgb24gYQ0KPj4gQ0VULUlCVC1hY3RpdmUgc3lzdGVtLCB0byBy
ZXN0cmljdCB0aGUgYXZhaWxhYmxlIG9wdGlvbnMgYW4gYXR0YWNrZXIgaGFzDQo+PiB3aGVuIHRo
ZXkgaGF2ZSBhbHJlYWR5IG1hbmFnZWQgdG8gaGlqYWNrIGEgZnVuY3Rpb24gcG9pbnRlciAoaS5l
Lg0KPj4gYWxyZWFkeSBnb3QgYSBwYXJ0aWFsIHdyaXRlIGdhZGdldCkuDQo+Pg0KPj4gRnJvbSB0
aGF0IHBvaW50IG9mIHZpZXcsIGl0IGlzIGhhcmRlbmluZy4NCj4gQnV0IHRoZW4geW91IGRvbid0
IHNheSB3aGV0aGVyIHRoZXJlJ3MgYW55IG9wdGltaXphdGlvbiBhc3BlY3QgaGVyZS4NCj4gTXkg
cXVlc3Rpb24gd2FzIHJlYWxseSBhYm91dCB0aGUgd29yZGluZyBvZiB0aGF0IGxvZyBtZXNzYWdl
Lg0KDQpUaGUgb3B0aW1pc2F0aW9uIGFzcGVjdCBpcyBkaXJlY3QgYnJhbmNoIHRhcmdldCArNCwg
YmVjYXVzZSB0aGF0IGlzIHdoYXQNCnNhdmVzIG9uIGRlY29kZSBiYW5kd2lkdGguDQoNCj4NCj4+
IFRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoaXMgbG9naWMgd2FzIHRyeWluZyB0byB1c2UgVUQxIGlu
IHRoZSBzYW1lIHdheSBhcw0KPj4gTGludXggZG9lcywgdG8gaGFyZGVuIG5vbi1DRVQgYnVpbGRz
IHRvbywgYnV0IHRoYXQgZG9lcyBkZXBlbmQgb24gaGF2aW5nDQo+PiBvYmp0b29sIHNvIGFsbCBk
aXJlY3QgYnJhbmNoZXMgY2FuIGhhdmUgdGhlaXIgdGFyZ2V0cyB1cGRhdGVkIHRvIG1pc3MNCj4+
IHRoZSBVRDEgaW5zdHJ1Y3Rpb24uDQo+IEkgdGhpbmsgaXQgd291bGQgYmUgcG9zc2libGUgKGJ1
dCBsaWtlbHkgY3VtYmVyc29tZSkgdG8gYXJyYW5nZSBmb3INCj4gdGhpcyBhbHNvIHdpdGhvdXQg
b2JqdG9vbC4NCg0KSXQncyBvbmx5IHVzZWZ1bCBub24tQ0VUIGhhcmR3YXJlIHRvIGNyb3NzLWNo
ZWNrIHRoYXQgdGhpbmdzIHdvbid0DQpleHBsb2RlIHdoZW4gQ0VUIGlzIGVuYWJsZWQsIGR1ZSB0
byBtaXNwb3NpdGlvbmVkIGJyYW5jaGVzL2V0Yy4NCg0KQW4gYWN0dWFsIGF0dGFja2VyIG9uIG5v
bi1DRVQgaGFyZHdhcmUgd291bGQganVzdCBhZGp1c3QgdGhlIGZ1bmN0aW9uDQpwb2ludGVyICs0
IHRvIHNraXAgdGhlIFVEMS4NCg0KPj4gUC5TLiBJJ2Qgc3RpbGwgbGlrZSB0byBoYXZlICJhd2F5
ICV1IG9mICV1IGVuZGJyNjQncyIuwqAgSXQgb2NjdXJzIHRvIG1lDQo+PiB0aGF0IG5vdyB3ZSBo
YXZlIGNoZWNrLWVuZGJyNjQuc2gsIHdlIGNvdWxkIGB3YyAtbGAgdGhlICRWQUxJRCBmaWxlIGFu
ZA0KPj4gcmUtbGluayB0aGlzIGJhY2sgaW4sIGJ1dCB0aGVuIHdlIGNvdWxkbid0IGNoZWNrIHRo
ZSBmaW5hbCBvYmplY3RzLg0KPiBJIHdhcyB0aGlua2luZyBhYm91dCB0aGlzIHdpc2ggb2YgeW91
cnMgYXMgd2VsbDsgSSBzaW1wbHkgZGlkbid0IGtub3cgaG93DQo+IGltcG9ydGFudCB5b3Ugdmll
dyBpdCB0byBoYXZlIHRoaXMgaW5mb3JtYXRpb24uDQoNClRoZSBtb3N0IHVzZWZ1bCBwaWVjZSBv
ZiBpbmZvcm1hdGlvbiBpcyBob3cgbWFueSBFTkRCUjY0J3MgcmVtYWluLA0KYmVjYXVzZSB0aG9z
ZSBkZW5vdGUgdGhlIGV4dGVudCBvZiB0aGUgYXR0YWNrZXJzIGFiaWxpdHkgdG8gaGlqYWNrDQpm
dW5jdGlvbiBwb2ludGVycyB3aXRob3V0IHN1ZmZlcmluZyAjQ1AuwqAgSWRlYWxseSwgdGhlIG51
bWJlciBwcm9kdWNlZA0KYXQgYm9vdCB3YW50cyBjcm9zcy1jaGVja2luZyB3aXRoIHNjcmlwdCB3
aGljaCBjYW4gdGFrZSB4ZW4tc3ltcywNCmNhbGN1bGF0ZSAkVkFMSUQgLSAkQ0ZfQ0xPQkJFUiBh
bmQgaWRlbnRpZnkgYWxsIHRoZSBleHBlY3RlZA0KcnVudGltZS1hY3RpdmUgdGFyZ2V0cy4NCg0K
QXQgdGhlIG1vbWVudCwgSSBjYW4gZ3Vlc3RpbWF0ZSBiYXNlZCBvbiBrbm93aW5nIGhvdyBtYW55
IHdoZXJlIGRpc2FibGVkDQphdCBib290IHRpbWUsIGFuZCBob3cgbWFueSB3ZXJlIGluIHRoZSBv
cmlnaW5hbCBidWlsZCwgYnV0IEkgZG9uJ3QNCmV4cGVjdCBhbnlvbmUgZWxzZSB0byBrbm93IHRo
YXQgYW4gYWxsLWVuYWJsZWQgYnVpbGQgb2YgWGVuIGlzIH4xNjAwDQpFTkRCUjY0J3MuDQoNCn5B
bmRyZXcNCg==

