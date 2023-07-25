Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827B761C5A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569758.890817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJTN-0003cl-Rm; Tue, 25 Jul 2023 14:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569758.890817; Tue, 25 Jul 2023 14:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJTN-0003b9-Oz; Tue, 25 Jul 2023 14:57:13 +0000
Received: by outflank-mailman (input) for mailman id 569758;
 Tue, 25 Jul 2023 14:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJTM-0003ay-HZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:57:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e5f582-2afb-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:57:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:57:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:57:08 +0000
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
X-Inumbo-ID: 87e5f582-2afb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLznSAZrvHlyjQF+/gBkHeShGCWooCVd0yu3iaKsdxOiqJo+GCy19QpNrwnOmcdhcoyv5WiqM7M1jS69858nnwjWHGGhqtR6z/kItVYYgVG2psAX+6CHp5f9d1YpmYtUDKNxxSe/xxrUtUWqFrotO/CltaTN2xHHBBIWD3llaxEZjHdfAyCqvseI8nnf6LCn5uaCWNf4t+qY+4moQ5U6rmMFR35lz8sA9J1zJbg7aZn9gDBdEWykZDIE7De/wYLvRmMxl7gM+1M0vm85PPTeiFUx0BXT0F0bC+IH9UcynPfhjK1RHYiE+CIq3SSW9aLBNu6MI7rPQi6VITzwnQ0JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK042ciPaAd5w7KBVNFwKwZ1hnRCXfY7pEh28nuY2Y0=;
 b=RDgXKr9HFsGsstXwX3FJ15lRkLGs/5kHaDKFgZr2wpqS6arfdMP2QM+FeIUWyPDUzB8pG2yFV/fWJz6B3gXnemRgYpuq82fncw7ZyWvNnbt2EC4PqeLOH/p1eHofmeI9YdPT1Mb6SyZcDeiPcJAAtV/FAGVwxJZ6KT2wNlCHL3UCCfXRV0fW+l4ks7CXnIWgUCysmOwCaDwe0pKB24zlUza0wvv7HzDXvo79980EPIbFFYESL394SZW+Rj/2j8ji86TFG1N9PayrqxsytR0OIvFmG+/puLKF8lGcziC1xc5okjRxrFIVAUZBk+H6QM5IGP/TnTc4wbGU1DFua7PQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK042ciPaAd5w7KBVNFwKwZ1hnRCXfY7pEh28nuY2Y0=;
 b=vXHzzEShaac/vx1kt71r/89hORJVCxWVLya487lWn/Liukd8GEET+ezVjA7BzRGVb+NLtER3dLRXaign5A3wjjDvoNFKzuLCahtyr5T52CN1Pf8/3PZJULiiAZ6Tl3LW/iexK5LJ//TaoPBxeyYrg48hGPHL9gcJJD/imPeol/ryBCPt4kuwdOmIRQNQiYOe5Op/N5wYiqITbqle3ABwbRtZ58cFj+DpOePEsAl/j/prPoVuTp+/WEIZGwMtAJ6KQ+gtgSMY3SLEYsxAPG5xw8KeyArC6S2JVsmYO0NuYG1slKNCvGkp0MMjRC8G1UwGcImCKxvkupxvHpvsDsw+3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <948fa9bb-1995-1586-98d5-adc2bb36ae83@suse.com>
