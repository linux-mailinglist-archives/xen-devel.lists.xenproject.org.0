Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC40589D61
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380433.614579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbin-0008Ry-Fr; Thu, 04 Aug 2022 14:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380433.614579; Thu, 04 Aug 2022 14:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbin-0008PJ-Cw; Thu, 04 Aug 2022 14:21:09 +0000
Received: by outflank-mailman (input) for mailman id 380433;
 Thu, 04 Aug 2022 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJbim-0008PD-E8
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:21:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad0f4194-1400-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:21:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5041.eurprd04.prod.outlook.com (2603:10a6:208:bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Thu, 4 Aug
 2022 14:21:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:21:03 +0000
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
X-Inumbo-ID: ad0f4194-1400-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe5H83F3+0+954uRu/32QfXutSd6G2VaGP8mWS7TqbvHUrw/CVidwjNzLofTeO4ZP3b3p4elcffhskjHLLcj+ucybDQXRD9RytDxO6mZf7QndZPJeFiXzonutBc5e+Q9niznX1hSZEdeYEHyyzTMuIOO0h5h3+IinJYJtMwPP6a0Cx25ehefAOFtaTSEAVQU4vKKldt0rssOT1+Z707HlujLk0M7MZIQLUsHJw7BDuxIZX/vUKqihPM++AK5P+0TcW3Caq2fwk2ojItlHM/5OHp6D+/jRRiUhB0K/E9T6yu8OkuW7VP1TbmDcWfAcn1U0g1bxkqqnQmkngUQJdoC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAPnCDegiet3SisbW/WWnse40da9oxOxNKBtFyvEEbY=;
 b=MLVPWSqwr4sd+W9yaQJgN+wof5fLRGNl8yMxHVMo7N2eIaLt1pwvDsGFs3W4MNEDCa3wpQ3hQ8KmO+ilSbCdzH1YP8IJwP6FFUvmJsCcQqirudV64IpIbq42Z0JwImciw0G4rHd/S6v6lGDOJI5XTW2ZQh6X9KBzVuamA2IGQGzRLkCCAAFIXZCSmq5sGTfiKw4ieLozdOuE6X/VcqkBiBsUfBn0s45OM4649UAVn7DMxkXB5IQ6dTxIh2ugdQkZqJnZlv8jIXbDM3kEdwoWKw5wJJel3YZ2bXrFpR5PDxA3SVm2tFBhOuRnOg3lFYh5IyJKb+S7lViNNZFBe4iMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAPnCDegiet3SisbW/WWnse40da9oxOxNKBtFyvEEbY=;
 b=PyVpeyyxseJ4ykSIJoK0NQKUdL8fHKFHFrWXwxOtPi6RyjcGqEnxEoN9BBIqDt1my6kttjpYAkjjv2cL8WAYJ/PK9Ea2TeBLgqbL4MEzET24HdZM3wkUPh7vOdSokYuJpTaEl0oqsiwVYVzpz64sGLsWbFD9rTJDNLvmj6JyyX/tE0e4kDYhHRcbseYBchiX6d8Znwi5rIJLZ0qaaPJEUMxH9BRuszlwauVf4aM8O0ulNR1Dp2yzdgU02T2fkjxJf01XAebdZt3khRtFVsrYAMTPzGE1oREOh5vCfW8vJ1BiRma4/BbM6QW+YJkABXu6Ulyht2eOv1XjX+9XJQGdyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>
Date: Thu, 4 Aug 2022 16:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com> <YuvM7vElH/IdBJjq@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YuvM7vElH/IdBJjq@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e737d88-d0f5-4c92-f89d-08da76248ff9
X-MS-TrafficTypeDiagnostic: AM0PR04MB5041:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sHuh2KF9/ucbhrwSSPvVqUJ+kaoZA7nd5U/qFg1gv5tRvI5obJn9QRlO83hAcxco1jY342ZYqiZu98LpfJPZ4X10KPsqfEEjrprE+4F6LsXKXaJMyCdQ2I3bZaC+jEoWpPXWzdi2eZT7cyCTGnSNPQLdJVhlraQItJZhWwGOMwYFLQT6IjdTj6BAd/sEaIkmAZu+xLVyQYzXVmTMzdFSHRR+9cDeac7qbRWnecnEgZV45VjaYmPfznqIPXryv876IVOXh5oh9U9UBSiOqCoMEBKz/g2/jk48fx1pHGbMOQrIrulc7cDR06a4OEQyXbor3JWnuSRI1CNkHl9R1gSFPNwuTc39vfTeEnNyJRdXcTvRkOXwWuOGz1AsYVpKwbbhCd8NEURa6QTRHovCpZLrKBMZAEXZaPvaF29/SYbcsHa4GVtDDMrwjxzC8ECmPKsvUTEtYCtXt1sYMD2eLL5jpjAGmOu2B5Sf98s9PCHj4FSuVZqit1TbJKYMP/OF+xNnvWYfJcfDabUD0/tf8JbOl/30rJoD/6dZYVin7Km5QrfrclQNJdTwNDA+oHdDTa6CbneuNUBlD7aj4YhnDT4Xahrw4iL1KuVE0QU8bCfOZVUdCYmviub0vX38ek/Gdhk5Mo6FCVf7FsWM2PMvQuWPmrvX0EnWGBdAzp119bdyQTM6utx1TUaVDEYTC7qL7bvR4F41zTspltz+V+T6GS5oCYPPMDButItuUXkztCClV5Q/Xa8gYMSIhNWfRYWRP+TuzN+d3H9+tKPOs8bPT32MCdGseKUrUwSCX0rWEtq4bLV3os/BHKnG2B5W9Zs43QJVB3niZ2OIWuiBnmlzvn7gxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(346002)(39860400002)(5660300002)(6506007)(53546011)(41300700001)(38100700002)(6916009)(316002)(54906003)(8936002)(31696002)(66476007)(66556008)(86362001)(66946007)(83380400001)(6486002)(2616005)(186003)(8676002)(2906002)(66574015)(31686004)(478600001)(4326008)(6512007)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3VMd29qSmg5dHVtRWFqNktCNjZNdHdoN1lNUkU5bnJzc0FwSkxIZ09ndURU?=
 =?utf-8?B?OHJKMmdKK1FKajJ5M2FXdDllcEJMUUVicVVWWGZha2xNZk1obXJiNm5naHhw?=
 =?utf-8?B?ZHZiN1dkMUJPaUR6Njh0QlBPZmpnbVdSbE9IMnkyWUs4eUZvelVUVEtqU1BW?=
 =?utf-8?B?Mk1sNWJPNVRBSFBTbytaNTRpbWErYU1xejFXWWtXSHNVSS9PWkpjS1NxUDV5?=
 =?utf-8?B?VzJrU0Q0YjdMZ2N1UUlXOGs2SjdGOGRMMHV6Q1lhOTJXWGMxVWF0NFVLTGlZ?=
 =?utf-8?B?MklhSDlRdHBXNE5YRFdrdHJWNExDYjNqRDZJTWtJYXM2enlFKzdNT0VHQ2Vh?=
 =?utf-8?B?MkdXZjJGa2dRNG9CUFV3K0hkeGxZejhoMFR4VVNETHI4WHN1MW9VbHN6aXBK?=
 =?utf-8?B?bmo0ZkhSMVV6d0tIS2dNUmdhYjlja3JmcHdwMGVoSkRqTkVLUy9XVWU2SEhx?=
 =?utf-8?B?cWtDOW5JRHN5MjRBYkc2cHhONVdTU1U5eG92ZXlOK2wzRWZrY1NqMWFUb3Z6?=
 =?utf-8?B?aTVERXY0enNxay9Zd2w3dk9wMEp1MU1oc2pOdlhSRmpmQU9pbWVNN2NWVnIv?=
 =?utf-8?B?cDNBbTIwaU1iaU9GRHV4UnNVbG1hY1ZEQkNZeitacVJkbFo2ZVQrbTMrUHJs?=
 =?utf-8?B?bUlQVVE0YW81N253Z3ZRdUFtYnd1M2VobGlObWFpYzdDNjVHOVRXR3JGS3k2?=
 =?utf-8?B?TW1Rakg3Y0FSUi9uNmsvUXFhc0VzTC83QzFnNUpJODJvbEhLRm9DZ3BHY1R6?=
 =?utf-8?B?U3U1SHdaaFdiUlpxZGNpa2p5S1hvSHhabU1wbEQrQXhvZDJXa0UxRzQwa1ZN?=
 =?utf-8?B?eTJQUnZseEVVQ0tKZTZVV0VianlPOGZIUEdHcDdpSkdQQVozdUpwLzNUc3Nv?=
 =?utf-8?B?aXhudlg0RnpiTkpJeDAzdHpwandpNVhmNjBXNi9Cc1czM0ZzajBIS3F6V3VP?=
 =?utf-8?B?MWRwSzlheHE2ekZ4MDhCamJKWDRXQkhpYVIySEh4anlBTGk0ZFNQdVJDSnBC?=
 =?utf-8?B?YzU0R1pXd1NzS0k4dk5XMFYzeXdjRVB5VlJJamhuT2hJN3VXNmhVczJrTUpm?=
 =?utf-8?B?L2Y0LzJYVjNLUk03eXFEMWVEd2FueFRjM202bDZDT2ZmcmdkWEQxVFp2MGwx?=
 =?utf-8?B?dkpOK1pLNDBhSFhhS0dzVG5JODVQYUFSREh4OGk1NmdQeTZqaTh5TmVwRjVt?=
 =?utf-8?B?TVp5ZGN3bGdjOGpFSU81b2k4WndBb0MwZENkZGxFaEJwaVRoZkp6SlpvVWQ2?=
 =?utf-8?B?ZUpGZ1dQUmt2dkRpVVkrWTZjdXk0bElDYlVDZC96dTMybU1jVEFTK2loQUNY?=
 =?utf-8?B?SzZUUXdaWFczU3ErL0lkQkh0VjBESjZsa0g0ZDh1Zi9JYVYxVy9wWGpuVDdQ?=
 =?utf-8?B?YzVPWkpvanhoOXFweHdFb3RwSkdzUlBTMHh2N281eXRoS2d1NTVGaGlsQk52?=
 =?utf-8?B?K2M3TEZMQWlUcXBBSXJ0UmttclNMcEhWR1Irc1N3anRlZDFLeGYxWFZvWGhZ?=
 =?utf-8?B?TjdMRVdVNGlSd0tsWGxsaFI5SlphVVBCZDc3UUc0SGlmeWtFS1pjZXFTZXN4?=
 =?utf-8?B?d3NHdDRHYlFHNmxYTXNvN1c1bnh3YktkYkZZV3NIeEVPZmhPVS9aa053N1NW?=
 =?utf-8?B?QTFiOExKTEJ0SlRHYk5CVzROSHBZS2RERzFnQ0I1a3hUVTBmcEIvVVVGZXhB?=
 =?utf-8?B?OG1FR0tzZHpGNU11Y1FHZndwOXpmTTk2aUJiMklVN1ZTWVYzSnN1MDBuNGFR?=
 =?utf-8?B?a1NCVno0YVpOdDQ1UE0xSTEydmVzbENOUkt6anoyNDlQSld4VUtmYUZMZnBQ?=
 =?utf-8?B?V2NqK0JHdGVyUzNzVS9GM1JNZXZLdjFvUlVZZldhN21ZR3I1bnFBZHRNWTgy?=
 =?utf-8?B?MWpEVVNna1dpMGpXWkpSNlZHeSs4TGw0VGljUVZOSFBINW9mVmdPRnp4UGZZ?=
 =?utf-8?B?L2lpam8rYVF5c0pUUHRLNjZsM0MzZkEwK0ZOYkhHcm1XeCtua2lITlZabWw4?=
 =?utf-8?B?TEJpY1ZVUnhBZUJXRXNSTjNiRzlUU01YRXJpbjYyNVpUc0pUNkVPSThib1pV?=
 =?utf-8?B?N2dTUjlkK0pPaWR5Y3FSUERpOTFQMEJuTnRJM0IvQUJxcHkvNVpXVmRoWFVa?=
 =?utf-8?Q?I44cX7A5PdyDZl6Vw2KPf/9bE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e737d88-d0f5-4c92-f89d-08da76248ff9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:21:03.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FIYQCjnA9cqRcgD7xKMx0HXfaug7qApgXuX4sZCPhk8Q3cTf+ixnkRGkCmqT1qpiXtG+5OdZpy9oRL6IKgsqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5041

On 04.08.2022 15:43, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 04, 2022 at 02:57:49PM +0200, Jan Beulich wrote:
>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>> +struct dbc {
>>> +    struct dbc_reg __iomem *dbc_reg;
>>> +    struct xhci_dbc_ctx *dbc_ctx;
>>> +    struct xhci_erst_segment *dbc_erst;
>>> +    struct xhci_trb_ring dbc_ering;
>>> +    struct xhci_trb_ring dbc_oring;
>>> +    struct xhci_trb_ring dbc_iring;
>>> +    struct dbc_work_ring dbc_owork;
>>> +    struct xhci_string_descriptor *dbc_str;
>>
>> I'm afraid I still don't see why the static page this field is being
>> initialized with is necessary. Can't you have a static variable (of
>> some struct type) all pre-filled at build time, which you then apply
>> virt_to_maddr() to in order to fill the respective dbc_ctx fields?
> 
> I need to keep this structure somewhere DMA-reachable for the device (as
> in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
> also, patch 8/10 is putting it together with other DMA-reachable
> structures (not a separate page on its own). If I'd make it a separate
> static variable (not part of that later struct), I'd need to reserve the
> whole page for it - to guarantee no unrelated data lives on the same
> (DMA-reachable) page.
> 
> As for statically initializing it, if would require the whole
> (multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
> binary (not a huge concern due to compression, but still). But more
> importantly, I don't know how to do it in a readable way, and you have
> complained about readability of initializer of this structure in v2.
> 
>> That struct will be quite a bit less than a page's worth in size.
> 
> See above - it cannot share page with unrelated Xen data.

I have to admit that I'd see no issue if these lived side by side with
e.g. other string literals. The more that the device is supposed to be
exposed to Dom0 only anyway, and hence that'll be the only domain able
to get at that data.

>> If you build the file with -fshort-wchar, you may even be able to
>> use easy to read string literals for the initializer.
> 
> I can try, but I'm not exactly sure how to make readable UTF-16
> literals...

L"Xen" looks sufficiently readable to me. We use this all over the
place in the EFI interfacing code.

Jan

