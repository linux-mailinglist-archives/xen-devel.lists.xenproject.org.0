Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E37717C5F
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541700.844702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4IR6-0000zX-7C; Wed, 31 May 2023 09:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541700.844702; Wed, 31 May 2023 09:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4IR6-0000wW-41; Wed, 31 May 2023 09:48:08 +0000
Received: by outflank-mailman (input) for mailman id 541700;
 Wed, 31 May 2023 09:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4IR4-0000wQ-Hq
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:48:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ce9b9f6-ff98-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 11:48:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 09:48:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 09:48:01 +0000
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
X-Inumbo-ID: 3ce9b9f6-ff98-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yci7bKCQWmAoF6zFdykAacaOXHxlUcltk6UFcu2SZo52yVSFbigVgD+kxxbK4W4jg5i7xuISiOpv3Oj1MGUz2ZOk+sumpqRQYEy8Uz3k7MuK9M9BtA6rrP3iSXy/LVJY2UFUSo9qj5MTleEf058ilBPAm+CvJfvXyfB2/Vb+BzQKHFXD71z+6xgfbkT9xHbm1VYrYcVugGbpYKQ0enNsZLmcidJyUCvDbfSOfFFqOhj/pDyHm0egiQeqQFFoN+6OJkbCVKOdVjhGSoqNOu/AvK0+ML0BURUQ2ycpfwOapq9GNMPvuAQ5pMmlSdq2Vsu7xdfBu98SmBq/eE07RRfeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUtLSOGwQiXhd9W3H1x3+onUMYzxJI0bwxTp9FPObkI=;
 b=cYhEsI/kk0OdRcWzHifQyot3oTTpkoFIxf6zJDMScAa+QGfr80VWXrcrCUOlHIUIOS1y30Joo8bMjrCvLBD+3U7dUDjbkdEajkXkXQOhMvTq8/6nbRTp973p0pMzSSWcjEQ5cXbpAsCv8ZCb/u2l7+I4XLOJ25R82py1qxNS5boCBrUYEF3zDXYNjEKHcLNu8Saxtbmayr2hAz1thm11UkBJmKFwB1yBG1Gtn6/W6j1PV6hQy+YGNkva/tw/zrdt0I3sqKle1eY9gBaHtXV9sPU0vFRAsne5Ugz/DHCLJbXOJqni/XQrBh53jQiaj+m9b/EQZfJmQRBHa3zW7YkWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUtLSOGwQiXhd9W3H1x3+onUMYzxJI0bwxTp9FPObkI=;
 b=vau8+Jjdgp4wreTKMX7RNMk4XsNFh/SgVG069Xpr0a1oMiAA+V/PRdGj1odo6cKtNu2y7U37nxS18fUuS0N+lJhNmKOwVhgpODwQjxCxq0dqSYbbC3esTC5k97Ra/Ohu9nQ7vvXsp89QpGK4xPmNrvpYl6IbNtYj0VLc7LQQZpMQ/k/BbOmCsabzLdJv1+xqc9pJd9hzL0yJPz/dZgAVU1VR6iFFgjVGFEnr2BWntxr4A0lC9T3a0oQwmtCtjRx0Y+HE1tlHKZDQLthaJqKY3863tXoFbeIOVSL3+18GMuJ6qZcR8EM9qZ6D3kFIjwu7XiKyA/VMUMDkPHzLdbACWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f742cc5c-f6de-acb2-34c3-22055f3c9b5d@suse.com>