Date: Tue, 25 Jul 2023 16:57:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/cpu: change parameter name in __cpu_up()
 declaration
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <5fdc284b6451dd19f2e84db97d12ab45efaf3bfd.1690295729.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5fdc284b6451dd19f2e84db97d12ab45efaf3bfd.1690295729.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc1c17d-3690-4a24-2502-08db8d1f6b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SxaYVYFeEXcRJyMZo9N6BlWwqo6uHFdoZkV6NWUrC8cjMoc9GRdbr3RsIfSyvbnPmTtlH2TD8g8dfsEUc0ZVx+kXlMZh1NK+6B3NL7nEHovTWlCBQbV2crAvhxlCD6NbNz3iBlMYtJCW58aWgpBH6wJq18E+e6OQcHK9r9qr8LAUkclP/cDVgOwyJKAMgeOr398UWwjyJXdyDTVIEm85F0dGJnHQpGor4bIJHBk4qbtDzSAhYS/FYHsR8YRydwwD5I2wf1kDimK2lyHyyWELFHK1IQ2AiopI2sCUySgp3kx4ydGPpi/97JT5DqEjs5/uqh5VrMk0q20B8/25yiBgodSqNPlmCgTA23KAehI55SxCNcur2gaVpFSJKRld+VoErLy84m/aqysISs01ogsVorU+8dbKzE7B28mIwSFfOkkuwFfMQ+wNQD44MnOUezgGxO3rGYib3sh80WDJX4iokXkeTAgamFuUlH6aJh60aN2RG1bymRjvT4kjSj7ic1ysqkCYxwF0AfPDNDlOXdfzTKhE1K70vpRRyYjjN+YSjGON332uI1v6mfdBezQAzbNFVBwMWxIrHJ9+Kb5c2DuYyhLt13ehh6WvDiyfuFOW4DW1fVkjiYlNu63cso9Ido0zvicEhf6AR3ettm2Obi2gVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(54906003)(66946007)(66476007)(66556008)(6486002)(2616005)(36756003)(31696002)(86362001)(38100700002)(478600001)(6512007)(53546011)(26005)(186003)(4744005)(6506007)(31686004)(41300700001)(316002)(5660300002)(2906002)(6916009)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjRPcVFDR3NmNG1xNVJCcHdrb0lIbk0yaGpZeENOZW9iWVVtUG52ZHcwUUp4?=
 =?utf-8?B?cWtxY25JS3E4SVNOOVhTNFJLODhGVytDMi9QbzVUVko4S3VHYjg0N3NqdnNn?=
 =?utf-8?B?VEhSTFQwYXlkRUFsQjlNTm5rTVpPQVMzaHg5a2RlcXlodUo0ajlENHlyOVBi?=
 =?utf-8?B?T1YzUjdiMmFTRWg3c3JiQUJ0RXRTQ3FkOHR6b0ZpNUcxT2VlRit6Zk5XcTRJ?=
 =?utf-8?B?WWhHeWJDRzV4RitjOUhYaWYreWlQMWd3VlF2RERLY3dqQlRFOHA4NithdHFZ?=
 =?utf-8?B?WTZxWTBvdUU5c29NeGFYaERQc1Q0UmFMM0JhSXM1dGRSTHc3TWxIOUl3aDJP?=
 =?utf-8?B?K2xmeFViMjl2NjEvNHF3RzdsVXp0ZlRsTHRzVjlVMFhaTG10TWE4MWtOcFZD?=
 =?utf-8?B?aWtNRjc4aWlueWdidDlDNUQ3S01lVnc3TXBianRNWUVIRGo3V05IVWQ0YURY?=
 =?utf-8?B?YkVxekxqQTc2S0V0d3pxblZlZGJsOXBUeU9TcE85eDVlU1ZHUUpiVG1Rc2Vk?=
 =?utf-8?B?K05hWEg5MWZxTFI0cnd3SlZmRzV0UStnVWlON0NRbTIydlNBTXBVMy9YWStP?=
 =?utf-8?B?bWxQVFpYR0UwcHkvYzBCa2JIU2tFMTU4V2lTRy9DbjR2L3JOZ1QybkRwc3BV?=
 =?utf-8?B?TERvVWZNR043OGNxVkdDWFRmL01CMUpLbHUwRUljNjZoc3BoK3V2L2kwVlE4?=
 =?utf-8?B?bVdqVFFWWG5OdG9WZTUxOWdIU2pnVFB6SnRXNDBlYVRUVy96VWFGbi95Z1pH?=
 =?utf-8?B?bm1XaW1MY3JobENoZFRGTVhrMEYyY0VubjExbW9vVVQxSTFORDZOeEdId1I5?=
 =?utf-8?B?b1o4c1d4b2VkcExwSnEwSEpaZ2ZRb2QybE1nSWQwYlc3TzBzcjNaeFg0NTF4?=
 =?utf-8?B?bHhmMndTWFZSMFBYS2t5NnhBVVg0UUZodVZBSEF0dmxHa3dPL1NTQlBPM21x?=
 =?utf-8?B?dkNwUnpBY09VRUx1YTV0aFE5VE5yaU1CVXZDOXoyRWswZ1luRFNBQTQ5RDAr?=
 =?utf-8?B?cWRYYUp4blhrV2QvTjcwVjRaUUE1LytNU2swdlVYVzRSWkJ3ankzV2luQnVN?=
 =?utf-8?B?SUtFOUFxVzFIOGVUUnNkU3FBL3M5aG50YkN0Qmx2VjQ4ODJnU2R1R3pqV2Fv?=
 =?utf-8?B?SHI2WjczWXhMc2x4bnE5U2lNcFZvdHZVUzBLRUw1VFhBUnFhRHlpK1cvOUg2?=
 =?utf-8?B?ZVdoM3lQZUZqNitwTGNEK0QrQkZUNDJYRGE1WHNEZFBPYjdhcTNzQWg1c1NM?=
 =?utf-8?B?RnVLQncxNGRLTGVkd1J2aFV6OWhCRk5RTkFUUlFaMUpiTGRld0JvUko3V0NR?=
 =?utf-8?B?NTcrZkVuT29uVC8veHVTTEpiQmZSbGZONGM4Z0RvZGtwVC9sM1ZVajU2Vzhm?=
 =?utf-8?B?cnhONXFhOWUrWmRtVDJhU20zRVhHQjFVdjJkWExjMzNmVjJxbyttTnFWb1Ft?=
 =?utf-8?B?OUdxcTlwdFJHRnZWdnJpeXN4L2JsK3BBNERPTUZvOTFJVVBPZzNZUUJGZ2Js?=
 =?utf-8?B?RVpNVVV6OUQvUlhkUFdPS2ROOWwwbTRVeDMxcUZ2U2tXVHMwOWpaa2pJZlNu?=
 =?utf-8?B?Rjl3WWR5NGxOWkY0ai9VMTVoamgwdnVVS09ESXYwSHBEZmx6SlVFOEJZMnht?=
 =?utf-8?B?ODdWMkc1MGUvNFkrd21lMUNTb0RVWkpVK24zQy8zQmd5S0xUc01BY2I1QWpU?=
 =?utf-8?B?Tkg1REoweEhFWGtiNE5lTGEyRlBCR2crcVBCNllza0RMN3FYU3ZjVGxlVXRE?=
 =?utf-8?B?Ukk2U1lwVDhkMDJEUHNkUlRZUVVPcEgvc3I3Rk1ZL0xPUkNxNXpaaXFwL2VH?=
 =?utf-8?B?VUlyTnd2K3ZVanpTSGlYZW4rUlM2b2lqYUh3ckhITGZwajY3VjJBanRJOCtJ?=
 =?utf-8?B?T1RwblllTHpLUkYxNEFjZlVTYjQzTFhYUExHWVZLSUVPcmYwbm9hdGNoU28v?=
 =?utf-8?B?OUFxZFdRMjQ1c3U2Ym5Bd29WWUtvUVNCWG1SeW9HNEJhblZ3SUhCSlIvVHlR?=
 =?utf-8?B?aHUzMnR4Z2ZMdmpQVmlvMjFxM05HRVMxSGsvbkNpZkpkY1lkUGlzSGE1OE1h?=
 =?utf-8?B?REFjbkZSM0dPKzB5bXYvTnQ1eDdNb2hrVEZXM09MRXdPZkQ1U2xCc2M1a3hI?=
 =?utf-8?Q?WWA4ve2RoOjSTBZwUS7nufO6E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc1c17d-3690-4a24-2502-08db8d1f6b0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:57:08.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tS4C+b68iAHyKXuU6rWMPp0Lzik/KSwRgndQ1jQU6Mp//LaBRuTpkfbyJn/ozz0nnrCxklmGJWQO2vrW317ePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

On 25.07.2023 16:43, Federico Serafini wrote:
> Change parameter name from 'cpunum' to 'cpu' to keep consistency with
> the name used in the corresponding definitions thus addressing a
> violation of MISRA C:2012 Rule 8.3: "All declarations of an object or
> function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



