Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446164E7E1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 08:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464150.722509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65N1-00077S-Lb; Fri, 16 Dec 2022 07:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464150.722509; Fri, 16 Dec 2022 07:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65N1-00074x-Hr; Fri, 16 Dec 2022 07:43:03 +0000
Received: by outflank-mailman (input) for mailman id 464150;
 Fri, 16 Dec 2022 07:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p65Mz-00074l-R4
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 07:43:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a0622b-7d15-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 08:42:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9451.eurprd04.prod.outlook.com (2603:10a6:10:368::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 07:42:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 07:42:55 +0000
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
X-Inumbo-ID: 42a0622b-7d15-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eepcq9YuZpPBsa01lC4vnhyoZTo3q0tqETr+x5V670o+Z4NbV5pebPrV03283o6ImUrQ7PDp0mwet7CC9qrwAhTPZRvAgQq7fsmlLV3AeCjHOa0h1VAQhLj0SOejK/0KHq49nbmGrjBJbLLSjFLABoafbMN0gYNYDrEh/Bwjp0krlPyNZ3Ja/Kdadgj0AZI1j0fBBRoIkMoJ2srYdbGmxTs//vE5U22DDkienVEW8x3+PzJKRMfshU5PdfQYZdoG72ogkj9858gkkYm+HWh+TYjhgYLjh8k8B4LcbTXnBa0A24McOkUKJAR6H8Uuu8HtpCrVZYcAgGO+IDOGPlgxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Trf7iWZ2w0b5NnQP8EOIKgim/Jj6VlJ1oOKl74zSmw=;
 b=m1IquQLq07lnbqWAG71ldSry7dODwmuiP4lJ5FUmfZeF1fPZ29+f9+8AOy6GiTeVR/abF78D1JoTvZ3IOoIYvcO1AySVB82gMIifPkqwSjeVvbMbM8W2CF94QhFSSy3h4c6sj0HPhtTrxslYi4ol0yChlizXxdrJpFvhSlldmvTOxdJCESWdWRQcUnjUCzdoTQsN13gk/Fs4xtTdriIJXlNiEhipQFxvDL78CHUxRFHaxXQ8LUsZnF5k5RTRgDeu9fo1A2ImjJj3UNbngHO9G2KjONlXhO9nydS/TQFMRm86MLqNnreDFULk+tzVEs0o8w4swuhU98C/FUwu0PHrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Trf7iWZ2w0b5NnQP8EOIKgim/Jj6VlJ1oOKl74zSmw=;
 b=Rt0jVYCyyG3KkyGENVGQG22zw+vBh6kOLjKZhHSE5vDoRdN9RAQ3iyfno9qDyXdHW23/UTaw1QS3ZprwcAPPecgEVLW3qBEXvx6GoPD1nI7wRUF/CRZ7jlf5fVfezi/ZraQwuw1fKp4cqAh/D+NlBYwBVXzkHzQhUE/qt5eDDtubp4CHeEwPmE8wufUc0i7pzgT1KW/Cr4TyZ1SWXZAs95blZFDV7dziRmporR/RpBJSMFaC2inrKTSEARePIEwpmE65uVb0asoWapYNI2n80OKinENbqkq7p+5NP/X75HdokQt7y1DdHg+dThnOqPcnmaO4aWqUFNihXT14XePbXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <919f98fe-1573-45b7-6c78-0e907162f759@suse.com>
Date: Fri, 16 Dec 2022 08:42:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 01/10] x86: Add memory type constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <6d1135e58cbc12f47d144252d6e80c3a6f76a5f7.1671139149.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d1135e58cbc12f47d144252d6e80c3a6f76a5f7.1671139149.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: e38bc750-a031-41bc-163d-08dadf39252f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wryceMM/tPTl2Q43FvyjJemwTMIbTDZR3Mxmh88iEXJWoTNnzZnJb7oOtiuLuWJihe9kzSYd9gmQTttLJhPMkow3Q5cbZCEDafXky7vbLlq4wvi9VjCb9AFwXBqudq9LldynEExW/C/I2R3Ds7TYy/irpYuYMg2hd3wXqgoGdm6ffH9QDRWj0E2yPAWzE2owg174n5v9uu1vG/hmzv/VyhstROIWcTAG+T5i/fRgzadJjengw6fqwzBEjRahpcv2W5d+KcQP572bSl5ZyvMyvRMHda1mwan6TlvpuliEjrzEWfJYtYhVsdt74Q0+fmzVX8nKGUyTqYU7PEau2mH3uwssKt4i4/nHSFyG/4mX/FQuNSdsJvTRbibH+n/uq51I31Cn9QSntdIjgKoLxUdrSghwmgsBSeVo9+GiwLjyoxHJW8LB9TRoOaZAfI7ugGxWhgvj4mfhuafXBY6Vz3KwoRYv2x3+IZu4IRlGpFxdc2jThnhpBper6m5l7ECfogjbqrMk4BObNG+SQffbbVc1rkID7M3VFp+B7Zlby+aqOG0uR+m9ReiJV7V8DzFjbDRmDK+Bk+NRTznS8n/5zyF9IE/CicigH7o+WCp9O9y+jQkewXLpVY1CbCkTHLuPfU1neZKdrtklQhCdlZhNbunnNO2o/KW5xE3ZB8PAllUZpsVvrS/4dnBJ/APoZywBzZgxLqBjJ5lqL0ijCDH/AUzpY9dOOgAPeJdK/HuqJ7UjSbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(316002)(6916009)(4744005)(38100700002)(8936002)(36756003)(41300700001)(5660300002)(7416002)(66556008)(66946007)(66476007)(2616005)(4326008)(8676002)(478600001)(6486002)(6512007)(31696002)(26005)(86362001)(31686004)(54906003)(186003)(6506007)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjlwcngrOUJVOEJPN1hTeVhheWZtV1E5VGNOT2NpTU43SFVuZ3J0a3B2T0Q1?=
 =?utf-8?B?K1RqMzIybHRpcjc0VVdhZGVQOTlaMmVNUkEvT1VvZHlGdnV0WmFXRjdYRTZr?=
 =?utf-8?B?dUtlanRSaGpKWCtsSmJEeTFGNVhMRE1SajlONDh4ZFBQMSsxWUM0TE53cFBs?=
 =?utf-8?B?eTZQTmwwZVk0K28wcTRCekh2YU84Q2srZlcwU3RYYkplcG9GQ0RiRkdKRGox?=
 =?utf-8?B?eFRPcVRINk5KdU9Wb2N0U0JjVjQ0OFAzbTBjcWRrOWtZUm5LcURKeURuZ2ky?=
 =?utf-8?B?RjZJWUJIZ0h5UkFQWDFvWTZLNEcxVnduM1hud2I5bUM4QWRtVVE5REIxdjZ2?=
 =?utf-8?B?UmRsUnkxNzI4USttNm05U1ZJUXRHU2l5eXVraWZra2xNZFZ6SFNPcFlBSVY0?=
 =?utf-8?B?QnprTkU3Wm9wbXNNR1QwSitJRTZvNVhoTTJJYTRBVGJob3E3Ti9qM1d2UDVM?=
 =?utf-8?B?a3NGUVF6VCs5SWZpam5lY2lBWllHOWFncCtia1l4clU0QnJLSnlodWVKN2xN?=
 =?utf-8?B?S09vcGpXNWJNS2FGZmVwSmJiWEd4UGpxNEhyU2ttbGZrT2xDY2pwRmdpMkxy?=
 =?utf-8?B?eC92eUIrd3VlZFY5SXJaNlhCcFlWN0JWeGFLMUlWam5Bb2NPbTk5Sk80WkFJ?=
 =?utf-8?B?Qyt6VjEvQWRLZkNLVzgyS0QwSE1KYm41MDNYbDd5ZSszOXg5YUd3cndiV3Vk?=
 =?utf-8?B?cFdqQkc5Sno1dUpWWE1QSHpwWFJUQzFSWEJBRWhZMzM3dFo4UEV1YTE5L2sx?=
 =?utf-8?B?Qml2b1hFR1EvTnFZWGthVUkxV0xQM1BRNS9xTFFmdmVHdnNvSEpNSXBuRnpm?=
 =?utf-8?B?QUprNmI0Y2FBU0tZSGZMWnJscXgybE5tbm1sa3ZxRHpYSFlhYkV4aTZ0WHlm?=
 =?utf-8?B?ZW85RSs4K01GTUh2K2YrS1YvZTJwREhlM0h2dVJuN0ZKTmJsdWxhaXlDTW5B?=
 =?utf-8?B?Y1o4alpNTS9JUExGdVJjRkR5UTRkNml0YjJxeXRZTmI2QjhCMnJWRk5aSS9m?=
 =?utf-8?B?Ti9uZFNyQzVUM0RRK2ZTSEpNbnplMFlsOHJIOVQ4L1ZQZWVmMzc4MzVZL0ZR?=
 =?utf-8?B?QzllSEE3Tk9DSTNGaUhodDFnRnp2TEZKWW4xc2R1dnYwd25HNk43WndOOTJI?=
 =?utf-8?B?WXpQcjEvbUtyM1ZxekRiQjJEN1o5VEJQcVRGUnA1NjkyUmZMcndDbDBJalJw?=
 =?utf-8?B?ZFF3ZHBpQndDRUFTYjMxbFZ3UFRhZHd4N01jR0pJMlcybWhPVWZoT1duZHRJ?=
 =?utf-8?B?b0QyRzNyeTlVbHdPRDFBY21McXAraW03RWVqMUgxRUZZcGQwMDVoeEREdDFn?=
 =?utf-8?B?dDlFcERzZGUzNTh3ZHc4b1lqa0Fweldqb055MXVDUlJyb3hqemN1VzE5NGps?=
 =?utf-8?B?VGZlRVBQRDFpNkxuK1FVUm1Td2VVcEJiRXJTT1pEcjMxRGZPYTdaYktVR0dh?=
 =?utf-8?B?UnJmN0FUbm91R1A4VlFrdk5ZR00yRE1LMWF2QlRrL1pGWGEyaUN0SjVZUlM2?=
 =?utf-8?B?bWwxZ1NBczg3NXNvbUIreU03Tmt2Wk9PQnBxUVQ0Rmk3U2llRzhzUE8rRkdU?=
 =?utf-8?B?emdaU0RxS2lMd0dCdGZuQjhSNVlMT3BOK051THhjcWh0a1lJY0hqYTRTNUcw?=
 =?utf-8?B?NkxiTUJOL0FEby9rTjJDSXNlUDRnMDJ6bmRWZ0RQMVB6ZGdZZHNEeFZEdW9R?=
 =?utf-8?B?RjJVbHZ1RjFFMkduUVpCL01ST1p4cldzOFNtUld5VytSNk1WdkU1VzRVRVds?=
 =?utf-8?B?SFVuZjdZVEEranZReXJLd2pyWVdETiszNWtYUThqam1kN0ZrYkxYYXNsclVF?=
 =?utf-8?B?RWFENzU2bjNCeXlSeFF5cDNmdGRKbVFORm9TbTdWMlpOSmRpVVRwTDA4YWpV?=
 =?utf-8?B?ZWh1TnlSOUFETDR5UzdaYmJmdERNK3B4azU4MENIdDlZQVoxaHVSZ3VxdWly?=
 =?utf-8?B?MVpnQmkwSFpaQzhpdWRsbjBXeFdBMFM0cEY3OUZBYTBneU9qb2hqSWJGQVE3?=
 =?utf-8?B?K05UTmgwSTJMcmhNSW1qdU02SlI4Q2ZNeU9VUGFGYVMzVHZ2enhheDczVHU5?=
 =?utf-8?B?cHFHRFQ0V3lyd1lFczZqT0JoRi9nTnBMQVpxZjRRYzdGdFJwbm1pMWNXRXJt?=
 =?utf-8?Q?9XG1GWBRSAy7P/13suM1pnp8c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38bc750-a031-41bc-163d-08dadf39252f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 07:42:55.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKgOiriD6E+3DcHRfX6Lg+jF6ZMp2rqtbIjahJZ5KVdv78CeM8B3yDKD7z0oVRB/GgU60SGCr2/HF4ecuwqPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9451

On 16.12.2022 00:57, Demi Marie Obenour wrote:
> These are not currently used, so there is no functional change.  Future
> patches will use these constants.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
on the assumption that Andrew accepted your justification for keeping
the "reserved" constants.

Jan

