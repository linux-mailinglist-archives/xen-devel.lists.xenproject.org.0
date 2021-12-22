Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0847CF3A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250705.431759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxuz-0003f8-G2; Wed, 22 Dec 2021 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250705.431759; Wed, 22 Dec 2021 09:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxuz-0003d4-Cu; Wed, 22 Dec 2021 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 250705;
 Wed, 22 Dec 2021 09:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzxuy-0003cy-NM
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 09:28:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9255c4-6309-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 10:28:15 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-xJipt3uuN9qSvpuDhfNoJw-1; Wed, 22 Dec 2021 10:28:14 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6003.eurprd04.prod.outlook.com (2603:10a6:208:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Wed, 22 Dec
 2021 09:28:12 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 09:28:12 +0000
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
X-Inumbo-ID: 7d9255c4-6309-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640165295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ST1XzSg4MtBdb52NTwXfc6sVlyAu8tikSBdV/sJa0To=;
	b=IAAwhhSxS7cnG1yQwmG0ZLk2O29sXtvoOxEvG8BfrlDiNGxvuvQM+aHZ8Wo94SL+vdIxUf
	EuA4RPdJaogAanmsrATgt9jcibxsmMmRsrkBq7laixuvMvjJwvjHYwXupYps6M+7hpXHSK
	EUtIWJ/oexoJlWoDNYGSkh6X11SmTQE=
X-MC-Unique: xJipt3uuN9qSvpuDhfNoJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT8DPcyTehihLLbuaRNexhSBdiZDiznhJAMDbHhu+Cc4Tl6gQY5+4osFWzf6/DCJYaCE8zjhul2WXiwrGK8f1nMeFcQKXvJ4ZzbOZ5pOVhQe0Ri+xqaWfg+cQkq5j14UIW2ol48zv0aXZCkZDeHM3LsXgMizOKW63D+wdA+glJcVroVN+2meePuR6WLS2FiFk3jv1wyUBM9XK44T1S77Xh1wx1WGWFTFbxd4tPuvnYlUiIR1Kh9yqwJw6h54taNodzhg4/M0gYTlJRzQbkz4DfTw4mM5LwWU900Z3QoGvx3SLU5IMdlSVRTopRWtse67dVFZQzagnFD1Ji9eNNO1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST1XzSg4MtBdb52NTwXfc6sVlyAu8tikSBdV/sJa0To=;
 b=FqdsJbLipwltjaxCuThFL04edPZ+LUUtBiXXdStorXsYpG3gApQalda6AU5kkZim63miUiwAv3STH/wmlWCtr0Q+puKb0h5lkV5Cd3s8/HsXOpfBwkOXVSPZZe7z48pwQlKBfOtk232U2L0upx8blILqjjGRBu18ddo2H/hkoUAGFV0QdkR9NE7Q2o7v3HtDwveGLfSPxvLacrxDFXX57fnHFkkQzIO8JjX/cnLeIPcQmEbU+wdNEsCJEOevdI+Ob4V2zKUiGB3XVWrdPGrVMPxrHqVcBs/May2Az2SXeCrSuDR3a40wuI5X3RX6IVhIICWsemgDwGQj8GI3V0cYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afe6bc04-c87b-e627-d032-b205a6bcfe7e@suse.com>
Date: Wed, 22 Dec 2021 10:28:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [BUG] Resource leaks in Xen
Content-Language: en-US
To: Ryan Cai <ryancaicse@gmail.com>
References: <62B51AB1-2C2B-402A-A7C8-5ADACE265DA4@gmail.com>
Cc: dgdegra@tycho.nsa.gov,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <62B51AB1-2C2B-402A-A7C8-5ADACE265DA4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa58cc7a-4292-4e3a-a584-08d9c52d5fc3
X-MS-TrafficTypeDiagnostic: AM0PR04MB6003:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6003FDD0ADC3BB796D62B704B37D9@AM0PR04MB6003.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DCPf6OGZZ4yQwMHzyjHwHmnwoxkaJzZG79GkwAxrhiAvRgVud2GIxLAVhp0NpS4b/0ug3S5mGxyz0uL0vCxcgUzLHTtj9z6GkImyirUxECm5e8dzoKg4jmnFCTR2AVslBox6mbKl7Aqbz0NEZumu2EVfOB2fL6GWQgYtAcHTYOYWYdc3jHloUASpvx+AOTxMQNd5rM3uSpUZmoFYXaETjbbk3sgIRQXQOd7olkid/k9XUfTi56mx8euWUGx2LPDbAMmjAxgjkVNWbhd0pEkIVYFODAH1EhNv2bIrdM8JI6t65F/+08a7WADiYFU6/gN005a8o8LuEhclTp+Dc77Yud4YarX9Ixq74xTteLKrb8tCqfps4bZ/u/QtYeQS1DQzgj1qJDjSkLNJjmOaYh5LYynuckMC+dlVF5bXCniiyRWx/EPRey3iNCKW7YiTsbzz+OSQGF7v4144+9dBSh41BKmtsX0b9KhdLy8OsVvr8UxirkqVqyvPmFZpqhT8O3DKwZngxik0IPqtQmz/tNu52QjtCMYKY1LA+3QUAWa1nErjlBVALZWf8giRD10Es59C4WPBcvuTXJfW8Gazqoel+Qturw3vLJLgcZy6fKvv/3Flgc1nbH1899B4QjJy+dSK3Q5kJGCEu9rsykgJ7cXYlpawEkSCWS1vjnhpozT//1PJScU4ivmIn7R0pBBQO6LmbPRF/uoU6Zmp0qyEvKYgo8Bh/pkjrLBlpiPY44JILFmOYpX1QgoUixKiLXmlEqC/xSiV1mASMWboJlJ3+pEsIXfV3ek1xJ1somij7S3hdcWpXST40CI9aIdL1M1ajqtr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(6486002)(26005)(316002)(6916009)(186003)(66556008)(66476007)(8936002)(2906002)(36756003)(38100700002)(66946007)(6512007)(4326008)(2616005)(6506007)(8676002)(83380400001)(31686004)(86362001)(966005)(31696002)(53546011)(508600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tJMU1PR0RNWFY5cTAvLzh1aGZJVlFXQWxmVlIva21iNFR1RWVsM2JGMEJJ?=
 =?utf-8?B?ZHUvZ3ZmSFB5cDJJMzVza2lnYll2YmMwUEJBSXRHSVJVUWM4SDI2ZUVTdUZh?=
 =?utf-8?B?SnRHdlJqY1VKTHJOdm1SOVJaYXFDanZBWVM4MHJQUFN3bW81RUtvaTdCMWh0?=
 =?utf-8?B?eHozUVNkZGk5ZXZRS1ViWFU2U083dENMSE9KNEVwTHpIV2tjR0RKL2FScUwy?=
 =?utf-8?B?WUtJTnQ3akpJeEw5MHp5UStWMFdESGdSTDBqV2NwaU1ZTmpBbnllTGQ0cFdr?=
 =?utf-8?B?d2lxTldNT1lOVk9sSHpvV2huSnd6dmI1UUwrLzNjWTl3Vk1nNk9TcXZmVUQx?=
 =?utf-8?B?VmRXN0hDdnFFMm8vZURjNFI0S2hkWXgxTGlUVFpLY1RXTXY5TjcvNlBWdGdR?=
 =?utf-8?B?QUthci9NMTB5cGF1N0xqRXlOT2gwOVpMdVVwTDBFOUllTXpLMmRiVXZhWTB5?=
 =?utf-8?B?dGxvMFhjRHV3YmRsTDJjR3BtUkYzTVMwMXJTNndGQlJqNjlnRkRPN3hEd0Nl?=
 =?utf-8?B?ZHpUWVFjWUJRV0FwS1VLbi9JUXpNdVljdFlIemw3YVM0VzROTW9aZU9oM3hO?=
 =?utf-8?B?QlhMV3dMYWVaVXYxNHFOU3V6TmQ2cHY3VGVHclpNOTZFby9xTXAyVTl1YXdk?=
 =?utf-8?B?QUtiTTJEcVFiZi94azJDYTcwVHJsYXo0VnhSYUFBZFhLQks4K28vV2pDNld4?=
 =?utf-8?B?WEMxS2ZiNk8yRFRZNHhWS3VVeUpyRm9LdS92MmpWZFdKUE8wSHFKNnpnamJR?=
 =?utf-8?B?K09aMGZJV1RDbU00U0lPb3J2UkR4VDZkeVVwdUVrbUtDN2FLU3FwWnhISGlJ?=
 =?utf-8?B?d1JCUlUrNUUxTHIwTlZqKytGaUZBTWN6RkE0K2hjL21VSkhDcW95MnVZQWV5?=
 =?utf-8?B?bWN2S3N5dk1xWWhJaXQvZWw1L211RFpqZ2Viem5FU2puNlZSSDRtTVIvaTBK?=
 =?utf-8?B?b1RBaDF5bFJOTHFoMjBrTHZzUEdveHRKKzdFWWJ2elFPWHh0VjNvOE50MW10?=
 =?utf-8?B?d25hcjRtRzdUOUVVbEtTMU9vY2VlSDVpMDdnajkweW9aMVFRWVZXNlFaTjhO?=
 =?utf-8?B?SytscFZEaDBmZ1hNdHBWR09oQVRsbC9sR3V6SVJGSmg5S2NDMTdGSG11ZDFR?=
 =?utf-8?B?aUZDYzRlajRabDFNQ0FCN3ZINVl3b1lub1kzZUIwNmExdk5oZ3habk9mZWdQ?=
 =?utf-8?B?MmZ6U1pZZFRjMTdEc0lYT20yRldnTHg1M2ZvOUYxS0ViWDRhdERCb0tCUDNF?=
 =?utf-8?B?di9iU2ZsdCszWFNrekFZaDhHYkU2Y09mZ0RWcWhwazQxazEySkxQV2RIVGpj?=
 =?utf-8?B?R04xdllpS1g2d21JTUs1SVNkeXhYenNMTllYQm1oTXdmT3MzMWE4OWJKdXBU?=
 =?utf-8?B?b1FXeHcwUTI1NHZ5cFhwaTNyUVFRQVRBUERNenlhTENrR0xUME92UXhOeFJn?=
 =?utf-8?B?emRMMkl2VWhzQzhYQ0RCWStLMTR0N0RGTTFncFNCcklyeCtSc2cxbDZFVTFD?=
 =?utf-8?B?WFBMREExVWd6TElINmhuVElxS0lPdUhyRE1GdUVKOWZlOTJleWNRMHk4cUV1?=
 =?utf-8?B?b25vemdCQjJrV1c1RUVLK1c5aFJzQXFsdHo1cE4vSzlERHhIckpoaFhJd09h?=
 =?utf-8?B?YW12OE1VemJCT3U2UUNhNk44elo5Sy8zREdrK3JVSkZoSUEvbDR0TGhHZXE1?=
 =?utf-8?B?b0pwS3F0OGtSMXZHM2EvOEVwRE9wZnJOL2JqN1ZUOU93ZjJGb1V4R2JQNUxm?=
 =?utf-8?B?bVVJMnVLTDJKaDBKaWhwc09mRzl4dGdwWmtQZFZ5UmdxS0cvVC93SlVmMVhV?=
 =?utf-8?B?QTY4Wko0ZW1kMFdkRGtZdHhhTm9rTDU5bHZxaGhnTVk4Z3R5MEtwSkVCa0Fn?=
 =?utf-8?B?SC9QZ3dxRXNYRHc0dFg1dFBJZnZaZ1plbVhjQ3U5ajJHR1FZNCtCSUx3dUxn?=
 =?utf-8?B?U2thU0RjaHdacjZDcUI3VE5tb0pnbCs0dEdOd2RESS9QS28wNnc4L3gxb3B1?=
 =?utf-8?B?NElBbEhYeEpTbG82RURKcW1JVDV6WGx4dEp3VVZLTS9yUm9kYm1TMVpCcTBq?=
 =?utf-8?B?VXFML3ZXeFJveHh2OEUzSEdDN1dqMDZKR25wSmV5Nm0vNGdVT29uUENkTE4w?=
 =?utf-8?B?azN3dmRnTkRTUTZlMCtJcXVqcFo4NlFKUE5oVmxmRWFkRkUrRGJkanQ4OVQw?=
 =?utf-8?Q?82TQBrtdsaQLkb4SVE3l2h0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa58cc7a-4292-4e3a-a584-08d9c52d5fc3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 09:28:12.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuuB3bYPSqMGW/F9jNssuI+/dadTxQ9bb47dNYPIN6JVMGJ1rIibJLz9BO5YX0AQmLHyIfhPnMmlOTmag7gFIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6003

On 22.12.2021 09:05, Ryan Cai wrote:
>              I am writing you to report potential resource leak bugs. In the file /xen/tools/flask/utils/label-pci.c, the methods fopen and fclose may not matched when returning at Line 76, resulting in a resource leak. Looking forward to your feedback. Thank for checking.
> 
> Locations, https://github.com/xen-project/xen/blame/25849c8b16f2a5b7fcd0a823e80a5f1b590291f9/tools/flask/utils/label-pci.c#L63-L76

Thanks for looking closely, but I'm afraid I don't see where any
resources get leaked here: "f" will get closed implicitly after
returning from main(). It might be good practice to close files
explicitly, but that's purely cosmetic here afaics. Feel free to
contribute a patch.

Jan