Date: Wed, 31 May 2023 11:47:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] multiboot2: parse console= and vga= options when
 setting GOP mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-3-roger.pau@citrix.com>
 <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
 <ZHYeGOFpAtLnoQf2@Air-de-Roger>
 <96ade9a5-37c9-dd38-cb04-ed0f2c0bbd97@suse.com>
 <ZHcTn9dV0EPGTg6t@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHcTn9dV0EPGTg6t@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: be85093f-0535-4e6f-bc23-08db61bc1f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0h9eGyXa8Lcq6s4xmGypJ564hpTQx8zyuMgwAj6DhmBkXwypNBRG1F5TJbXa0GGsSIEUUxSd/p8RXdqJ08OCZd9NGrQx5mazD/UPB46irAvwMRbrdEk4k0OGNCd8j3ZF2NR3b2Tfcsmj+AdBsskyxLKsZm3FtHzH3HkrYDLBYaX5Go4FZ9OJjA7LtpODiIGpSLQxTHWFdew2JsGAvkDkOy1mFoSRIqMzIxdNPGXv6UizyvTjTAZf2FlwMdc0n95FIy9w3mHVlsKVqoopH0muIZuidGjnRzF92p1KkpJSg+UEaklZcgu+0P0svvJ4aJ2ZjpVELV7mzbmtlJUEO3DIM4vaYc5KGWbvS2X5+gmzBS4fR6g8cEQwDGlubRvLsTHHwG9b4crqr43Et60EIIkjcFU2p4i/CKIW9QxZJnJjWaPXSWl795CbsBf1fkLeWKEipTueg7uI0MD9OmGm/6OMPLOAsu5lJjseRYhf9XYBy07g5qGy/dOJ4XuIigH8bPYCsg7c7NmCngWAkbPlr1WotBbF3/mdRwijWxDqIdIGdc3iEl62FAHTdUvXWG0yO6Az+7eRYg299jStabzXa0gffnwq2wgOScm9J3MeW/QyhGzvDtHbOi+uw/H7t0p8VLfpzu1qCjApCDCPCaaf54j2ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(5660300002)(31686004)(54906003)(8676002)(8936002)(41300700001)(478600001)(6486002)(6916009)(6512007)(53546011)(186003)(66556008)(4326008)(66946007)(316002)(66476007)(26005)(6506007)(2616005)(2906002)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU50SGk1YWFMcDhSUVppUGF1WmNiR0pSdWduSit3ZTRmSDhxazFXTGlzUUJG?=
 =?utf-8?B?SHlrWjRiU0srRXc1R0xTNUxJMitwZ0lMbmZPdEhLTktDWi9TM1N2WHhad2o0?=
 =?utf-8?B?UFBpU2ZDOUlRRThkV0JSd1RoTHY2RGVzSjFzT2VCNkxyNlArS3VobXlETFNl?=
 =?utf-8?B?REgzV2FMSnZnMCtuUFkvZ3h3Q3MwSlB5SEorbUxrT2JNWkc2a3lCLzg4c2Rj?=
 =?utf-8?B?V2pMMk9SMzVEV29sWENPbTAzRE9kTnU5YkswTVVZejZ2SERrbXl4NFVIaElP?=
 =?utf-8?B?V3ZGbjNBbVR1OC9EYkR2TkVPckR0eDFOWWlTZVJkbWYzYWdGcU5hNm51a3ds?=
 =?utf-8?B?K1QySXg0TTZrcjZGTHhPazhBb3ZOUDZIQ3ZUbEcyb0lhU20yOGprYTF3Yk56?=
 =?utf-8?B?WkRLRUZHNGVSVXo4U2tJRWdLY3YzaGJ0WW9WaDRVTlc4SzFQTDNiQWM1bWN4?=
 =?utf-8?B?aE5jaXlnOVg0bVRIMVRYcmpWV2poMGV2Ny9DL1NOMGpEdm4xZHRiS3FTbVhU?=
 =?utf-8?B?bHY4VjZ4VFFxNHhzbXQ1WDhtUmRzUzVuWGh1RnZBQ3U1N2w4Zmtubm54S2xw?=
 =?utf-8?B?OWNPdnE3dldPV3F5SGdPZEY4TCsyWWdMUWJ3aWgrNlJnT1EwNWM5M1ZYVkdE?=
 =?utf-8?B?WEZLUXhyMGtEa1RwMUhuelAyYVN5dG1jQTZGWSt4eVAyL0JKWktYOUZGaWZy?=
 =?utf-8?B?dTZwWUtXTjhRQVY0LzRTN2VLWGwyNFBKZ21oTitXNmlRVnRYYzJzY0pOTjVi?=
 =?utf-8?B?eU5MdjRuUk1DN2R3QWZGRWJVbGxTQXJMTG40djRKbE1tN3lZaC9DdzV4MDM3?=
 =?utf-8?B?RzlxTE55cldTZUxUeVg5UU5OM2RGUXBvZlF6cVcvUjY3Z3R0anhPQ2FQc1Yy?=
 =?utf-8?B?cHJyY1FCK2tjbzBKdTN4N0dNVVRwTG93QWt3dEpJeW1zNis1VFdTTFh0Q0pL?=
 =?utf-8?B?QUFRblpJZmN0QVJPWjdWdU1xeEFYNFBQSEZqVnAwc2NrQW1yVVhaWGhSZFRu?=
 =?utf-8?B?OHZqVXZHeHBrbUp0Ykp4bTJEVGNMVGFEaStxaGJicGVJM0ZWZS9WOHBTa1Nv?=
 =?utf-8?B?dktEWlVXakJKejVOZnkvc2h5ZzQxTElOK0c5TUxXUjk5eUVOTHRRMkhHYmpL?=
 =?utf-8?B?UENic1Z1bDlhaWxPM3FBUDdpMysraTdaL1FCVm5EcTg5dFBtMGVqR0V0Nkln?=
 =?utf-8?B?R0RRc0VCS0pqbmdTdDhvcm5IcTQzOXErSk9vaVkxZmU5TTVMNkc3K1J5SnB0?=
 =?utf-8?B?S21VQ25LRGlTclZCcENwbCs4UVpLbWdSSW9wN09CdXVML0dMb25NazcyNkNQ?=
 =?utf-8?B?OGpMTk5lNUVydWNndGlDVkRZc1lXblUxVjhJYnZhdUpaM2hoVGZIOVBFMlBM?=
 =?utf-8?B?dDFDSWsyVXRGMGxwV0lJTkpzV1NQWUgrSGVxUEV0QXpSZi9scENheHlvODBq?=
 =?utf-8?B?OUhubyt2RThMbmxkbDY0YkdVejVrODYwZkRlaitqeVFTUW1ydEdLYkl1NmZy?=
 =?utf-8?B?ZE11K2xUSFBzY0U4MnpwN21VZ0lrYkNiYmRqSEExemEvRlVzam1SUm9XSFFt?=
 =?utf-8?B?cFhhbWZ3SUlIcnFOVlhCcFpsNEdrYkFWSzFUeUZXWUwvckNQZjJyU0ZOdXps?=
 =?utf-8?B?UFZPQmk3dDV3RlB2blR0akc5TEs5b0NVaTZtbngwaUk1SDBEWEVaRU56ejJY?=
 =?utf-8?B?VnVWMzBKMjdSLzhkT09BZjJQbHZQMktLOFFmYU01V0x0UE9GSkdWTXhQN0VE?=
 =?utf-8?B?UnVaYWN0OERldGVPbDBoU2M2RzYxYzlwVnFQK0MwbkZydDB0TmdOcGlMMGhJ?=
 =?utf-8?B?Ujc4YmtWMUwxK29ZQXNUQ1lRM0IvaXRGSnlLcXJtb3pqamFLcWxUdTFZWTlj?=
 =?utf-8?B?VTJzOU9RUXJxOE8weTZ1RlNJVHBhbWtjUFFJbUtSYndSZGt6aWhzZ0RwOWNt?=
 =?utf-8?B?TmdnTlZLeCsxdDY4VFZ3UTlBL01vMkFySEFIU0tCRUNyUkV6a1hmUlY1RGIx?=
 =?utf-8?B?NFNRNFlDU3NOd01ydlhpbXdrUGMyRHZRekRWc2pncUR6blZDZm9ra1pjQzZ4?=
 =?utf-8?B?WFVtaUlWV1VydGVPVnh2cXppMU1xbWVJc1Ivd3RuZVhRZ1pUZ3V1R3VlaW5G?=
 =?utf-8?Q?ApVN1k9hAm0LAI6lQ5d2BCNcM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be85093f-0535-4e6f-bc23-08db61bc1f9c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:48:01.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A0dPq34tJf9H6FUrqb/2aioGw5QH8kB1GibkEor8EI4MlqBykrJM/y/Y9oelTROar2pzI+ZflTUVPA1cQkcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466

