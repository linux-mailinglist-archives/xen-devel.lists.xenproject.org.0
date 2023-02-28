Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B96A5D6B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503567.775861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX38M-0003vf-Le; Tue, 28 Feb 2023 16:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503567.775861; Tue, 28 Feb 2023 16:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX38M-0003to-Ig; Tue, 28 Feb 2023 16:47:22 +0000
Received: by outflank-mailman (input) for mailman id 503567;
 Tue, 28 Feb 2023 16:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX38L-0003th-Kp
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:47:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9056640f-b787-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:47:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 16:46:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:46:50 +0000
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
X-Inumbo-ID: 9056640f-b787-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+z4NgV4rEY2ElrhhvtyQfajKANFOkYQ3/QQ1pU7+zsMEdVXk/oc8VkO1C79/uP8ps43/EHh8kxehb8Zzbd2DLU//7ELwH6gx8wSf2Pq0Yqc/2ZIQtO6+zZ4oikACFdpyQmFgDV0r5R+4b5aK0ONJbdWuNf0N6Zj5054aw7w5FeW3QnJg4WCjzilUOXrYw5U4xPFNnQigoPE+hrUHGVSu7bT73rwhaIy7v0ThJc3Mctlwzk3R0rkQDm+CjnAurJvnVfbOHFQfj+dGpmi0BzhYhbqjQtvfPrbBb+Y2Mjr3w9m0tD2rFvRHEo4jbzxjcKEtVIZ5manYn+AeOLipXpU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzpvViBomllkuPX4Trt/Kd+pJisKBei7ccIpP0lPBsk=;
 b=AafQX8F6iJS25X9BENA2DAath+00PfG2rUcqtHyIRtwyYeGAIGo82SCdUNaMSHqFu1z2LLG4IZmGesk2i6P2QiEaHWpe+1/PdSlM8sCm7KdMl6OejhR3dJFF0Icsp2QgWNVI8cIiiaUMq1VtgzBIShXh7F1/xwVXPNtbqIjl9OjVllFtEhp2Gb0wRybMrsaPBzduVaNxaUeVH0Z2p5FvbOVumK/aeQL68isvoACArmeLlHL3ChgkjQbHRiEdXVVMJOsAmuG5g21xtk35m3f6JClQjQF3GKAokgD5YnGj3R0qMegmuI6cxVsNMb3RaFyhbxBCKBEjSpFCsw3MprvT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzpvViBomllkuPX4Trt/Kd+pJisKBei7ccIpP0lPBsk=;
 b=pW/jEDljMaPPZzz4limLOTsr0y8nnx32vCQox99PT7ZFLJMDXmh4Tfclj2FFvF7P1kkAnfRcChDMfzEtZKihtF7JiKbGheAkWa5RVI8l+crqxVTtjF090VkCKVKHkW8IcjwYdu3cZjMo86XyA9doVCsuWDYwsYE8lMXFY+piyPkLkR6zJNtVFjmreUv2bOHzFs4wK+bvyx5Yt1TOtCSqUCSL7W6vd91iYZbj2hvfE0WWEPhWb3TOXJAHrvLofQLiH7z3KvkBwxVOZoZ21pzv5uXPfI0zADlQcqWuCfcGNeRtjHuhUWIEw5ETOMfaZyhzhIUOXatSiUIMEJ1RkDEUfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c143af4c-85b8-b379-a8c5-3c4d6703887d@suse.com>
