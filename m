Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B987590C12
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 08:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385305.620907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMOPz-0000NM-3a; Fri, 12 Aug 2022 06:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385305.620907; Fri, 12 Aug 2022 06:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMOPz-0000Ju-01; Fri, 12 Aug 2022 06:45:15 +0000
Received: by outflank-mailman (input) for mailman id 385305;
 Fri, 12 Aug 2022 06:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMOPw-0000IQ-S2
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 06:45:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee7af6d-1a0a-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 08:45:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3619.eurprd04.prod.outlook.com (2603:10a6:208:23::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 06:45:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 06:45:07 +0000
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
X-Inumbo-ID: 4ee7af6d-1a0a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVXicpdb7OUvPlYN83sNhPDF6mTdYyiSgY/cYfJQ0S/4cDbvibIHoksfFVKJ4Wb8QrQYFcIujM0njbboDKEdaEWS1uV2o9PSCow6zvkmb87Wa1hucHtK+PfrWr/npgrPBklPTJcNK73tyhaL1Xmg/vhAoeWEdjfHFj7u7t+i63SnGj0lVo+K/ZtRsg1gqs738EEWhe29SLfrz04h1ncuwAwsSfwz06o7+iYSFBXdjqYHVsAbDLmlEt6jlSpP27oP/HpD4LjrE8avoLA6/1ZI2MezCUizMqlVB1ubnbXupIrX7BqNWLn2MUN3IfkQlr9oug3QQ8ak7LvFEbC3DMUsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XAPlaUOVTiIfPopHk22cvy56SQbCWm4+1p/oKN8q4M=;
 b=ZnUbzBOeo2F45FP39Dsfmww6oFvxlSNPpwpolLDEvsHhMxMCGhtS/sgLEAs/wrrEsvo9xz9SbSoOsBnSVNxZwuAvq0SCkP7wZqPmkgx2s7rWOFoOdG1eSoJVO/ZDrxlc/Aigg22Q958BsInOW4a+2E/h2JOxtIt9iy4/Qabi+GuPriAcGCwVVwTZYQw2qeAOfioY1xO3BcJ1L5XvMzRbUzn/tfgFpk87k2bfU+gklpDaPRed4KxrZ2vHB5C6XZ7tMobdxPO+MUYbJ72JWz3UwNG5EXu1WGh4adE66XfnKo4pAWNVcqCeEuVItdWsxc4Kuljkz45BjQWOJprpVzPR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XAPlaUOVTiIfPopHk22cvy56SQbCWm4+1p/oKN8q4M=;
 b=ingZPfdcWQa4jmbiUrBf9NrACaGKNNTEV6UNQSxNxJ/qp9BqvGXe0GLnT6ahKzR1h24Y3S4ntdlmS85rUnTZIyDGjiRnv9BDRhb5rxZeTGslRqmVJ/hYPIKvgywoQmxzb6456yasWo3pk0dm8rCZ4vlR4AlPmiVVNSjQUzmlW1RYYMivq6xzX5HBsirJUEAaCVPj1RtklCmyH4NQbooohZtIa28dMy7VqU2fyQ+zH4GXFBmbdSafhuEvJeLHf7D/WL4p5j8i2tADNusZ1elA9FZIUBiPZEyOrko2h3FiQNlNz0RwYQ7ADHWVefnebHG57GY7Qd/C/FCBLdv2Z1zwDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82a9cb69-3a32-3bab-c28a-889bc11570aa@suse.com>
Date: Fri, 12 Aug 2022 08:45:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/msi: Switch msi_info to using pci_sbdf_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <20220811163740.31494-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811163740.31494-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0097.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef4dd957-7258-4f10-fc25-08da7c2e31b4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6XaWO2+6rx+JXsBKtQ+VXfFuaT1xY6pzQ+fnvgjlQm5+T+wt3knLb+LWcz/wlNcnsQxX58S1bcHpRQBErJCMRLwqMTJzBBlxBSQRAZJHeNshh79glaVpWLePLNEHFdJrOe5oRMazGyRgSmExMuv9oAgVXkBrpYHdJs8dm0ZbIDN1qrDoSPNrfttjdJzoR7nUL/zxCvGFdn3y+0p4NzuTOvL6b4tpgbFOm4pXsSh1maVt9YvUW5+CBCQbkGyS+pExRcQxYMED2Z2IdBE6nnOlm5+gTr0pkOM1vnjmGMFgSYv1X4z7aRJSy0BvSDloynCkK3x6+G0KnOzi9CP4bYOwmrWJv0E+3drnxz2vGQDGfrvvttim2oLSVjfv9rngcovb2ZmW5zJ+d2i/aCXRY13pufY82+rIIgd7zltq3qDKBQDNG/b+OsmRESNEIVKIJD44n9bevrEdpy6YVJwfAvzQLsikNpVuwhq8Z7lEq0Eb7WaPGvIpneNALFhUTey+3ejWU61/cD6+kRMWc4NmB8yOL3UUcVP4DLpKYOU6gnFOOgKCLc2oioeQ/Q/D9UmmSLTfMNOtjAuoRSA1kwt95fTS1sHclmrKV+e46dIo7XfUeFHp0AV0/RYk4V6RZnUSsCHx2EHz0OX4Wioj5nAmzg6WWKpH+cmN3JK2uTr2fLO+LyqJf0PsppxNFUJ7dUR1luan/1nrjDZ6TzoqUdYZtpBtsXyidUNVDnklmTAdWbml/1hCT/a1ybZW+DwWIYAFDDBTzADRZRjgew4mtRXxhJ3Xi/pDgWOp52Nn53zFTRgf9CXDoXP/zqT8wzuNS0CzCBwqtxvr1Ofy1bSk4nkLjbVH5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(396003)(376002)(39860400002)(6916009)(6486002)(316002)(54906003)(478600001)(41300700001)(2906002)(4744005)(4326008)(8676002)(66556008)(8936002)(5660300002)(66946007)(66476007)(38100700002)(31686004)(36756003)(31696002)(86362001)(2616005)(186003)(26005)(6512007)(83380400001)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJOY1pGOGh1c25kQ2VlWDB0NGdOWEVOLzU2ejVhaWY5UEU2V3FqY2NHb05h?=
 =?utf-8?B?SjNTR0xuS1VQa296Mk01bkk4S3B6K01mVCtqWDF3Z1FSZmkvdEtmcE5PL3Y4?=
 =?utf-8?B?VkFIbTZiUEYydFREYUFBcVU2OWVSNjZaM01uQ2tydlFhNVVuOTE4NzJ1NXU3?=
 =?utf-8?B?TS9GMmREMGR5MTl2UC9QWloxanpoSzF6UmFvQlRjOUZFWDFKakx0L2pEVzVQ?=
 =?utf-8?B?VmE2Wi9IN0hDYThER0QwRk5wRW8yR2NzWjVJTVNPaFoxNHNiNlBLV2d2a3hm?=
 =?utf-8?B?MVZibzRtdHR5OFpqTmlXOGw2VURqdmVvODVINFpwVlpPTE1vM0FuRTZMSXl1?=
 =?utf-8?B?SDVDc0kxUmxqUys3UzlJWVk3Vlp1NG5Ic3d2K1JnbUN5NTlXT2dNTENSZ25V?=
 =?utf-8?B?TzJIR01wWlpncnV2R0IzU1cvV3pwa1gwZi9vS2h1Y0N3NWl6V2xmNEdNbE5q?=
 =?utf-8?B?MjVCcS94d3lvTlJUdmNEaExwTDRIZnNkTlVObTBYdlJqdXJ3Z0t4Q3NoZG1y?=
 =?utf-8?B?UEpWRmE1OGczYzBoeEhWMG9XR0ZQMHoyajVEYnJ6Sm9HcVdGSStTZER5b3Z5?=
 =?utf-8?B?cFlRblNOWVZOQ0NhNENoNUp2TlZkRHY1UmFxT1NtL3laV2V6V09uSnY1c2NI?=
 =?utf-8?B?NzZNRFhoZzUwZnJZbDY0TXl2eEk5OGM0NTZDTTZaT2hvWndWY09raDhYeXNn?=
 =?utf-8?B?NXlUNEZRdEpZV2Y3OWJKSFB1dTBkOGZKTHFwcTc4R1p3aFY3cW8xNE5DY1Jz?=
 =?utf-8?B?TDg1RCtNdklKbjhkYmo5QVVuS1BuZ0xtbnB2MFhKdDYxU0F3RXpLZWdRZVFZ?=
 =?utf-8?B?QnZaK0c4S09uR0orQ0hYQWFzU29UYXQ0TGs1RkQ0UzVpelBqWC9Sck5ib3d6?=
 =?utf-8?B?ajkwbGdVeFJiV0syRXBUSzAyaXU1MzNmeDl3cDJjTmwxc1h1eUZHRzJQS3hO?=
 =?utf-8?B?MlB5cVZsMWNaSmVPeGNWTjNRZ2RhUVJkUVNtc3VDakRCV084djdSK3RDWnE3?=
 =?utf-8?B?UmFnODJSalhYcTNPV0svQkx1S29TeHlyL2EwVjBocFhhYTZhSmo2THlXblp4?=
 =?utf-8?B?anp6ZnBZVU5hL1hiN1BWKzI1VTFabVRGOFE0a1hYVTdMQURaRlFyZHRDUHYz?=
 =?utf-8?B?RVNZQ3pTTUpscHZSMjllemgyS0FKYlY3eVkvTlY5RWxDQzhZK0tvUEN5Q2F1?=
 =?utf-8?B?RGdBOHQya3dYY3NFaDdQSjNHSHVrSlZrRWxjblRnbjZPNWcyQktLampKenho?=
 =?utf-8?B?bWpSbFpEOGZQT2VmMENCODNidlJUU29xbW1xUHhtak5jaysvVHRjM09LZHdi?=
 =?utf-8?B?VmhpN01aOTVUcmttYXNjcWFqZ0lsazFnbEh5RVJ5YlltQ09LS3Q1ZEN3WjdE?=
 =?utf-8?B?WVBRTlkwd3dxYm9VVEdtc20xZktrM1NaeW5zd2kyMmRycXIvMy9RY2FWY24z?=
 =?utf-8?B?NjZ4TmtVdHovZXJkNjk5Tnk5Z1RLUGFFb3pPdDhjY09LQjgrTzRTbXU4dmhX?=
 =?utf-8?B?RUJQVEhzMGowQWFITCtaMk5Jd2kvSUdMK2JWdlRoV1BvTjY4alJpQXAzS1FB?=
 =?utf-8?B?S2ltb3J1eDhzYzIrdXlLWmRhQ29IYUgyc1JYWnF5WmVrWWpaNkM0SVdoYVE5?=
 =?utf-8?B?ZVN5Yzg1SHBsWkxxOW5UQm4zSlkxUlVsUC92ZjRIRUl1cFpzU0NaL1V1aHJZ?=
 =?utf-8?B?bFR6VnpwV2VDZTdQZHBtRy8wd0s1VHloRXluWExkaXZId1BCOTFreTlla2J2?=
 =?utf-8?B?TnE0OVhtVnJtbHlFbktrMkM0aHVTU3djNVk4alhDck1mZ2E2T0pRQ2hyUkRX?=
 =?utf-8?B?YmdGd3E0K3VCK1M1VVduc1paUWwvenltejFlRi9RcXEzM1VvOU1yOTZpSGY2?=
 =?utf-8?B?TzBLdjhjYi9yVHRBN21lNjd4cHFGdVBtbDh6VGEvM2MwNWtmV2J2Q2pCam9X?=
 =?utf-8?B?L3RacXlOcTF3M21GbnM0VjFCRGVJRmt2MEluOWNGVWdDTEZBR09IdDk5UEJO?=
 =?utf-8?B?Y0FHdFpVdGp4RVFGc3NSZndYSlYvV01GWjdiMjdjSFQyVTNOS0xOWE1GRzVI?=
 =?utf-8?B?NXZvK2d0YThpZ1E3K1VGQ2tzOVJ5S0JuWmZEK0J0Tmh1Q0tlc3ZSUW1Tb1p2?=
 =?utf-8?Q?JZ0qeXK+m6CWRBdIcbheLss35?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4dd957-7258-4f10-fc25-08da7c2e31b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 06:45:07.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR+1J+cXkW2Ncw21V68R8FhdYaCIMYDHwJcPh3VSUMFqX3IJ4FulTYKM4Iv+xibCFh7oGPLWwmARJo1vr35aRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3619

On 11.08.2022 18:37, Andrew Cooper wrote:
> This reorders the fields in msi_info, but removes all the under-the-hood
> parameter shuffling required to call pci_get_pdev().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Oh, you've made the requested change yourself - thanks!

Reviewed-by: Jan Beulich <jbeulich@suse.com>

While not the primary goal as per the description, I'm particularly happy
to see ...

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -918,7 +918,7 @@ static int flask_map_domain_msi (
>  {
>  #ifdef CONFIG_HAS_PCI_MSI
>      const struct msi_info *msi = data;
> -    uint32_t machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
> +    uint32_t machine_bdf = msi->sbdf.sbdf;

... this open-coding go away.

Jan

