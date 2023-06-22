Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9373A2A4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 16:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553616.864273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKyY-0003gM-71; Thu, 22 Jun 2023 14:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553616.864273; Thu, 22 Jun 2023 14:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKyY-0003dp-4D; Thu, 22 Jun 2023 14:07:54 +0000
Received: by outflank-mailman (input) for mailman id 553616;
 Thu, 22 Jun 2023 14:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCKyW-0003df-9F
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 14:07:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c6553e2-1106-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 16:07:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9815.eurprd04.prod.outlook.com (2603:10a6:102:381::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:07:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:07:47 +0000
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
X-Inumbo-ID: 2c6553e2-1106-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haEcsdA7MqwhYbJUCTP0w19kKnnosStkcDxdzpUpmyKaH6yh3NJvxkv16A9tpOo0RquqiZ/V5nJVwKpTCbl/MNk6SUojxK6F6O0q2X9sW/oiv1apAAeoV7/mpkJtbDIx1NBbZ3OUBgD6o0zB0f4KdDhfV+Fjq/bLtBtonEEZLWLdh8ean7l7kSPYaTnaJ71IQ0Y2NrJb9O7d08bUcG77jaYzLaAu3Nx5Ewd7VpFEFobstdq3LnnYPb6rcioe029CnlXZs8oAwyYm2qE3s9SyUQCu9UoTbPhTtpJHMDOXcwU2f97zkMGcy6e28zIQFenYB2VGKCKlNO4Alo2NmkxAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gSL1txpX0lFBT1N9PYJXbgqpEj4i8eshcd5Rqeqfow=;
 b=hS3On+Mzsz2AhvWbp99iU5avEi8IAxdgktkwS+V64CVjfSgwc8uJ8lMH0NRTp5D9PZoArfOvq9KHRE64jlJGW9QsoImSToK3ySEGNnB8UAGaG2rRNtz7uwOXWztPvxMq/yox1NiOmxBIadzNCYquiiOpUQAx8V6cufmior9yWC/L2toYUjX2tSXw9MmiQXC8B7DwE1drY8NsM9oV+6GjdLsdF0q5ubZLmVPbJJTojhfXQ2FSrWMWNcdNFI9EFTyvAmZs/E9rX7CXlYn5OB/p34qULH3NRWHPb+6YR6GdguCOReAzqHQf/yIVzTkcMbM+LZQ3gD7odSAnfIGKQmnPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gSL1txpX0lFBT1N9PYJXbgqpEj4i8eshcd5Rqeqfow=;
 b=1YJpqGRAd2tYnsNSH3ns84SqS0MsSjGTytrckySKMjZNahmiiY8Jsmlaf1Wu6BLufQFtf9EgRm+fqqbU06HLL8ioDS1p0xxgoIC3xDtkfJ5oZeP8nIyUz2Mv03kykQzy26DpbYzs3GhCWI29fmH+mLE0A5+NGuDHqMVBm+AL7f2igxR6TpYUTK59nFpybFaXLy6HlZ+kLrE70xsp48aEvO2sNgrPQBZAhQ/xzYQU3OLXqmMccz6TPR+6k3nxUqPR25We0g2VRCdBWJhaD1l07bNPJSTdJTkbeiF0wrja3CsbmBXprrLNSLG7EMXqxxPV9T7snwnud40UPbP+Q8KnAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7205472d-041c-d369-861e-08ccb6be9400@suse.com>
Date: Thu, 22 Jun 2023 16:07:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] tools/console: Add escape argument to configure
 escape character