On 31.05.2023 11:30, Roger Pau Monné wrote:
> On Wed, May 31, 2023 at 11:15:44AM +0200, Jan Beulich wrote:
>> On 30.05.2023 18:02, Roger Pau Monné wrote:
>>> On Wed, Apr 05, 2023 at 12:15:26PM +0200, Jan Beulich wrote:
>>>> On 31.03.2023 11:59, Roger Pau Monne wrote:
>>>>> Only set the GOP mode if vga is selected in the console option,
>>>>
>>>> This particular aspect of the behavior is inconsistent with legacy
>>>> boot behavior: There "vga=" isn't qualified by what "console=" has.
>>>
>>> Hm, I find this very odd, why would we fiddle with the VGA (or the GOP
>>> here) if we don't intend to use it for output?
>>
>> Because we also need to arrange for what Dom0 possibly wants to use.
>> It has no way of setting the mode the low-level (BIOS or EFI) way.
> 
> I understand this might be needed when Xen is booted as an EFI
> application, but otherwise it should be the bootloader that takes care
> of setting such mode, as (most?) OSes are normally loaded with boot
> services already exited.

The bootloader doing this is a quirk imo. In the Linux case this implies
knowing the inner structure of the binary to be booted, to communicate
the necessary information, plus peeking into the kernel's command line.

Furthermore I wasn't referring to the EFI-with-bootloader case, but the
legacy BIOS one plus the (mentioned by you) EFI-application one. Even
the MB2 protocol allows the bootloader to hand over with boot services
not exited yet, iirc, so even in that case Xen would be in the position
of using boot service functions (from efi_multiboot2()).

Jan

