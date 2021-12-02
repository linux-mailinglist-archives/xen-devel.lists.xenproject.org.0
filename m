Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652046644B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 14:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236546.410345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mslrJ-0007DK-9M; Thu, 02 Dec 2021 13:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236546.410345; Thu, 02 Dec 2021 13:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mslrJ-0007Ax-6L; Thu, 02 Dec 2021 13:10:45 +0000
Received: by outflank-mailman (input) for mailman id 236546;
 Thu, 02 Dec 2021 13:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mslrI-0007Ar-3m
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 13:10:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41170df9-5371-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 14:10:43 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-_XF84dWZNBOSgQbHuFHC8w-1; Thu, 02 Dec 2021 14:10:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 13:10:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 13:10:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0048.eurprd08.prod.outlook.com (2603:10a6:20b:c0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 2 Dec 2021 13:10:39 +0000
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
X-Inumbo-ID: 41170df9-5371-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638450642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQYj5oYY6VsL0JHEj4lCg5XtGqCxDMxbgQGAgqeDzdc=;
	b=D2EKi8upQ/IsyoGeEtK26jWbFBkY1XYDGbTzDV3mJuk8Vy/iTRLclI/f58bzUOG54LUpx3
	rmZ8ydydrhwg2wQQqqA/+1EGkpDvRYdFBdA4rZR/dxMWrf8K0x9lAdmxIm659TuYgXhBU1
	BlCT0Y0/OKqTrbCN4+nXVwV2TtztCLQ=
X-MC-Unique: _XF84dWZNBOSgQbHuFHC8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2V0q3MdGG7JjfS5gL7I5ewEyqNwIpSxxdtBgBkttblI+TPHNUCQSTVe6bz4vXghucJTZx2bY/S5XMLk/VstV7vYBzcnLnSCA94lHlYpNwrC2CRoS+LgQ1rOIVrTZkMWZufU7/Zt+ritb7IgNZsnRIDSRYFF6snwVCqW15KoKjc7bi+CpGUJUnGrhSWUCN6RXQjjjkmxbqIWN3Zqe6dKDN86Yf/0irU2H4oIL7cVJjVy7ag/DR0uyQ61iaZBL+tVrEbPq/mUUZ/BBFQ6LCts/3ZVcmDpo39dK2arxSRWK4fPd4AnkzqfYTNSP0O7nCypsJMMW8Ed5vw7L5pR0z86PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQYj5oYY6VsL0JHEj4lCg5XtGqCxDMxbgQGAgqeDzdc=;
 b=WvXLeoO8zmX6AnSpAg5qHiKLyMxl5P5v7KbVnubXsqzthIU3EJAnFp2EfH4X9d5RC0JdGm+GysO/uNrLIrUgrK0IVArUl4KwA/nla0TrqsxNSNahw2Z2t+ZarAEUZRyZ+KeW3YrVaqW7SZ0H21+e7jBAlOvqvVC0AT86SeCMAlJjTT/i9s72M7ZMtoYs8Yu/7vzqbs77oOHgOCzKnwTcQVRa1MY2T6I2n1Su4Yu0LtaOu0ZGLupJMvou1qatEhSz1iZ9D+xOAWU5myP1zlm4mVIIC9iVoUP8sedqO2tcj6NRC+ERBclr/Ua9RcKgTJQfsThO0bUJ7RVzKPRKKlKFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1628edef-ca52-31ec-6e46-6865694aa834@suse.com>
Date: Thu, 2 Dec 2021 14:10:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 7/8] x86/boot: Support __ro_after_init
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0048.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c6d909-4ba5-45b1-e2f5-08d9b595236b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57417C90F1F887FF3AFF6176B3699@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c/s9zn1kMSJiojF/8KMV2iKKRVhYQQTu0Dd8E5Dg5pUCJplFxXSg4xDJ9YneIVcONgM1qZEBvN8krMUdTaH9kEszMDO5PbjMU9LHL6sDbqELS+39pPt8fRISTUlHm+q912O2irdZDwNG03dOHGVdk6drrP++zeU2qgXF9hb1xFO59rMNaVH0gUKiwYujXEJNRGSyf7y8I+M+cmLsxAqPKAE27BSigCEev/IHfreD0fxHHdnWLmUUOwnGDbYN/R1PAd/3vd+Eh+Qca57TVcAifzabR4RAiD5ex8/6MFrQaRPWlkogH0R7Y4LfsH+6R3iujaTCbwzGlRXgpDAlnyJ0FcjOnfRkDGXWbhmQ1v8LQfSMOQZZ9EA2FiEZhTZ1VxAuKFaySWFStnJJjmxExua8bQlbyGS2Zt37IVnqfd8jNrggGshiYPNDrTz7XXfpzrd3d967nVZe+9IeTmpdTG9SQ3N+N423u5ur7aFksnQArWcHjhs6bh0zoZnWCS6Ueh/rrO+kiYLCfT9BeO/aT5Wox9LZzej85plAz2QwYC6DT+6tkdey9Nmi9OBds3roat/wPMVgwnRTag5B/KKN0yKNMkEkL+TfzB80WEOpDPAai/NrwAXihiN7rHiKpgfYXx585N57pENmax6t81MGFOerNOIPlF73/GZlFHSL+o6Hp4qL713kmoCkG30u5nsa2BJIdACF0ot7wiwEOz7qS7br+r4gFXj4tN8jtdr0QVaaQ5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31696002)(26005)(86362001)(36756003)(2616005)(31686004)(83380400001)(4744005)(66556008)(38100700002)(6916009)(16576012)(4326008)(956004)(8676002)(6486002)(2906002)(186003)(508600001)(54906003)(66476007)(8936002)(53546011)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEM5d1VGak1HZUJFTHp3dm9JYkVRaEhCNy95c2JqekUrcmdjODB1TlduczNZ?=
 =?utf-8?B?NWtYUnNFY1dNOEVDRlBGRnFnV3Jnb2xwTUQ5c2lrM2xhRnNiTy9hRUR5U0FI?=
 =?utf-8?B?TUxIV2dGL3RoQUlOcTgySTU5QWt6dlAxaFZxaWFhYlNHY1NBVTY0S2MzTDhG?=
 =?utf-8?B?WHNCVklEYzJhcFZZZUZiaCsxbE8rWlZyNitoZmNFaWFyVFhWdDRlSkRPVS9k?=
 =?utf-8?B?Tzc5V1ZHZFhrYXFXY0NkL1IwSHNFdEIrOXdSYzJkNE1FcXpRc2tlMDk1QnVK?=
 =?utf-8?B?UTlNOGxNZHBWdWVMRndDZFhjV0dTNlFEYVZvQW5NNm96djRQTGhvcWJ1T0VM?=
 =?utf-8?B?cHhZSXhHMlJnQXB0NFZPWkFtYkp2a2VLTktpVnVMUHpkNmVOT2NHUVRYcTJT?=
 =?utf-8?B?TVAwak5jd2U4R09wdXU0eEI5OHBHQmdDcEwweFlZLzNqdUg5bUp3SkdBS3RI?=
 =?utf-8?B?VjV1bnI1SC9JL2lSdUNOeG5NdjZyZ2o5Q0JzaWUrKzhyTk9JQ3B3d1hRcFVR?=
 =?utf-8?B?VGpDamhyeGRjSit3cy90enc2Z3ZlS2RqMWVyNUZiV0E2ems3MytXdDF6YWEx?=
 =?utf-8?B?NzV5aVkxcU9qK0tZaVhSMGNPa20yUEtUNmdtOE5HQlE0UGNOR09SY0ZYUmtL?=
 =?utf-8?B?VW4rc1ZVMFNtdGs2ZDB2OXUrYWNhZ1ZubFE1aGF1VzA1K292aDZjT1JyYS9F?=
 =?utf-8?B?TEhxOFlzekt0bzZvT0N2eDhhU2ZNTTZmNnBnVEdibTNhWHpRa25pYlprL1NB?=
 =?utf-8?B?UjBMZTFoNUJQT3hIeTNnSlZPMXZ3OXZiTGNSbkpvVmU1OUxudmR5SXU0UTNW?=
 =?utf-8?B?WEZRVmZob21LSTJZVGdvcC9MNUNXVWk4RUZHcDdOeGZrNnZNeUZaY1ZRTkF2?=
 =?utf-8?B?ME1pSGNGUlFFOFIyTmt6OEZmREpXb0FxQmIzQ20rQ2ZnL08wWkd5bGhEY3F6?=
 =?utf-8?B?NFVCL2swQXJidmt6YyszaFZuMmU0L0JycTN5R1F1YXV4VEl3K1BqVzVteG43?=
 =?utf-8?B?T1V3UGU0QnBLbUVwM0dKUWc3Z1d6VnpIeFZyY1F0YjlPUzU4RUkzaXB4bFgx?=
 =?utf-8?B?a2hHcGR2aGtsdGNYSXJkdWhvc3ZZQm56NVU0Mm9rTndzc3M1QW1CZDU4T3Er?=
 =?utf-8?B?SUZYejZRT3ZEWDJYUGxIYUlEV1ZlR25FMnBqNk9KL2kxc1hzaFF4Qys2Vmcy?=
 =?utf-8?B?bGRxNkh4eE1YOTd6RXBkY0ZCWHNMZkc2d3NCOFROaGYycElyTjUwNW9kRXdD?=
 =?utf-8?B?dUhkM0xwNTYxOVBCYTlpeWs5bnFHN2t1RURkNkxPQ3p1b1NlTmhiS3d4Yko3?=
 =?utf-8?B?L29wS0VDdStTQWc4cFc5c3M3bzdkc0FXMHBtaDVZM1cwL3FRVkdWcnhhdXRN?=
 =?utf-8?B?SlhVeExsK1dnRU1NV2xvNVhQU1R2WDFGQ0wwZVRNTlI5by9YVGttRHk0QUpi?=
 =?utf-8?B?bFNmZkdtR1JaNFJTRURwamtSR2FLS1h4SnluK1JXZVV5eUovQ0VJNElyYVFE?=
 =?utf-8?B?dDZPeDBSL1hHZUxKS0RKMDY5Um53eEw4T0lkL1FqQWpHWUFUNmd2R0Nramd6?=
 =?utf-8?B?b2dyNjd5N3c2SWJhR0dBbEFTR05ZdldlTG1zaFd5Zy84STUrayt0R01OMXVN?=
 =?utf-8?B?NWFPS2d4SDdrWjVvcHVZd0ZtQUlWdXRkbVA4YVdJQ2pPT3Jra0ZNQUFEY0g4?=
 =?utf-8?B?N0VxczFlYlliNVZUTyszTHJFUkVCOE1MdG5IWVdyb25pQ0NuWUxzeVBKYWdW?=
 =?utf-8?B?SDc5REFxSy9wNkxrRE1FaVFzUjRlazMrdk1LMkIzQ0h6ZHpZaURpNlFuTWhW?=
 =?utf-8?B?Vm1HNUJvcG1qME44cER4eEZsSW0zN0E1c2svOFpLTStWamxaN082STgxUlEr?=
 =?utf-8?B?bXhhbExIZ1d3UTNEK0pkZlI4NTZsWmNiYXU1d3FZL0RuMzZCTi8zZ1BXdmFq?=
 =?utf-8?B?NFRaNS9qbVROZnZSdFNtU0NKc0Z3RnRTR3c3SUxoZW1CY1BxL1lTZnRaSnh5?=
 =?utf-8?B?Tjg0c2Q2SWVMQXNKbXNxdDFMYTd1aE1GTU91eXBRVEpiV0pqeG16UnQvcHdm?=
 =?utf-8?B?cis2VVNlNnQ0Z1daMkYxbVBjZ1Z6R1NaOU9mS21RWS9LaWx0L2pOYWRNMmN5?=
 =?utf-8?B?U0Jpd0dFMVVvS1ZLSVZVdFRwbVlnU0VkeFIrN0tVMFVzbWlHTkk3VUJTUERD?=
 =?utf-8?Q?v5Q1PhCFZfoNcocWfKk45qA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c6d909-4ba5-45b1-e2f5-08d9b595236b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 13:10:39.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzve9xiAqaovGaqYVjQrjUO/innRzO4b9T1qPQAiviF1IUwoXVafyut8utOMB+Kb9PDj83Wd11PyuvAIuHlCxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 30.11.2021 11:04, Andrew Cooper wrote:
> For security hardening reasons, it advantageous to make setup-once data
> immutable after boot.  Borrow __ro_after_init from Linux.
> 
> On x86, place .data.ro_after_init at the start of .rodata, excluding it from
> the early permission restrictions.  Re-apply RO restrictions to the whole of
> .rodata in init_done(), attempting to reform the superpage if possible.
> 
> For architectures which don't implement __ro_after_init explicitly, variables
> merges into .data.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