Content-Language: en-US
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, luca.fancellu@arm.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230622135503.409150-1-peter.hoyes@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622135503.409150-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a44281-c0ae-4c8d-074d-08db732a0e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgPQLyh0kWWA213rJf7P5YoaOIGT4Nge98utaDo+3TA3IN8XItZJ3C/b6EtaxUKT65CpxbKJZafyp3M/fEjO6XuqE+wkTa95Xr7LYrkpZ+9qCu7BO59kRpjkjjbJXr2lbxZ74FtzvLOUped0XuiGZsqA3qLPsmCvnvplSFUGf2kFsQNqH3tSbSEIO3yjJXfYWq1nCHhHPV3iNb+xD0mr3nwKe2MZoSkDdOFIU18TLHpuyegSwthhwLaoeUZrtx2EB/REFdaA2enx8iBT68jRF06SS74pbmcMFS/yQyLjsnTx2sujp8/Eeow49x3hFkUCZ5bdbG9OydXtTZCeDfeGZRKF/QhdcwThAn3SRWefkRmAIwzLW2IEzv/VmzI/rBkr+e6yfH0XxG1ZyzW39k0Mc0OY5X8z/B9hTQ6WJGrIzNuLTN+kNQhnNfsURLsS1HbVCfSZ1H6SSSSyAHj5Ge0i6wP7F58ShitlTSzlVbV4uJ+n1h0+npJkKeAHS19hfP7l/TGbbMdLsWgL1usObelMFYa/CDCwDIWYYhXPhCSPKWU18PogSdcYW/8GxCIEkD3ejnTjYC0g6oxTv0Ls3B+mne20Rb5iQnJ2YnBg6fTaM+F2O94m8oRVYJiO+bAouF79JnwMUPLfzlDG9LJGmbcBsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(8676002)(8936002)(6666004)(6486002)(316002)(186003)(36756003)(26005)(66476007)(6512007)(41300700001)(6506007)(478600001)(53546011)(6916009)(4326008)(54906003)(66946007)(66556008)(83380400001)(2906002)(86362001)(38100700002)(2616005)(5660300002)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am85ZkdqWEJWZ0I2WjFWWFV5T2p5T3lrdHBNbUZNMDlLa2FqcDZHVWtQTXBZ?=
 =?utf-8?B?UWY4YUQ4YzJuNzNyV3JmSENKbVhYaVhrOVU3QkozRXVJMzdJOUJrRFVTb3h6?=
 =?utf-8?B?eEluUllaZmVvOGlsMkFJVnV3MlZ5VjUrblIxU290MytmcVlOTHB0YSswS2Zx?=
 =?utf-8?B?QnpJcms2Z0NySjFKalI1OFhPbE5NVDlPdmdIZHhNNGt4U1NVU1AyVXU0ckNp?=
 =?utf-8?B?YTl1RmYyS2p0YnY1WndUZEVURHlWaDZlcnVicHVtTm9DdGN6M1RKZUJnWUxE?=
 =?utf-8?B?R3ErWEhQVWJBWHFlVFdJU3E0UURpWERLK3g4Rmh1eDlKczBNRmQ1d3ZmaU5J?=
 =?utf-8?B?UU9hL09VM1FodG94U3N6QnZ6SEhvYndxRmVGOE5rbTM2NE1RV0dOSjNZeEd1?=
 =?utf-8?B?K2FYWGNEN2NFVW9WRVhKVUVWRjg3Z2pYS3luZVMvTWVZZnpPUnIvREIxVFJW?=
 =?utf-8?B?ZXc3NzJJTE02SGFrWXR4aWlXdjdKWEtXWmZPUlF1Z1BWNEtucVR0NW91d0x5?=
 =?utf-8?B?Zkd0K20wQzBENE93b0EyYTNHbmlaTGZHSGhIdEE0QTF1SGo2T3RRVWc2S1RS?=
 =?utf-8?B?YVYvNGYrTTRWTGErRWNINGluZ0JNSHZiZGRYL0N2K0pGYjlLUFVTc2Z1M0c3?=
 =?utf-8?B?RVhCcVRLUE5ZWDRnZDNIQmYwUE9LZzFQM1gxZ2RiMS9KcVIxWCtMN1R3ZGlE?=
 =?utf-8?B?Nk9PVm9oQ3E5aVZaa0s1dFIyOGhqNTMxY0xzcEpHNjN6M1lNV0Y0TUFLN09I?=
 =?utf-8?B?ZkRUSkhlUGZqcGk3SnFHbDdEbmk0dmdGU3gyL3JpNWZaUTVVcFcrdjZjdTVN?=
 =?utf-8?B?WllOODlLTWE3a2tkN09RMmlRWmJOcG1FZFdCSjUrRnl5SEZEUWs3QVFGSEd3?=
 =?utf-8?B?MlAzRTFabjF6YnJYUWVQYUFpNVh0dElIbTlya2ZNSjVSVnpDTDJMbkVGcEFo?=
 =?utf-8?B?bnB6YmU1VGk5eTRXRC9QZG9TOTQrZ3VYTFNLcjBmNitnRi9pVzRRQXlSc2dE?=
 =?utf-8?B?anh3TzZBYmJ0L2dRcUpzWUt6U3ArWkZFdGZ2WmZBMUVpOE1aNm1Sd0o3UlFE?=
 =?utf-8?B?b1ZDYnVlYVhrMEFjRUl3ZW9tdGJyS24zZnIyVXZ5c09mbnIzc0NGQXR1VGhm?=
 =?utf-8?B?eHB1YkgyaFA0cVNKYnhWTkpwaTd1aENUTTdlNWo5YXI2Rnl0U0R5TjNmRnVo?=
 =?utf-8?B?NnJvaVFzaW5wSlJSUHRRQ1l1WVBORzdIL3BqV2MzMFgzbS9rSTJxUEdpQzA1?=
 =?utf-8?B?czFIY05FRFRFczRYNE5BaGVyb29YM215b1VMUVIzOFFIZnRLMUZYb1dsTldE?=
 =?utf-8?B?QmMveWtxRmFIY1VTNk5jeUlkY2dEODBWc0trRXNONGhpOGI1Y3Y2bnI4azZN?=
 =?utf-8?B?SWZGVjdsa3hhenFWVUx0c2I4MytpSXJaMlBncURrR1B5ekZoV3ZkRk1YSkhO?=
 =?utf-8?B?bjdJVGlFbzJ3MlJ4ZmQzWkxjWGhrbTBrM1Q4Q3FkTTZRM1dDZ3BVdEpYMXpr?=
 =?utf-8?B?VkhxbUtTWTlBMGx2QkxYQTRERS93aDlDaEdVVllacTFGUUI2dmpydFVBdXM1?=
 =?utf-8?B?SFBoWDJnUjBFc0hDbzBHcFpDdmRUcjE0ck5EdTJOVjBMOGUvYlBHWXptU1B3?=
 =?utf-8?B?WkR5bzc3WG43bk4rODliRkQ4eTBweUxLTStjK1lhZkU2RHF4Vy9qZVM3OWlD?=
 =?utf-8?B?eEM2citJN1ZObzV6K0pGdG1IRHplWXlZMklCWm91eVVLTzI4WTZqd3g3YmtS?=
 =?utf-8?B?K3p5YVJzVlN0TmNoTTVENnFsc2dMM0xuNTcyOXB3MlJtek1CK1l0QWplenk0?=
 =?utf-8?B?SUNxNDMvMkZ5WDlYcWtBbHR6VkJUdGd3N29GWWQrZWF5WVdFNG1mWnFuU2d0?=
 =?utf-8?B?SnZnT3oydkJIdldMWXdMVktrTFF6U0FPeU9QU3c4dlNsTW1vNHlSV1g0eU8v?=
 =?utf-8?B?aGtQRzlMbGNESjdSdWpoL29kMlJJdUI2bEpINzc1RlJzczVIZTVJeFM0dFFT?=
 =?utf-8?B?cld0TkFxTHorcTR6Tkc0VjZLcW05K3NCNk04eFBpNG5RaDBUMW5LRHk1S0pV?=
 =?utf-8?B?USs3U3E5MU1WemQwUFd2a0sxYlpYMUJvdURRZVFpSnI4WVM4ejdXS3RjYk1R?=
 =?utf-8?Q?RX39skPii26haodB3Ta3e+nPH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a44281-c0ae-4c8d-074d-08db732a0e93
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:07:47.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sinFZKRWLn2A6CH8mu0axFzNJHFW4TBwuhrYf6+8mQN8iUUyz4eHAXV/VCyr30Eadyi0Sw2RYHWeRTpuGhlrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815

On 22.06.2023 15:55, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases.
> 
> Add --escape argument to console tool for this purpose.
> 
> Create parse_escape_character static function to convert a character
> string (which may include a '^' modifier) into an ANSI integer.
> 
> Add argument to getopt options, parse escape character and pass value
> to console_loop.
> 
> If --escape is not specified, it falls back to the existing behavior
> using DEFAULT_ESCAPE_SEQUENCE.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
>  tools/console/client/main.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Short of a cover letter, replying here: What has changed from v1? This
then may or may not explain why Luca's R-b aren't here and in patch 2
(anymore).

Jan

