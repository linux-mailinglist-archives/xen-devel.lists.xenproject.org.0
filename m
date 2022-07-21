Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F80957C895
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372608.604423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oET6A-0000BQ-Pe; Thu, 21 Jul 2022 10:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372608.604423; Thu, 21 Jul 2022 10:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oET6A-00008l-Ly; Thu, 21 Jul 2022 10:08:02 +0000
Received: by outflank-mailman (input) for mailman id 372608;
 Thu, 21 Jul 2022 10:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oET68-00008f-NP
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:08:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feab7fa4-08dc-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 12:07:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:07:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 10:07:55 +0000
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
X-Inumbo-ID: feab7fa4-08dc-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jERV0eYlGPdVcBDZSqJVlIJOO/qOWHtoAlA4Sr9Sq6lHJHQOxx7CroCzwK3sLFBimi9ds+rGcm6n8+gGcYB+UVk0kGwvEfeSwCKyzJeJjKD9CvLTpVAxFarHOxDCdlGE1+vNOFL4a6a5lFnSCaauvAbmKXkPpCK6bBQhZYmG8Jn4MXvqL3h17HrG485KKGMTdWzXjpiCeWLJP+T/qCOIq3Nsyewt8kjUFxLInJJ5kkB9KuCl4keURT+TxrL77YA+SzDYp/Vl9CkieA7V3HNmTKVNSXBsUJa2P4Lqky7yQXxVLTNine0jha49p3T8L/CwjVBqq/qq13CM49j802Wn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSlHUusqJEH9kKYYEGO54ihvGr+D0UzvhTG+WSF0gh8=;
 b=f2kZ2PbLVWAy1bT3JoNOZ7KP1qkPjwomC09jIyuK8HV1+4ZYXCEo0la9OdQpr7LxlI+M3MlHCYSy6kuzEz9CT99mowuB08KQdEI19nWAQ0cN2qNBPbbSbu10Q5Jc+CfV/euJhjXn/2LQu3xl62M3wfKUziAxtIMQ03ey71Lbffgp8TK6t0sPKoIHwsBU7x1nhnrF+bR25J/ULpk86vgTyGU38L9FfSRo1AQvodnWOqO0pob8jAfa/GIguyYjH0BkBC5mopkMant0glHH1P3FC51FOwyBeq340lqzsE9La+UfNAErvWcFX1sSaaWDNvsQ7YChLRQCOVQg044uEuUiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSlHUusqJEH9kKYYEGO54ihvGr+D0UzvhTG+WSF0gh8=;
 b=toL3jtjm/RlnrUmcgB7k2azJBQFqS9Ry3ifuBSKvjw7YDh96c7QC6mpArFM/f5zviNEdZqo7C2umHaW2RW1C3cCQ9VDw/DQSRGhITZARnCU9n47qWjbvG4gcJ+S0WP6s6JcQpJa25YcA4TmzhewN3MwnnN7f41WfgaVgXRnC6uV13AwAiSwTJMin0EUsDFMPxkyzXAFndiaAgTHZm6WOVbW0zngtwKMYsJBSZTMnufBawQZH62hhqts42MBLUxh+m1v7hb26xuca5sa/t8Ca6GGirR345dn2Qa41Mpanek0pLRHvp6WfORxYepmPaOhIK6RmCHD8HVmUJR4dZSq30A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c9a6602-8b3b-7cc0-981f-3aa67794b68a@suse.com>