Date: Tue, 28 Feb 2023 17:46:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/10] xen: pci: add per-device locking
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-8-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-8-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c66ba-440d-411e-46b4-08db19ab636b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GGEfTgg45Zu1VADv5FFN4NQd/SG5bopaUqE5Pksfa1uLb1O1dZtMMHtPER4yzkxWrD4W1aJAGE2yPFe8OpumKpcp7D+Pt1xyNHWF4toIl5/6zhGY8/Qt4iT132Gyir2YUP7pLzhDTesGkKClFtVoswzDByZH/TwvPL694lTD5CU/61u7KDZPGw4txXwYauU863RG5G6FZQRxs4iK+WAnjIHltzV2fpN1ZpM6aDT98VPnH/oO8aQbqAbl8ue2C6wonH2jJpOS5SSmEHhw8J1Kz1ADqAZkmqh55tpPMoggLyuoI+7cM+iZh36XMRE/iHKqqZEALcxH+X00xNOxNOJKjiyu+vIkyOu2j6t6RU3wx8APDEr+T2i//2y+muUVBlsRBAAoPVCKUpeAOz/REksG1ePf4y7CvC+QTjeKvGqiErFR5XRAC1Ta9J83kqPMTFvfqrfl5wq7bYlSMo9RMvI1kNpozUt4bfOafcuaMAWJpE4qAYN4cbn/NM2OhOUpfS2IrmFDRPlbVIe0YnxStSkCP+aJBH5tFXUQRlwo+1+RcV5dHR7/c3YnEmROaIuoYEceiJsRqHP/8pGCImCg2juJw/TjEonbAIWJriuo7v5hAJaBaIUXNh9LsCkMZ3pHCAUDv6Xv9vQkzY/G9mbDI+hiN8GTfN2m5r8V2oHjKWAwqHfNlMB0I0gPHqdWNgjtv+TrwkWFwag91lzyWRPQORKq7abZOpEJnYT4jpdZVxrRUJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199018)(8936002)(7416002)(5660300002)(31686004)(2906002)(41300700001)(6916009)(4326008)(2616005)(66476007)(66556008)(66946007)(8676002)(36756003)(31696002)(316002)(86362001)(54906003)(6486002)(26005)(186003)(478600001)(6512007)(6506007)(53546011)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmJSS3liTTUxaG5GZTVLWlNrQzZFQ0Jsc1N6YVg1VGY2QXVhUXpxN3VaZzA3?=
 =?utf-8?B?UmpMeDJkNkVKczBXVlZaa0J0M0ttUmtQUy9mdmhoNkkzVGRzWVJkQUJJc1Jz?=
 =?utf-8?B?UHg4ZXhOamgvWElyZTg2NzFOSWxJNURlemEvS1BKanYwVFRNK3pGZnhYN3lG?=
 =?utf-8?B?YnFhUFRHRHZGY05KRUp4VGRwQ2NlQWY1MWdPZUpCTCtUdExDcHJXbW8wWmV4?=
 =?utf-8?B?OVVzVUhLeHhBVTkzY2pac01NUWQ0RzdzUGxINDlNVmZsOE1jRnN5VE1ZdXE4?=
 =?utf-8?B?bFVLOVp1VzM5ZDFMb0g0RDVJSkl1VHRYMlFxa1JBOTB0Njhjcmlqbk93YTl6?=
 =?utf-8?B?Y2ZVRHRpQ1V2YWJyQVMxa2hlTXp4NE5BQ1NSR09STitOZGxXenROVmJCWFVV?=
 =?utf-8?B?cVZ2QUs5VE5RTDArUWUwU3l6NXc4OUxuc2Nxc2tPdWJTQTMvVm9KSklYaDFu?=
 =?utf-8?B?bzNyMGRaZ05pNTNIOEg4VG5iTFk1ZzE2R0N1VTFRL0xLeHR2K3U5NElZTWVw?=
 =?utf-8?B?YzhiRC9UZnV2OEJqYU0xRGhzcHhDSjBqV01uTjVjTW1vWHhXd2hLY3FpYjhv?=
 =?utf-8?B?QUs2MXJmNjMvdC9Ob2x1ZEhhZ2t5bTcxYnFMWUplMjJiek1vL3ptNkt3d3JH?=
 =?utf-8?B?SHBQSHlENExocUZqMGlLS1ZKaHBTVUx0UkxFdnhjdjJWWGE2cHdxckRtRGp2?=
 =?utf-8?B?U2dBTkplM1pwRTdralhLOU9tSVlpTXVFd0VyeEUyTW9pUU9FM1hGUzJ5L1kx?=
 =?utf-8?B?KzJtZURvaURtZ3lKVS9RRU9LOWc4VXFKYnJNbFQ1ZkZubmRZSTJjSmNIcVJa?=
 =?utf-8?B?em0wZHBtdXQ3SlUzSG5DamNKaDF2eTVKQngrS0I5bWU5T2FYMkNpTDg4ZlpD?=
 =?utf-8?B?a1R4OGdNVFA0NHBnanJWd0NWbkhidjVNMCtmWllEUm9GWTc5S0ErSHlYR3J0?=
 =?utf-8?B?dTFFcUNwa0ZGRVh1dzlJZ3pDaFZValh2YmdYY3FURXhrajBQTlZKZFcvSXdt?=
 =?utf-8?B?TVBid1A4dzVMejBFQ2s0T29yS2pYSktJd2I0b3h6ZkJqalRyLzZFN25jUGE0?=
 =?utf-8?B?cXFYVXBOWWJTb1Z3WVdjM0pRY1BLZmpHTXg0TnJpUVNWbUloZkJsZzNGZWZD?=
 =?utf-8?B?MFVKNDltRWViQmw2QVR5ZWFST0FJQUNTZStGeFZqR0NRV0xCb1BycklpSjRN?=
 =?utf-8?B?VW5DcS8rMzJIWlVCY09UN1FKMjh6enhUVTk0VEplTk9JUHQ4YmliRWM2VGdR?=
 =?utf-8?B?YTRpWlFka0VZL3pwZm16WjNHeFhDYXRqR3RncGx6SStoQ25zZnRVQ3RPcE92?=
 =?utf-8?B?a1pSaVFFM1hFZ2d2R2NteWtoSGxRQWprVkhBTXI2cmtlYVJodE0vMTlXTFB5?=
 =?utf-8?B?N2gybnZsK2x2TzRPZGwyODczdDRKZWlTTGhYUlB0blhwQWw3czRsOFl1NlBK?=
 =?utf-8?B?NG1XdEl6c0VxbGRvN1lxL3hYTks5blZqRmFZU2psYURVSWdBOG9SRjE0bDNO?=
 =?utf-8?B?RU1NbFJkRENqN1VEWGxMMzljWDUxd3BDK2lBU1hqdys3T2xMb3BWczFhOHNs?=
 =?utf-8?B?QmhzcmltMXIwSkhLbVZmYStHL2VNWWd4djBIcUlBYnVYcFBUQ2o4azVob1dQ?=
 =?utf-8?B?YkMvakNORjdzbEhaeStmRE1jWHk4ZzFnSFU0ZExieDZPUTh5Uk9xZS9RV3cw?=
 =?utf-8?B?YUdmcDBmSlFLNDMzdE1zMHFiNlgwNnpaSmpjMWhQT3NkMmVjemU3NDRiWmxr?=
 =?utf-8?B?YmFXM0trWXVaYS84bXl6NGI1cVBqVjJYK1V1eVR4bi9XamY5ZnJrUnZwVGky?=
 =?utf-8?B?Z2w4eVdmU2cvK3BVU0V5d2x3ZEVsQnJYK04rSzlab2ppQlN2V2orYTRnV2lF?=
 =?utf-8?B?SG9ZdEd4QXJqaGZwdjZMOVhHY2pvTHM1bnJQbXl5b1JuUXY2OVcvWEVBcFpu?=
 =?utf-8?B?VHVNWS9DWWNlTkl0ZEd5OEJmTk5lUFVmTFBqYW9PaWFZaVA3a2R6NkRNUmpJ?=
 =?utf-8?B?dmR3VG53UXkvTllsVkZkSjlRdUpUNksxZUJYbytuVUhCWVBPcVNBd2I4L2h3?=
 =?utf-8?B?VkJCNlErRGNCNktmR2FDRUtidFQ4MzVIZFZJQi9GRHZBVGJZdmhQYVFtVmI2?=
 =?utf-8?Q?CEnpny+aE9wbUUAECoHLzBlFG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c66ba-440d-411e-46b4-08db19ab636b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:46:50.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hH0Lox+EGHQ+1stUa4qgdlfI98cDs8pLhn7PJ9+VNZe5vftKVhbNwOjYlrxz3BFisoXdMkiUshhgKpqow30cmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

On 31.08.2022 16:11, Volodymyr Babchuk wrote:
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -203,10 +203,14 @@ static struct msi_desc *msixtbl_addr_to_desc(
>  
>      nr_entry = (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
>  
> +    pcidev_lock(entry->pdev);
>      list_for_each_entry( desc, &entry->pdev->msi_list, list )
>          if ( desc->msi_attrib.type == PCI_CAP_ID_MSIX &&
> -             desc->msi_attrib.entry_nr == nr_entry )
> +             desc->msi_attrib.entry_nr == nr_entry ) {
> +	    pcidev_unlock(entry->pdev);
>              return desc;

This is a potentially problematic pattern: desc has a backlink to pdev,
just like "entry" has. _If_ locking is required here (and the
refcounting is insufficient), then it is questionable whether the lock
can actually be dropped before returning. The idea with refcounting was,
though, that entities holding a reference can be sure the pdev won't go
away.

But of course there's also the question what "access to device itself"
(as stated in the description) does (or does not) constitute. I think
it is pretty crucial that for every new lock it is spelled out clearly
what it protects.

Seeing the list iteration pattern here (and at least once below)
another question is whether a lock like the one here may want to be a
read/write one.

Jan

