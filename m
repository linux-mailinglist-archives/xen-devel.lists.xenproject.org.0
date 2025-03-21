Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B8A6BDD3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924149.1327480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdpC-0007rh-Ed; Fri, 21 Mar 2025 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924149.1327480; Fri, 21 Mar 2025 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdpC-0007pc-Bn; Fri, 21 Mar 2025 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 924149;
 Fri, 21 Mar 2025 14:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWv/=WI=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tvdpA-0007pW-A0
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:58:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea783a3e-0664-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 15:58:15 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV2PR03MB8607.eurprd03.prod.outlook.com (2603:10a6:150:77::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 14:58:12 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 14:58:12 +0000
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
X-Inumbo-ID: ea783a3e-0664-11f0-9ea1-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRvcBHr2B7AlXa7wwwzP7cNVva2AVJ6TTEB7YWkk+69YGn0xOLFdysMbfLWR7fPpewnlkGOXaG5UHR2WjKkqm2/0dauK43pUn55B+JeByuEd2rG7EmP/ASRUkyyEDCRfXEuo9nmlA71frYI9SYuQTHN/wasRyfZLcf9gwYUInIy/HbJ+MjuvnB/VGPtT/Ioa2JhINghI/OPomIkf7BWTGYDs1vNJJi4p86KoqY8E7YasejQS4O1lx7kZ94W3omDCx5oU5HygYhJELHed10sydnvKi6y8SRV7e2HNChVkeCNXoEB1GLqdeQ7awY3XXppXkGYIDm1rZUpi0Ug/3YijQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fL02CPPC+ReMQnElTXUam8KEi+iC8iHcAIwmx4keyw=;
 b=aFYj84vqY2at6hB5Dgq2HUSMSACURHIcS8yMeY24uyCuoj9L2XyXF8Vfs63m9hfox4zE6bRulWHSDg/JupB+CthzW9hZqjZELH3ecCNFvfvW4UCrvjtXhoYFXEqsNB7p4En1f3nIX3pmYXzs3FGw4IVOWOMZjCJECtz4iTvzpeumUr69+9Lm3f1G3yz5Ee2aEjbB6aBrmxZTgpSB9KXxBtHLuhFKySq7ps7ci+ZFxF8G58slk25f6yvw4N+SfrXSY/BQOdeSFQWaLJxRI54+NuFaEdvTiS53A6LiU+BwmuP/NEumfqR0hgWTbvWmnC5jcVBg5vA3C8m+bQxPQnY+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fL02CPPC+ReMQnElTXUam8KEi+iC8iHcAIwmx4keyw=;
 b=P0ZeXXeQCUx0eM48qZHLX3LllZJUr4GFphQb136CGl+2MuakMZDXa4brhPlrjwcyt3i3ot39eyoQgzdKBeRYBVVbH7t3YM1x3DP85szaPKNrpDogKOLH8MXXoU5REx00vEAnqF2OvZxlAcPeyI+DBgC0UmCt5H3zEfK6HYiiqSrPQLz5H9MS3VYmnhqXoUltZh12XmB98qs5Dd9ojJNFtCPYV7tMoREkDAFw2usrXuIP/p+6OY7budyttWmqF9/Sln3owazOMoHEiOrRLuXEmOZr/SV7PHG7MHCJF8sO37Td+eae0zqFONZtGjRSlg5TPsWlU6kJuN1Zod51i3dXtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <db6426f2-76be-4ec1-bd01-4553ebdf63f1@epam.com>
Date: Fri, 21 Mar 2025 16:58:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Mykola Kvach <xakep.amatop@gmail.com>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <849e6163-141d-4c8a-a57f-e589a38dd38d@xen.org>
 <CAGeoDV9Ey9gnR=AGe13y0HtQ4UwoBOeD=LuY4KJud7jXuJ-h9g@mail.gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <CAGeoDV9Ey9gnR=AGe13y0HtQ4UwoBOeD=LuY4KJud7jXuJ-h9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV2PR03MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 24dc7498-b29b-43af-1c4c-08dd6888cd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlh0REtRaTdDYSt2dlE1SWM1ZGl6MUFOeUVaa3V3cGw1cWJvTFlTVzFYa1Rn?=
 =?utf-8?B?SUh2bk1TcWNFNExwdy9maW8rdlJBbnp4RzdWMlJnRS9OSEg5cmh0eitDTU91?=
 =?utf-8?B?Ymx5Ym51R2RXNkdaWmtWNFg1UCtld3Z0ckwraU9FMnRpQUErMk4xaFI4K1hm?=
 =?utf-8?B?RUtaaC9vTVpXREhqMVM0NWM1QmVPMWR6V3VTRExTamh2eEpvYnVtUkFJVDRG?=
 =?utf-8?B?VkNQTUlBUklKOEs0Vk42cjB2ZzBXZThaanBXbWI2dk01SFBiUGZJdjk2OUhk?=
 =?utf-8?B?dDFlU0FycUVjYVJya01VT25GeG4ya0hCdmlOTHpyeWpYaGR3T3BCcUNEcEFN?=
 =?utf-8?B?bU5iMktYMVZkeDdvd2FycFlXWDVxS1I2WU8zeVdNSTR0NjBaQWJ3SmIvTXZ5?=
 =?utf-8?B?dDVkNGtJeWNzNUwwZ1lPWDkrSUxGSTl6YnBNdDhrRU5ERFR2ZzJXdVBEcEha?=
 =?utf-8?B?L3psVDZyWGJReVdmcWZBd0pYMnNNT0NKYUNqaGtFMWRPeXlYcXJ4ckFzSzBZ?=
 =?utf-8?B?VjMyUWJOaHlkV0dBNFNwM0JVRE4wSmpyV25Dc1RUMDZ6TGpjVUpITlpJV2ZM?=
 =?utf-8?B?TGgvaERUY1VzU2pQK3dMRDFIaHFzNW9wVnZPWVhRdnNSQkYzVC9zWURCSE5t?=
 =?utf-8?B?WHdBdE5YVGtZUSs1eEh2dGh2ZVUxMVkza05KeE8yY1NIamhpNFo2OWVyano0?=
 =?utf-8?B?WXBuUEpORmtVR0FqZFBPT2Y3NFBTN2ZaU0pPNUxYLzBwYTIyRkJPcGRBYzZT?=
 =?utf-8?B?U3h4M0wrQnc1NlUrMTg2VmErZGh6UWxjYzBpc1J4KytSallkb3lXaUVnN2ZO?=
 =?utf-8?B?Y3Z5RkNUbHhTUnRydjQwenRiNkZoTWgxR2JiRW1aejlIVDErZ3ZSQmV4Slg2?=
 =?utf-8?B?RnZLd3FralR0TnpBSjU0MytOM21QakFNblVQcWRrbDN5ZkJNWnJNLzdUcWFv?=
 =?utf-8?B?SGtwOGpUVEI5cnd2cjNlUDZlN255R28vTGlYaUxFUWxKR2wycW0zY1pyek50?=
 =?utf-8?B?WmJHWkRrUk5FdjBUNTBIZkFHVm1iWFRrNVpqQzhMZ3RhQW5ueUNab3RRcGEw?=
 =?utf-8?B?NTFOcncwcDhKOUNFc3hlcEpBZnUxTlRZZ2xYMGpjY3BXRmpXZkM3SVJMSVVz?=
 =?utf-8?B?NElwZE9POGxmSEN6MHZ2dzF6V20xdXRjREM0cjBkeUU0cjlRazlOajhpaFNu?=
 =?utf-8?B?YXU2N252QkdhYVIwQXc2Q2FmaXM2dHVEWWlURkZtK3dsRlI4dVZwZjcyekxl?=
 =?utf-8?B?TzJsYXgwb0pibUl5eFVwN1FmM0J5LzI1bU9Mbmd5S2hvNjhPZEJ3cE5BeDk1?=
 =?utf-8?B?b1IyRUptVFdrUFQ2dXJZOEx6NmU4VS96TzZYUDNBcUFUaHRMZTErZ1BoQ2Iy?=
 =?utf-8?B?RlNmbDBrSWh1b25sV1NnQVpvSGQ5ajBjTEpzWngzMGQwaVEwcFVraWtZelNh?=
 =?utf-8?B?aVpjYytrUGZJb0V4NHNZa1phTDdRVlUrc3F5MWlTMytkdnBSZVZqVXJtSW1j?=
 =?utf-8?B?N3pyczRqdnYrQnR1WkR5TDdIYVcvbjNESjNjWVkxbUZLL3ZCV2xWdFhXang2?=
 =?utf-8?B?WGZPbzZ3MW1KZWxUY3JvWS9EL3N5aS9lbDBjR3VNUHhQb3QyVXhjNHh5bGZU?=
 =?utf-8?B?WWFtUEFvdGkwSjBwTklBVDRNRi91NlZQc0x1TW9za2tQeWVGMUJpZVZnamdm?=
 =?utf-8?B?T1RES05GSnU5eStldWJXWWJIcEsrU21GQWJ0YkdJTjdiMSs1UjRQQ3FuaWRC?=
 =?utf-8?B?WVNURmx0Y1E5eUg0RFF2N0FIR1k5d3pUTXpmVnNkV2t0WEZPWFFMbmExS0k1?=
 =?utf-8?B?Rm44L0MxQ2R0dm9iVDVEZ1lxTTRvSDZZRzlXZVc1SXJ2TGMrUmNZRXZ0SkNH?=
 =?utf-8?Q?JwS8VIB1J9Y26?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGxObFJEbk9GdTBla2JCTWRkNm9ObjFTcUtMT21kdmtuZUVNOUxvOU1pUTRD?=
 =?utf-8?B?aDdWQ1hBZVRlTEpjVUtBeFAvMS9ybytzVVZZaUlqcTZsL1NRSlljbEM3OHE0?=
 =?utf-8?B?Vlp6enk4TEt2eFFKb3F5cjZaUHdqQkFCdlZsclUrNE4zdlhDREkxemw0VlVu?=
 =?utf-8?B?MW5HdDZUVlU2Ti84dEc2eDRLNnVCTHBNYUFvNzQvWkdrNHZnTlpVZDFCWUFR?=
 =?utf-8?B?SzVZRkZjRUk3M2ZDOFRYeEpud05KZGY5K0JoRGN0c29PdFVDNUVUbWMzMzdO?=
 =?utf-8?B?YVcySFlqcnZESlRsRFJjY0hRUFBaRHdmOThFOTB0WW92TURjYjFlTUY5MjNG?=
 =?utf-8?B?ZFhNeTROdTNTNXFkellEczVXVERxb0k2c1Q5eExzV1hkOVF2c2JhSmJGSlB4?=
 =?utf-8?B?RDlqVVEwMVlrcnVQWU9WRkJvVlBBWDRmRk5CazNWc1hOdTk2ZXdhN29JcUJL?=
 =?utf-8?B?eVdra2F4SmdDM0Y2amxBMXFvZE1IaGxPRmhEeUVKL0U0bVorOCs4ZnYrVEt0?=
 =?utf-8?B?aFZBM2JwWEZPSUZxYmEyZUxyMHBxMVNXcjI3ZDZRRjJLSk5TbnN5K3FRRHBK?=
 =?utf-8?B?V290ZEhoU2JPUzBMblZ2UVUyUEZsNGJ5RlpJOHZSSXpWdkt2bXVYUjJzOGR4?=
 =?utf-8?B?TFpaSmw0aGZHRzdiT1JneGN2Q0JEcDg1QlprK2VPRTBkcThZUjJXYjViakwx?=
 =?utf-8?B?UjYyMnpKbHlBSlJ3WDMzRWNJU2R6WDJhMUxnNlZrZlMzS0FJRmVGRTZ4V2hm?=
 =?utf-8?B?WS9zTis2UFB4OWpjRk54MUVPWUhYbUpGa0FJZUZBTXBuT01LNitIeGZrd1hu?=
 =?utf-8?B?dDB6TG9SN1pMRUN5NjBqK0FVRVFvR0JFUnJDZnB0cU5IN0t3VFdETVFmZ2hi?=
 =?utf-8?B?Zm9Dd2hPYjdWeXNJMUF0RUc5MkNONVNzcVlVbDNHa1FlV29DbW5PZEhFWk41?=
 =?utf-8?B?Q2VMMlZ1QkdqVTVLUC9sYjR0clZ2YytMSFhvQ2xxMUo2Z09FUVpadFV4Q1E1?=
 =?utf-8?B?Ni8zSk1rOFdTVVhHZHBFMFlxemMrSmtYZUdXcTFEUitSN1Y0eGN1M2RQSTNE?=
 =?utf-8?B?Y3B0dGtaWUs5amxjbm5PUXA1SXFVNjY2cGFaclJaRE1QRm81Q1NNNkR2SFd5?=
 =?utf-8?B?QnhzT29Jc0RDUjY4N2xHcXNIdEdYUTNUOTcvSGluVndIUDVadXZ1OWk5aDUx?=
 =?utf-8?B?bEZzZ2ExY2FBNUdsM2ZiNTh2K2pQT0V6ZDJhcjhsQkJOTVpKZFZYWEpFcGkx?=
 =?utf-8?B?cysrbEVCR3hlT0kwdStWM1J0TmtjZUltRm4wTW0wZ2w5Q1FETUZrQXV4Z0hW?=
 =?utf-8?B?REJtZG03Z2hkWkFXZExpOVhlK2pScHpaVkxDcXRpOHBmcFZxZ1VhcG5zSmNO?=
 =?utf-8?B?OVFoOXJMK3FtNC9nZUM4R05JeWM2ZnpBNTc1TkZZMUY3U2lxUFZUaFhVa0ph?=
 =?utf-8?B?VGFCUXJjZTlOLys5ZEJHT3JJd2tSc0Z0ZDJPTU1YOE9JWHRRVjEzeWwvQVo3?=
 =?utf-8?B?SExiWTFWRnVFQmNTTGNFT1Y4VkVuME0zVHFmSXdQVWdtR0RBS0s5Q0pmVlBR?=
 =?utf-8?B?S1E0a1ZLUUl6dnhmMnhvRG0wUDFBNHQybEVDaHByditUWWRJR2xGY3d0MFIv?=
 =?utf-8?B?a2VoY0cwalZqcjhDeXVzSGY4N2NFMzNVM3ZGZkNQaVBPZnpsbk5saTA2L0xw?=
 =?utf-8?B?V1dLeXZGeFF2MGtaa3p5eURoOUQ0MWJlbVBvcWVpYzFqTk5BOW1jUjVTQkhr?=
 =?utf-8?B?NWJIUmZjSi9oNUlNSTFxdENWMndzYUd5ekRpL2Q0MFArVWMvTWdGVGMxVTFD?=
 =?utf-8?B?QXptSUdKUXVUOExmRkJUWnF4SXpGMzd5aVNGTFJjclVrU2dCa0N1dnF1YW93?=
 =?utf-8?B?bHJsZmRvVHhJLzVNYk1NQ1VVYVh2MHNIVzlPejNXaGdSNmVMZkt6ZEJ5SmRL?=
 =?utf-8?B?amJyaWE2L2FhQlZpK0Z2Z3pPYkRqL2hveGsydnJGQTBzR1YwMmxPZldLTzdI?=
 =?utf-8?B?cVpCVjVrclZRTktIZ2dPYnB5ZzZXK2tIcUEyQXNyUUd3cytFcnphYnlCajRQ?=
 =?utf-8?B?VzBkbHp5b0d6aVZkS3RCLzhJUWZCVUdBQzhyU3pqMlh2VUl3YkZvWTVpb1du?=
 =?utf-8?B?YjdPb3NCVU5XYlhiTEhlaWF0dFFVSVhIOHpPbUJKNVZzbVhVWnhvSEhKWDBT?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dc7498-b29b-43af-1c4c-08dd6888cd19
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:58:12.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bl9H4lybREpJa0Id4hE7XcqaJn/fMXaqZPtm2ayAjSbWIuAAh8uRjh1sa/9GkRVXNidI24e9bYWwplC8VOrB2HfU1tnzCchhkcuxbpVchZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8607



On 21.03.25 11:48, Mykola Kvach wrote:
> Hi,
> 
> On Wed, Mar 12, 2025 at 12:29 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 05/03/2025 09:11, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> This option enables the system suspend support. This is the
>>> mechanism that allows the system to be suspended to RAM and
>>> later resumed.
>>>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>>    xen/arch/arm/Kconfig | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index a26d3e1182..5834af16ab 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>>>    config ARM32_HARDEN_BRANCH_PREDICTOR
>>>        def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>>>
>>> +config SYSTEM_SUSPEND
>>> +     bool "System suspend support"
>>> +     default y
>>
>> The default should likely be no until everything is working.
> 
> got it!
> 
>>
>>> +     depends on ARM_64
>>
>> I think this also needs to depends on !LLC_COLORING (unless you
>> confirmed cache coloring is working) and UNSUPPORTED.
> 
> Sure! I'll add the dependency.
> 
>>
>>> +     help
>>> +       This option enables the system suspend support. This is the
>>> +       mechanism that allows the system to be suspended to RAM and
>>> +       later resumed.
>>
>> You seem to also tie guest suspend/resunme to this option. Is it intended?
> 
>  From the guest's perspective, it is a system suspend. However, it looks like the
> description should be enhanced. Thank you for pointing that out.

s2r = "suspend to ram"

You definitely need consider and clarify ARM64 Guest System s2r and
XEN system s2r. First can be supported without second, while the XEN system s2r
depends on Guests System s2r support and required guests to be properly suspended
before allowing XEN to enter system s2r.

You can't call freeze_domains() and blindly pause some domain, because if it's not
suspend and has passed through HW which is in the middle of transaction -> DEADBEEF.

-- 
Best regards,
-grygorii