Date: Thu, 21 Jul 2022 12:07:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/5] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220720184459.51582-5-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fabffdf-18fd-4107-49ed-08da6b00e174
X-MS-TrafficTypeDiagnostic: AM8PR04MB7442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yrOBUQwW3mQvKulfPNj6rAYQYBA7i2L3WRJIa6RLIK3CnwTjjOUzhZylDHrSl1UgWrCAGv7gVFP4faUHQly+igzKFDrTieYHpPsjL1zdXKS4xWnZq78C+HPZ/waxQn1uS2LFkVCCANjZFBJYexOOivWehxgYHbtvmvuwaP+HEWtGo3jrqwvzc4ArvJhNzNKebvMLqoNCzDusr9BptfiSC3AOnR586TydZ25JbHQd9/A0KL8xrQ3WlXGd8WKVZbohLMu985FTO50utt6Y5KkiTAzns8OUzxhCU0CdE/uEj8s4YuiJOOpWX57QCKaSYSD/mvJyw6AZzmcUJlr924TPzHrKjPonNdSzfVZQPul1e5z+mG7fXD2O9tOzW06IYmoezw4pZc8VaoXxi02s7fzQ4BrLDee0NIPvj/1ZvIh8Z9jVmVE/pPRwBTjYnESsTr7dYXZJg/DxAqJnwrKq7ftXicDxKlFa+tcGf+Oo7czb9PkCkwMJIs6V8ZLrIqAvqdNG0mvLS8kyScHKh3yW9cswW4qmFeAZy8kNsef/YTZpHNO+ifuhleqQhu2JcfEkljjg5mmmByDmhiEQoerbX0D5T+9Pa1zVj5fhDyTM5kKHQ+kWMDH6at0dyBgkKPJZqhczuzMLJFdd6z4uLzu6N0uYowSjvtBZJC7pqnbNFniGULk0XPXPORuWX/VItohjtHh7cRJnAF2sYFsdlCN86Aqs/fLSzHf6Nc4LvMk/H+nU2+eHl6p2930CM+U8zld3h+TGnlg5G4vPrAnf8N6evH5snYkncBuQxBUK54Sy1IizAJZBNJePV3XBAZF087g5ZaDpwByeSzzdFhMvDwGzmGFYbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39860400002)(5660300002)(316002)(36756003)(6916009)(54906003)(478600001)(66556008)(6486002)(66946007)(66476007)(4326008)(4744005)(8676002)(8936002)(31686004)(2906002)(26005)(2616005)(41300700001)(6506007)(186003)(53546011)(38100700002)(6512007)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R21aUlJ5cWlmeklMbkR6VEQ1NE1Ic0ZJc2tQWDBuUlR0NHhJTUpFejhJZjNB?=
 =?utf-8?B?cUs2azY0ckcxYnplS2FYcTAwVXVZa0NDQUkzUHBKNit6RWNta2xVZnlCYnFn?=
 =?utf-8?B?K0cwQWpKNzVOLzdzVGxvcTJLMGpVWGpSTklrU3hrb2NuZnVNRkVyVFFUL0d2?=
 =?utf-8?B?TUdqa1I2UUl1RkEwZTlYcFZmby8xL1hSbEVMUlQzcm1SeCsvWFBMeW54SVc1?=
 =?utf-8?B?aFRIZmhtaHZEUGQ1Q01KWFRILzVheXZzbjRRUHZSMldKUXVtekl0d24wVmZH?=
 =?utf-8?B?SFFad2dOYVErK3JkYzNJZDR5empJTG83ZXcxdWFJVVU5Qnk1ZXpNZlB3OGh1?=
 =?utf-8?B?T2ViTkxkV1ZYYnUyU0loT1J0K1FmOU9NU25tbXQzTEh6QWRqUEtJRXMyQkZv?=
 =?utf-8?B?ZGJhVmZIMStBZ1VNdFVoMUdIVGFtQVdpbTZ1Rk1TT2dDOGlsR01rSzVuTzR4?=
 =?utf-8?B?OFl0cUhpTkJVWUU0Sm9tYkx3d0p5cXIyeDZzMEFPdjg1R2RoRy9kTzNTbDVx?=
 =?utf-8?B?Q1ZFSEhjT1JrbXh4RWx3L2Nhakg4QnlVd1I2WDk1MkFLTjdhMlRzcG82ZElN?=
 =?utf-8?B?Wk5KdzQ5dzNRaWp1cDdRMGNTUXNOMGRuRG9qOTl3L2hOQ2p4cFc5bVY3emVU?=
 =?utf-8?B?YzNzU3pZZUlSUVc3Z1hvM2dyVVhiOHpwd1hsYTUzVXRYS3hiM25vVDVSNGF2?=
 =?utf-8?B?eW1MeDMwdFpzY2liK1o1NjlSZjNrVjljNHRoSDVabXZxajNDSWVaaU42R0Js?=
 =?utf-8?B?TDdtSmpwb0dRU25uRDBkUURJUUVsUWtvU2p3U0h4eUxZbmZPMnZLR01IM3ln?=
 =?utf-8?B?RHpDUVd5eU5uc2Nub25NNFdUMkxxcUQ2MVorVlNndkF5QUVNSHpIUW9TRGpw?=
 =?utf-8?B?U2s3NU1uSTQwNHUxV0NTQkxGN3RaSFh0d0xMSmJUSityOHErajNOc1hHMytW?=
 =?utf-8?B?SVBkd1hsR0NWejFDZUlNTGFYU0NEdW5CSlBHR0dUNVptTERjNnpiU1J2RzRp?=
 =?utf-8?B?eHEwMmhraFZZbzlUQzN3SndCcFRBZHVpWUdBTzNUVDB4OWM1M3Z0SW15SGVj?=
 =?utf-8?B?Zkl2NDlJVnpuZW9aaU8wdmhOZ1lHZ3BxYWVnbVJFV0ttTU9PbE8yQzl4eER1?=
 =?utf-8?B?SjN1WURCTG02cUpKaFhDQ1RkVmtOTjlrZ2IxNGFYT0hTYzdxa0ZnOWNTTVFj?=
 =?utf-8?B?anBIQmgrQXB2U2pXelRTL2czeFFXR1lJNElDR1QrSXJhSkIxMGxNc1Boa0JT?=
 =?utf-8?B?ZUs4QWM2emFkZndiVmR1TnpUV3lxWkpBMVRoVExIbm5yTTluMm5NbGRqY3g3?=
 =?utf-8?B?UDFudGcxYWVxZDVOYjdOWWZGU2t1aHZRUlVvM05PSitEeWFTeHlnZnZtSEFw?=
 =?utf-8?B?S3o0SWxsV0JZOGNudjhEbVBPKzJBOVNxNFBLZ0V5Mm85T0ZWWnlabjM3NnJr?=
 =?utf-8?B?Qnc3ZUJwYUcxL3Z6aFdQSFBha0tabVVscFlrcmJZUVZ6UWt5SHQ2QzJ5N3Z4?=
 =?utf-8?B?Tm1DbVpHOGhYNzBrZ1NlK0M3S3VxOHNWOUdGNWZBcG44aFMzdHBCcm10bEF3?=
 =?utf-8?B?YktyenBhVVk1QTJRSjVLcmpXSWVsRXlxL3UxSThoQkNUQjZpQUhXYlRacFVS?=
 =?utf-8?B?THREMFFJeXBTWnBTemtnQ1NvYmlsNWc4RHBhNjJmNDhEOW5DbmNLejVDazhE?=
 =?utf-8?B?RFFCTmhBS294RzV0MnU2YVpnYlBnaHlSYXc3WWpWUlNpS3RjUWtqVVZtSlRs?=
 =?utf-8?B?VzcvajZySmpScFRQb2xiMFZWYm9tTXFaL3Q2SGR6L0dhOGppbXVXdE84aGFy?=
 =?utf-8?B?dW9rWHV0bDV0K3pCNlRvQXFJQ1UyN0RpWWVCVGFRN0FUVnIxTXJ2R296V3pp?=
 =?utf-8?B?V1VxOXJpNVh1MExsVVZMNGlPMVdTNFBmaWJ4V2FYREdxVVp1ajRjSjFSS2xp?=
 =?utf-8?B?VFdUUExTNGZqSklYWENRUTRZTkdzemJsbFJJR3ZEQTdCQldLckozS3VoSmJh?=
 =?utf-8?B?MndhQVJiU1dvVU1hbGF1RGdZQ2hhSDNzU3VOUWtBWTJuZWkreEtwZG1wdUw5?=
 =?utf-8?B?YlRpVkVIVjdsSVRTVzJidHNaU295eFU2NW1aejNUTFZGWjViSTVNR1EwT1JZ?=
 =?utf-8?Q?GU4dmsZBFeS56gT6l4JeKB35G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fabffdf-18fd-4107-49ed-08da6b00e174
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:07:55.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi/2xJQKnvSzRLMKCwaN4iEEEwIDGyjkqiTxixBoiSjtsidPtibIa9hF2DwVg/QGIVKQRwoWlsJhT5XAlLkOqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

On 20.07.2022 20:44, Julien Grall wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -11,6 +11,9 @@ config COMPAT
>  config CORE_PARKING
>  	bool
>  
> +config DOMAIN_PAGE
> +	bool
> +
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y

Is this an unintended leftover? I can't spot any use in this patch.

Jan

