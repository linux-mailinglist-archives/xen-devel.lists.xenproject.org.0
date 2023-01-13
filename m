Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A066931F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476974.739456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGa2-0003gF-W3; Fri, 13 Jan 2023 09:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476974.739456; Fri, 13 Jan 2023 09:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGa2-0003d2-Sj; Fri, 13 Jan 2023 09:42:34 +0000
Received: by outflank-mailman (input) for mailman id 476974;
 Fri, 13 Jan 2023 09:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGa1-0003cr-Sc
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:42:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c56c86-9326-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:42:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7272.eurprd04.prod.outlook.com (2603:10a6:10:1ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 09:42:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:42:28 +0000
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
X-Inumbo-ID: 99c56c86-9326-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds3NeXKz9VXUsFz17yg0jYGOkPVskcl59FynZkvcZ/fQVTISzOd9weUUMCRJoq6TT7AqCubz2GvhEcEPbCIpZVFxjAQCdjMd7auuLgHEZ6PGqBzOA8fid6rZ4RKMAiULSQMuOHbxOl8zhTTOMTWdSJ9sMe7kSUTZzxReGhv18ExCkCXjzl45PKiDQHMGcajVcyypuwEokqFvVO+3Xe8r9XDHl48ntfFT+N0D5uPpck/HpwAjQLyGH1KAS+qhEh4XG2K7n5m+sUjLAczZHniX6bPFWUUs/sMX7zdobutfyz3kYDQgWDwx3vUhPyEYliB9HxBaulB3dNia8I6FUYjazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8PbSMIbGKpH21HZ7bfJ+tO2egH7QQ3j4iBGi/uT6tA=;
 b=Hhz1rXZu9gMkL6NAfYskxS8LfCUslshOme8dIAN05NKqP7sxye7r3poTHl8Ubdnq0SEdnxVuSG9tNl78vhUZ3E0qbhZ7d16QNCXPMj5A6ReTkZz1ZmXeCmeHiPKTjUNbOE5HyZIb1fPwSTzXRdICbCFKEjHTrlHp2cWIilkH8wV9ELwPN+vO9DNYhp2+5sNRSldZi+vhKORZHWtsF1ArjTdwMDJIYR7QUYZYt7wk12GttxZznaifuQoalwFgxefasQNuV9sEc0U3Cq8aRwIA4PMyNrAAnAR+7zCqNgHZYjFKoNmPQHVy70TiJiKQ3upKBa+V7UClLvbgYcF1LgMPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8PbSMIbGKpH21HZ7bfJ+tO2egH7QQ3j4iBGi/uT6tA=;
 b=x/JKzk3klIY40TPK27HEaxfLiu8OLw7hyMMf/BPe9WNgk0r6xS42z+v9SblUGdbPMToPCE50qG3Zo2iZdB8tL9bLzZdDl5A3vZP+wJZckSS1FItBk7kGnYdDd52D0NrxAajCN3p2Axaokm8kvRueldP3yeKBLPM9BeNqOMvu1amGA3PI3W7Lg5FedGuyHWobOTroojoqQkivyxO4BHc4zCU6DEs9nT9cAnmFkqZVcEpGLC0wBBEOFC7BpsHohoi+6AIbekQRatQDDhATF/LAYCDwlkMXgsZxE+ej9EBnpg327VAOmW/3VsxuDhtUFofBozVvUwb+oCsZ7x0bknf/Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0eaad42-70ab-e27f-53eb-382bc15ae095@suse.com>
Date: Fri, 13 Jan 2023 10:42:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 31/40] xen/mpu: disable FIXMAP in MPU system
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-32-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113052914.3845596-32-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: b100b8f3-aa81-481b-5ee9-08daf54a7c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsD0qNZIVB6rMLtcWYlsQbwx3wTqMOjPQKEWJqCSCad25t4YaGMMR/Io7kohbFuYMJ21OT16gX38HDKO8PJkpxGT4hEEUG5LBJCF9TSEzF4LPQGcCj3wvHZGdfe5AMq8Y0wHPJYGdd6CzSgyPWG6RyOXa8XCBNyVDA7BDW+Med4413bDWsUH+/gBiQvHqhftxiJhVtbxGFRwOW04ws1UaKiVZ0jaBEW8mN5/yPl6rvYvlUoFaxvPObB/OstsO88CxTdIjHGFsckHVU4+mTLe/E60unN6vCem8ER/vDbXtPIDVGFch8onrphqM2o98OKR2wbPHeRE9JXGoNbLgml5+zC1G5FwNgLX04W8WSJZ+9sVHCyMHlSdhOcyZWQglJwE1poWQ3KvhdFMofmt3Wm0hcdmvzPRVqe3dfxivnnvUeuX008HoZ3PhdlwUEXbLxxnINT+pf1ytIgPeKn2ONM+upsGO2uyLLG16ACBKoYJE5BxiiI8HKGOpFcwQdKdobN+/aZjRmKUMVWZacTt7E6kIKQ1FlU1EhvpDy0u+4FW3NoAGAiGrVpbN4tuVb9x3UNvsUyP/8nbgPvEBRSwup/M1LMsPMUw0TxEg2ASHkb6qg0V8w9PcJ5bX7FGwHmPrF/F9ereGaENvHXYhm838A+L0CW6y8+HYpEEVQPtwMsxL5LW9FqYZ/2MceIwRFiOQkf35lxe9ERQmvPXeaHXsjPc36Gk7bUU3utkqySEYZqPBw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(31686004)(66556008)(4744005)(2906002)(7416002)(5660300002)(36756003)(66476007)(2616005)(8676002)(316002)(4326008)(54906003)(53546011)(41300700001)(6486002)(478600001)(8936002)(6506007)(26005)(6512007)(186003)(6916009)(31696002)(66946007)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFhVGRBbkw0UkRDdHN4SFlQSytwbG9Cam9EQ2NnYmkyNDU3UmxRZUtBSXNi?=
 =?utf-8?B?WC9NbHBLSWZpMmVjZkk2MXJNQlpCOWtNYWs5ZEcwZWY2dy9zMC9XZWt3MWhB?=
 =?utf-8?B?U2JhM2p4ZGxKeHpubFRzRFJBeklMTzkrUG84U3Q4TzZKeGdSK0loUFJ0cWRV?=
 =?utf-8?B?ZkVZR2hzZFR5WHhiK2RScWlXWjBiTVVyb2FaWndXN1JCUDd3RE96RWZ1OEhR?=
 =?utf-8?B?M29zRW56TW5nYkFCazFScy9rTWNMQ1VpQWRRYlZzL0x6RjlHSUlkVXRUV3Jv?=
 =?utf-8?B?cW0xQ3BtVGJYSFpvSndQZU5ZQjdLZGxTcGFpbjZFdEUvMG9kTFNJMDNuOEow?=
 =?utf-8?B?NnMzTlIzTm5JUmJVY3lnVnFMYllQRFZQOTkvZTJtVFlrVkt1d0ppUHlqYzdV?=
 =?utf-8?B?cTEwQ1hlUmlSYThXRk53WmVwb0haUTNqYm8vRFhmYVdKemxDRXk0MG96MGdl?=
 =?utf-8?B?eUhPVHBEM0QxOU9pSFl0d0FtQkg3M2t1bndHTGtjNzN6Y2hXMnluejRyRmJm?=
 =?utf-8?B?Mzk3VlROTE9ZS0pvcEF3bG52QTljMFVvNjVqNFdnSkRCNkwwZzc5U0pCMk9n?=
 =?utf-8?B?SGxvS09OU2xDSE5sY25nRlMzdDAwZVBTSEtCRlB2dEd3TEk1eXc4c0swWlNE?=
 =?utf-8?B?dXJiM0lEU21TSUFKT3VuUWRpWFViaHFzNVoydzBUY3g2bkYva2JnODA1Q0hx?=
 =?utf-8?B?dzFoWXRhdVFmSkRNbUhXL25lWGJpNWJ1V2RVSkFnK2Qyb1QzYXdvNHBUaXk1?=
 =?utf-8?B?Nnp5WGhINmF2b2VSSk5JNGIxWUlDcVBBZGErUXIrR0RoUG15V0U2SkxBV0xD?=
 =?utf-8?B?SFhlUm9MUWhCYldOTmlzT1dhMzI4TnV0c2tlR1Zhb1MrTXU5V21mK0lJVGxT?=
 =?utf-8?B?UmJuZERvUnV3SERLZGJ1S2JrbUpJcU1xcHVNUExUT3hiMFhWSkpDbk9XcVVi?=
 =?utf-8?B?QjRPc3gzVmtuVWUxTURpWU96NGtld1k4eDI4Wm9tS21qMTd3b3FzcGlIcGxC?=
 =?utf-8?B?YXRBVnAyclZiN0NxbURDcnBvYVdxNE9HU1dHYnphZGQxbjZkUTRUM0xXdHB2?=
 =?utf-8?B?dEtVa2g4dEJxeXVKMmRreEt1Q295ZEtJMWxyMmdvOHROcVVJSXNwTlk2TWpa?=
 =?utf-8?B?NDFHMEVNZHRzdVBNNjIrZ3QvTmovMzlEaWZEZjFVUmlmRGF2UDlnb1ZFRmEv?=
 =?utf-8?B?YURTQnpaMk1Sd0QxanJMOTBnRVAvZ0lqbWRFbGFHWjBLOGhTa2ovYVN3NTdE?=
 =?utf-8?B?Znlvc0tham5mOTNWaWRSRXNXSVRsWUNPR2JxamY1YW9oaXhvMVF6blhuemkr?=
 =?utf-8?B?SVhhMVRZTzMrNlhNOThGYnNxMjFOQUVGcmpScm1Ec1B3SEtyKzFhYjNoeTB3?=
 =?utf-8?B?dUk1RTBQLzNKWnFvWG9Td1hJZHZaMHFvcTF6b3QzUGpjMkFkKzRTUTF3bFZD?=
 =?utf-8?B?b2owMkk3VGVyOFh1VGxtZ2oyTEJkMW1xWS9VT1VjdWRacktlSURTVG1sQklp?=
 =?utf-8?B?dWhQQTVUeGRHcDgrOFdnam1ER0oxWWYxZXRSZStncUpzOFBROXo0NitRd2dD?=
 =?utf-8?B?YlZocFU4RXpXL2YveEszZEtaaFh0UnhnSFlCWUZYYUI5TU9WU3hIZmdOV3ow?=
 =?utf-8?B?bElLUm84enR3cVZZa2ZmNzNKK05hbkIzWldKY016SVN2eGk1RldXRGU5M3RG?=
 =?utf-8?B?RWNUM1dvUkZPaW1udUlNckU2bytweHFEUEM3Mk1QTVMyem12RXdEZ2Fmczdm?=
 =?utf-8?B?bEU5bUNRb01LS3RBVTdsd2RWQ25LVnVRL3kwTXkyOFl6RDJEK0JUL1pESXVY?=
 =?utf-8?B?S0dHTTBqYUFmUG1VSjk0SHc5b0lPRDZxSFZKUGNuM2VQL2FPOXZydFNXcUNQ?=
 =?utf-8?B?dHFvb2htdVFIY2VNYThhQ3F5QTVVN0FvaW1kY2kvci9xakVhY1plOW55Zkc0?=
 =?utf-8?B?alFxOXVrMlVPdUNFY2N5c3VtNFpNYXFPNTBqRERoa2JFYU4yUGhwWThqNm9s?=
 =?utf-8?B?T01LNGhWQ1U5SUY5Z1pCMExxMUNwMHBDSUdObWR1bUhXNHlvTUxLK1ZEWDlF?=
 =?utf-8?B?R3hsVXZSaTZPaThOMlh5S0p2ZXNEbWNOT09DN3pGZ2twTENwOE5scjhZZzYz?=
 =?utf-8?Q?wO3gIF1hHz7ZsgHpqXtYRQSae?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b100b8f3-aa81-481b-5ee9-08daf54a7c2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:42:28.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFQWpp2RuXYxMZ7p7SnCnVuiT2rJJQH548bP67xT5kmkgHCdcDTqJWa2EXIEZ5AENua5FiVm00A4LPrMUrB1lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7272

On 13.01.2023 06:29, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -43,6 +43,9 @@ config HAS_EX_TABLE
>  config HAS_FAST_MULTIPLY
>  	bool
>  
> +config HAS_FIXMAP
> +	bool

I think it'll end up misleading if this option is not selected by x86
as well. So imo you either add that, or you move the option to an Arm-
specific Kconfig.

Jan

