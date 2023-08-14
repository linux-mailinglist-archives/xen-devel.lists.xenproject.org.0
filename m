Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CF77BDA6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 18:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583741.914038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVa93-0007u1-V6; Mon, 14 Aug 2023 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583741.914038; Mon, 14 Aug 2023 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVa93-0007rY-SG; Mon, 14 Aug 2023 16:10:17 +0000
Received: by outflank-mailman (input) for mailman id 583741;
 Mon, 14 Aug 2023 16:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tgG=D7=citrix.com=prvs=583eff3b4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVa91-0007rS-R6
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 16:10:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bd61372-3abd-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 18:10:13 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2023 12:10:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7230.namprd03.prod.outlook.com (2603:10b6:806:2e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Mon, 14 Aug
 2023 16:10:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 16:10:08 +0000
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
X-Inumbo-ID: 0bd61372-3abd-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692029413;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yoiOotd2DUkhYSX8dKlclJZ8qgieJZ+JBUUNmKMEblk=;
  b=ZZDcZWreBVE912MYtfy7MJwQzs+1gogM3c8eSAPRFcB7MVE3g2XeLuK5
   Mc2QgSv2yEXAgD3d7gtjNeZJhb91TATsPh7ZrbeHCpb1whW1jaynTfjo4
   MCWC6gP6Qyg6CfDm9X52v5V29tE+75Gx+Juc8uuMHrFiZg6kvv9f8A+FT
   c=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 119465445
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/6QKQaxyWwM0yFgxKh56t+cuxyrEfRIJ4+MujC+fZmUNrF6WrkUBz
 GJMDTqEaP+PN2ugf490OYTl8EME6pPUyddmTlZsriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPKwT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX5A1
 aMxdwpUVwugpOa6+o2+dMlUif12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdNOSuDkqqMCbFu7yUo6NQwtXmSAhvy6jVSzQNd0B
 XUr0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCITcmkLYHZcSRNfuoG85oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:/1jhYaC0DF54OC3lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:dRWoO25uWbjj7/AkmNss60A0Rel6SCTk11TzJ0OCNmNXaIWacArF
X-Talos-MUID: 9a23:Jwlq8gkcP8wqGB/o1RsMdnptEu5V8p+lN3sqlJYBocSfMAdeAgi02WE=
X-IronPort-AV: E=Sophos;i="6.01,173,1684814400"; 
   d="scan'208";a="119465445"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjGgEggIRHqrmmljuHi1fjpzfb4W3IebkQgtHskX7ngHqPCurdggoRaP1wrlaGJ3YuhuFfLTo647t745tw147FfZPTlQbFtqq9h8QqDZUHp2xQRsMplQfXhwS6ljG2lZeasHZXhG8BnfD3+uftJ1+Ak6LEW2ULmUy/2bHdL9goOf5lGDhWCot3EAMatBNMx7fkyZ+a1VTj0SQsIOTRvePm8GM9maPlQpyDuomnROq5ABfq6A2qg0YXoPFrPCK6vM6jPc2BshINA1uj+hoSHleH3vWQaGGXNs4rWRauiwNOzQNYMtZQEO6WIRN26Q7bcd16Qh1F+cO7axGhk2AHcm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoiOotd2DUkhYSX8dKlclJZ8qgieJZ+JBUUNmKMEblk=;
 b=TJDMQ2cpkZqou0TZaM94z86uYNSVMggEgVO0bbm3T7vihaXmF+WTDAx7pDCKm0lq3tRw4WMj+PpOsAWOyNgrZR2PXVtgymjFbX9OWEp4uo4acxLsBh4IJLeE3ReKw0cr0WRXOWDR8JfFijp1Cp0Gd3ICRO/eSOynLVPN5BjIE8PteU1CSqhJ+BwJAh1CIAdAhQwXym6U+oCoclZWH2bqSE0sOUwC+nmH/quR5YSIfnyxVSB81ewVr9CB5S992jMwst3kwxIrxCzlwu/1ObUIOc+UeA6oCUNGMpw7VeP2dMYO9Js9eYtJcFO/r+RaiTH1gx5vE346tgYwuDaVmTIn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoiOotd2DUkhYSX8dKlclJZ8qgieJZ+JBUUNmKMEblk=;
 b=YgfDdn2BEpF6pYbT+/qPVMyh+/x6V13Q9in63p7paAylkwhkzTdbsFDW33tNdQcuOmIXmKZPYlyml9wX7S4PZgfP9nFinHDuDKCPILWii+UCgtH2iZJT8Ql+CME3NivgDij5Vqm9dHQwpCqQXd6RMsITtwZAKOFF77M6Q4PBJpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24e3ffa0-12fc-1cea-c937-76a64c97d236@citrix.com>
Date: Mon, 14 Aug 2023 17:10:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Build errors with fuzz/x86_instruction_emulator harness
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
 <7c99ef09-cde3-e35c-f9f0-00c06b754786@suse.com>
 <13be7a9c-0619-b691-a364-b5aa7a110fb0@citrix.com>
 <fa3faf14-84e8-5fdf-8cf9-a5960a16beab@suse.com>
In-Reply-To: <fa3faf14-84e8-5fdf-8cf9-a5960a16beab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cf225c-5983-44bf-a0c9-08db9ce0ed86
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73oSHR8R4maNJF/EKtsViU/hG7Ll2o9WeMnf42+9k4C3i+KBrRLhmjUagoYRNrUujbsD6fGFY6Sw+TLEAtjI4VqYsZxRzrEl7JbfLHLmAvZgwU/oKJlm8A54Ju/1ZL7kwnu3VRzrM20kJp+jznu6p8PVuuyWdoM1+rQRoOD0rXddNuthm1KbUWxL5in9eF7B5mhUqG/+WCo1/pr5VD/+9LTMb+gSgBmqI6srx8KMd+dUpQo1qXNmhfxKglwDMPzcVnqwb3+oPSc4pux6/dpSWYYylWGO8sNEFofSTz/WP4O18S6mcSd3uv82AgIGTlSyQ8KIA1sZ2IYBd7S+OsxDoZulpvrvreLgLvAFNoMCX0WUnnysNSpQGhxvBLlZ2mHRqWyPXEEQrgKGN3Hklyflvb60cbB/y2siCzl4UDL1IaCNf3I3riK0QbsCBVjx56PhRgqwLVa8SYsMtXKJsIwdRWQlGiC2ddU9y+EhxTAinodxrHBO1z2tK6wNbJsHd3fFT8ruo50b9blQN9lyDX9bg2NeszgEdm1Ia5OPjrevXmYx9r1PG4/vo99IPG71EDN00piOsBKk1MAL15AjBdctB1pEC/v0ER5VUk4JVZzj8AxWblLDxdIyt7GFodv4jD/JcanQA1uIMrzan3uFKXhOIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(396003)(39860400002)(376002)(186006)(1800799006)(451199021)(66476007)(2906002)(4744005)(5660300002)(66946007)(41300700001)(8936002)(4326008)(8676002)(6916009)(478600001)(6666004)(6486002)(2616005)(53546011)(6506007)(107886003)(6512007)(26005)(54906003)(31686004)(316002)(66556008)(38100700002)(36756003)(31696002)(86362001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGJ0RmRtUkcxYWtPZ2djeWNBVnlONzdsdEhCRW5IcWFrSWJRenRQVnZyQmlS?=
 =?utf-8?B?Q0tSN2s1VnpYZ3lVYVBlL0NnVGYyUWJBSWo3aGNHa0cxb1hBeE1kS1ZSejdJ?=
 =?utf-8?B?czgzMElsSk0zcDluSWkzQnU0eFhsSmlTU3FHR3JLME4ybGc2MXpiOTR1ME5K?=
 =?utf-8?B?dk5HdmNhQytWUndqdGd1UWgrenpsNXFYOXEwSzNpZFAvNzVEZFpBL0pTRWda?=
 =?utf-8?B?YlF4QndEY3FEamVRTVZSdGRVZFNEVlFrbHh4VmJDaDlGT3pET3FjeHlJcWs4?=
 =?utf-8?B?ZVBPZmF5NnU0UURkNDM5WEZRZU52aDllNVlVWFd6M3NjSGhQaGtyY1RPeGxV?=
 =?utf-8?B?VHlJV3o1TG5vRXoveVVQcTJ6VWcxTUNnVDFHNXMzYzBCNEZIeEM0U0dzN1U4?=
 =?utf-8?B?UmZRVmpId09UZFBIOVdZUXZhRk8zVDlpd25vOXBFeGxmQngvNGY3MTU5aVQw?=
 =?utf-8?B?RVd1TElheEUyZmRQcTdwNzlBb1dueDRyWExVL2FtdmJhRHFnUEdPTCtycG05?=
 =?utf-8?B?b3Q1M1o2L0NEcnA0dFJYTHYrdkRSNkk2L01DUXJQWmxNUVQxZWhFS3RDdnpy?=
 =?utf-8?B?M2ZwTUN2TEdHSHkzQU4yQTJBaGhzYVkyNkExM3oxTlZmbEY2UVU0U3I3MWhN?=
 =?utf-8?B?WDRaSVJkR0w3UWVUSXZFVW5ZMEE4YmRCZ2xKNmhlTTVMTWladG54T2NnY29D?=
 =?utf-8?B?eDJEMDh3ZStVRTdkZmx1TUhKdHovZ0ZUZHRaWlVYOURqdHFsbjVjWHlaRnhi?=
 =?utf-8?B?bGIrMnZOOEhUSklKNHRkM0RyOFVaNEZlcUNxOHY0bUR5VUFUVEFxQW5TdEx3?=
 =?utf-8?B?WnRzNnJJdWU4YkZ4NjVLSVMrVVpRdTJxY0Q4RDZ1WitQOXpPRjY4U2lneGFL?=
 =?utf-8?B?S2c1a3dtRlp4Qy9DU2JSZmVsRGhlWVp2OC9adG1aNGFjejJBQVpkN1VISUs0?=
 =?utf-8?B?Z282S25qeU9YaTVEWTliUE9rYWJVenRMTkt2RzJ0UERtVnFRaFZyRDBsK1dI?=
 =?utf-8?B?WVQ1VlorN00xWTRWNy9jcXdhZStCaFlGeEpRMnl3OXo0Tlh4dm8rVmJBeHRs?=
 =?utf-8?B?ZGo3aENqcVNtSTlqTkU3dHVjMnloV0V3VVQrUWdiR2tzVWI2NnlrN0gxNlFx?=
 =?utf-8?B?WGhYZHRSNm9UZ1hMMjlpaFduenZQZU1rRk9PMWtuOWVuTExNUFFiaXZYd2pj?=
 =?utf-8?B?VEc0cnNyaTR1WW9IaTB4SGJsbkNQaG1ncVdpUlc3RGFUUi95T2tpTlp5WG5p?=
 =?utf-8?B?d2ExTzdDUTNTRWJwV205d0ozZDI3a3JWaGNRUjIzazd2bk9zTHV6NndSRkx6?=
 =?utf-8?B?NUlvUWhJOWlwSFVUOWUrZEt0cEFVeEsyMTE1V01jRkl0MmZnYWtndGtreGlB?=
 =?utf-8?B?ejdWQ2lvZlJZRkwyN2NmTW9IV2diVDZxSk9MRmpDMmpGYm5hSERRb1pUVlVa?=
 =?utf-8?B?L0lRMzJHT2JlQ1Q2eDA2ZXhDamxxMU9hd0F0OWhYY0V3SmVZa2FSSG5vMnRK?=
 =?utf-8?B?Qkp3NFJRR3NBMncyWUFlanExblEwK2FuRmhQQ2tPNGYrazNGNUQ2L21JVnlU?=
 =?utf-8?B?R0t1Umtjc0hmTExEb1BVblNaYUdlQ0dnU3N2bll3MktXbE1lTXk5QmdmTG02?=
 =?utf-8?B?cXhhM3I1aG1FeDBJUTBSRmJNOHhYZW4rTWFvS3E4Lzk5THFhQU42SG5waXFF?=
 =?utf-8?B?ME9vdE04eHdodVNpa1BTL1FPSnlaVUhqSjlIZy81KzB5eEZDTjkrM2tieEVk?=
 =?utf-8?B?bThlVGdhUUpESmQ4NmNIYXhPOGxrR0Q2dURBaEk1dS9MTU83dzZ1bzhaMVVU?=
 =?utf-8?B?U0UvRGtEUjVxVGREcmFSdFUxZm9ubE92Yk5zODNiZEFYYVpEd2JVSlMzRG5v?=
 =?utf-8?B?VGdHYzJ5b09FYkVxNnBEeUdmU2Y5ZXlyN2JCY1UwRzg4VUlPQjBRVlp1L3d5?=
 =?utf-8?B?d1JPRThzOXhtTmx6VXJPMDZySXZyemdrWFp6ZWNmVXpPcERlSGNYalVBOFU4?=
 =?utf-8?B?L2FwL2kwcW9MbXVQa0RhU3VQaUNOYnlma0pZWkx6dmswUXdTN2NxamJ0THNL?=
 =?utf-8?B?Zkl5Ykphd29sVS9LS0QwVG9iOXdFZ0lRVUJwSXc4T3NxcUk4OE16b2ZTTVpq?=
 =?utf-8?B?RXZHbmRSQmgwNW16Q3pNM3FlQ2VVWHo3c2VpQ09laWlwNCtZellMNUZWWmlU?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mm2ubRoH9bxwPfFAdVpnCZBdY7YVlu+VfbcxvV94o51m+GlSGBzCsjScyRgz0TeLnRoclwCDO+DwbSF4mZtd69rbMJjW8TM+t+n6Q33zdb0f/e13xXcsZZLFmMRvfzZf9wx1hcvkVBEoP5scMh+6fAxoM5NhSnt9RWffy40k48F5rx3eF06Ar09ksgD20MrjV9aLsUACIkeDV7pKYewu1ajJo7//VeR8eIuQbbIxS6yeQu0DqUnMoPZ398PM8zQ5vOBV/ATvdESZVsqs6mWJVVVgvfdFA0P5gWvn4+Zify0BZL0qWY9SfM0ivx7loR458Q0hymPQq3nmh8pBE8QQSbXLVObuoZzCKuCMbhsGAMSIGCAe2JtT05a8tfsAJ1JrtLfJihdOq/CjmEgWjRHtcILC5aT3+Av9Ol8/ZBbt8uyh7QSPce2dCnCcUlZzKk2LbMVlgNUMGveIMRYItcpUvoPzC2oCY/sCJgrhyITCB3K/fivBn1o3ml0AL89WSYsBLBBbQ6ETvARpgg8cos7E8C5HmCyXBfENJ789zpKHpqJ71IeLfp3DQCgyLvGJtXgU8j4WX7f7nVYuuxXZ0Qr/1Xh0/6lpGK0ndzghy6tFgCf5cGCVhOlZmDmVd8uDf16sNhXPtE6mqsNULj4W2V9aJJS9Dz27EaTKKKRaAFP/U1H8Ki3yyVaT+TALefAr0Ql09UqAHSqHGf6O7walnR2vbVWq9LMc8wOsQeCv/llWZrHLHWUkMBb9Z1+JcQYFNIebr6pW+hoYO2BFTpaUhiDTik3ksAFiRl48A4wH35bjmqE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cf225c-5983-44bf-a0c9-08db9ce0ed86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 16:10:07.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPeDZVU+N03y05uqbRNxiqi1KUn2HGT4UuuefYg+QEIDvENt8SY83NkyZOEoqnmoXBR75OdiKUJqk0DwwZk9mMLdfvupymJtafS5PgxPFH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7230

On 14/08/2023 5:04 pm, Jan Beulich wrote:
> On 14.08.2023 17:34, Andrew Cooper wrote:
>> On 14/08/2023 4:21 pm, Jan Beulich wrote:
>>> Question therefore is whether we can find a way of effecting the needed
>>> overrides (including for compiler generated calls) without resorting to
>>> emitting .equ (or alike), and hence without doing it fully behind the
>>> compiler's back.
>> --wrap= each symbol, except when compiling wrappers.c ?
>>
>> This seems to be the normal way to mock out functions including malloc()
>> and friends.
> What is --wrap= ?

-Wl,--wrap=foo

It's a staple of C unit-testing frameworks.

From the LD manual,

--wrap=symbol
    Use a wrapper function for symbol.  Any undefined reference
    to symbol will be resolved to "__wrap_symbol".  Any undefined
    reference to "__real_symbol" will be resolved to symbol.

~Andrew

