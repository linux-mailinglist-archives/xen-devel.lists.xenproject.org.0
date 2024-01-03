Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91E82286F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 07:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660905.1030592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuqt-0001lR-AR; Wed, 03 Jan 2024 06:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660905.1030592; Wed, 03 Jan 2024 06:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuqt-0001jK-7j; Wed, 03 Jan 2024 06:35:43 +0000
Received: by outflank-mailman (input) for mailman id 660905;
 Wed, 03 Jan 2024 06:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=08Ob=IN=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rKuqr-0001jE-3E
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 06:35:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe59::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4deef936-aa02-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 07:35:38 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:e5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Wed, 3 Jan 2024 06:35:34 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 06:35:34 +0000
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
X-Inumbo-ID: 4deef936-aa02-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gehibU//sot9iPiOhBO0esNqKm28dDwBr/qnLOs5FXPa2DHNk5kaGzMOjHURKBy31IOL5F54oU3Hcbm8NgycQ6NvGbkOh9bHGJF2Ne6xhAmY5vI5QUCTEdnkRkS7JBnPswRdoDkdPM2aWMGM6FqWNneUWhAqNM/eS4p0PvRv7rIDmRZa+PbvdieF//Cu+TGfCsUZ6H6+Q8Tpv2+Dmd0r0aUpe7hV+WFWHSmMQ73UUidZdwUqdtKoqfVyCGFUtjkQ8acj9O09Y08dKcpPF7+mqq7W+oPUcOvtVRwMt/OF2zzWMhP2454rvAVo9fEKvfC11NxEs90hcoB1VltzjK0UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6qyFn0w4cpNDfCC4nkR+kAI3jEPiLbeAWsOtXh73NQ=;
 b=EMn4SUCl097RguofyHWa4J76Wvz7zPAGtdVJpHESRSTrm4IphE5HzdriOd85ug/uBN9crpZNo5h+6tY6UiOyDWfTBis3r2LIr8Akuz7OiwyTCLRy85t4ILIwF46hCTtmX3bsPFg9cbuYK7IKYCJvUCLMjvWuZ83t4ecopwauWJq8r42q5j521jXRn9YveSXit24HRl2i9mWZPGxBlLQkoQLPgK3mx4jFbgAG/dIhDsMlPcvOSXURga2mbEkbyhsMtiUhyqdBgNbyg3L3DITzzU96NCgNzQdJRlbSFFvrlbxKM+L0qSUO3yrAZRxddRMIvNdKr9AquLZaHdysZa0yGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6qyFn0w4cpNDfCC4nkR+kAI3jEPiLbeAWsOtXh73NQ=;
 b=TqmRbLMiHWGBd6l432FLYU0yV3h0F+aqagWYQcGgmTSCjNK0emLRM5NCE8Ooa9G0iVbYtGR+SreNJdWyJSrXQLcrbgrP7EznQAW2wuBr0c9WVqtfHeOVVATftJWY+MmQrOQAKdAM4Yje24bPw5UTYV1jurmr3Q7oW5iLPo+HJXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 3 Jan 2024 14:35:08 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
Message-ID: <ZZUAHOiP0+nBKS8b@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
 <ZYGe4GcFPt0k5PTM@amd.com>
 <CAFEAcA_=iedJw4BbNHrDALC4mL4g3ZEihsDbLkEzsy-1zAWFWw@mail.gmail.com>
 <af89f683-2b6e-4ca1-aa37-8bedd12a781d@daynix.com>
 <CAJ+F1CJnanuw_VQ0DDwUMfRjwHwQAZ3yif4FANcKVHMZXH3dyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJnanuw_VQ0DDwUMfRjwHwQAZ3yif4FANcKVHMZXH3dyg@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e84e6e-5ba4-46d4-3293-08dc0c263089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJLU2nUP0HIIRLEBeQncv1j2lAAVOdydVm6rDZ18pDyrPZtUEY3TswDhNjYuG5kJno34NMUrfW86iDTyWYUhCRo9jxjZsiFF3ZKqAtKFdqvGZFtNVru4Yfvlz8yrgt77UxQzXqs8HIUmOkTUcMGww2RvL4WZXBw9Ji+9fleJD3oG1MyOTSzXY6pysbI/UpKSjyJP66Bmnkg4fvmHhJHZD0xq+Ws+7H+MPbUaUY5i/wj7AhOEu1Xyob5HBKxix7/qEJvQjSQ42k/b+GJSFdeensoxV1K1pqhL8ppPZfrpha22oF9wC9FM5EsjSzQIwcpxrPX1DZxl9NQjFNJnfmuZjXmh4AZvmklOebdvJQGcgWqNttOEYoaeBKpVtYCFA8uMzDPTrkEe0FxjwskOtGhl+PmUdPzarwFk0pzaz1NshqDCcseB9qy5me0rVH9mdcOouazudZ93iOH/51vXCIQauKu3yjvW3zk+f2G8E4i+nNZM7Mrx3YgvFAdr9NpC3dnF0ww7CQt573wm0xvJFqfCzBXG5wmvRNU79DvKDq9MrD/2+BzOc1g+v7hdVFV5BQ8Yz9mo68V+6WwyBSUOXmwJXRYZ4nCMEMx+008FTCvIOJ7MGOTQ41q4AvFAltOD7hDBoehi+n143vsP9djkIKhHmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(7416002)(5660300002)(2906002)(966005)(15650500001)(41300700001)(38100700002)(316002)(6666004)(478600001)(8936002)(6506007)(6486002)(36756003)(86362001)(53546011)(2616005)(26005)(83380400001)(6512007)(4326008)(8676002)(66476007)(110136005)(54906003)(66946007)(66556008)(66899024)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9qZjRaUVdIZy9SaWhIMlZha2p3NkRmRUYweVdKUC9EdllwSmp2dW80M3dZ?=
 =?utf-8?B?OGNVSU91d01nSUpoRVhETmw1d0pUQXBNbUtEa3ZnUmkrZWpNdGV0UWZvNy9Y?=
 =?utf-8?B?U0FXajJEbVdrcnpZdzlSc2YxTHdxTWg1dXRHOTRHNzFpcDI1clpkVCtzVG8x?=
 =?utf-8?B?WDM3eDhNc3duQWdKSDZreGNCVldaTFZtTnBXVGIzTkt2Z0UvUzlzUUZkaXdV?=
 =?utf-8?B?YUZuektVcVBIVS9HRHJCbzF6UkNyMTRTMFZOWFg5VlJMVlE4UDZCQTI3WExH?=
 =?utf-8?B?N0dNTDI2bVU0Sm1YSkJmWkdKQWNBMXI1YW5kMEpSZE56YmtpSnRMZVNwQTB6?=
 =?utf-8?B?ZUs2cTVYT2czOUdJYXE5Wmt2T1RNdGt3NlRGRXY1a3YreVBNakJWOGNLU1cz?=
 =?utf-8?B?cUNZZi9NY3hGem9XV2JBVDNaQ2xQbXZDbHVpSUlkWkU1NGFGSXVNWjRIcGZ6?=
 =?utf-8?B?b3ZvWVpxNVpVSHVXL0ZoMkhBWFpIZU4xVnRuYlEvUk5jYnJLODNwOXRCaTRj?=
 =?utf-8?B?V0Fyd0Y5MGxDMDM5TlFvakpkb1p0cjM1Z1Z5Q0lpa0E5bTBnelg0ZC9wcVpI?=
 =?utf-8?B?cjdyTG5PeHlheEc2d1hEcXFMM2pPbTFRTXF1U3lMQTJQZ0tPYUxkQ1BQUC8x?=
 =?utf-8?B?aTJ4NXJLZ2h1UlJpb2pkaHVGSVRHV2xNZXJoMU9lbGNBZGg3RGpqalVCcFpN?=
 =?utf-8?B?dTlIb0xKbngzM2tUeWs0ZmVuZ3QrcGM0U094OXE4ajZnMDJLMlJBUTZFYWcw?=
 =?utf-8?B?QUJnM2Q2SnBtUWpJVTZRSlhrZGxxeE9mVVhEMllFc09rMkt1bnBFWWpFaXVO?=
 =?utf-8?B?QmpnRmtMY3JlaGt5SkFDOStkdTRGR2c4UVRTUnNUUENCbzYxSHlzUk9oK3o0?=
 =?utf-8?B?c3B1M08zYXkrcm9yb0VLSEQ0Nk1TdnhWTHZGYlMyenBxdzFHV3dGbmRkUUVG?=
 =?utf-8?B?akFoR0t0SHM5dnR1Z1ZYbkxXZmZ5RXk0bXJnVGlkbWYxbkVxSU5ERUtJMHhR?=
 =?utf-8?B?QU56cWcwUitvRzM0OHJ3ZnVISHRxSlgyRWdRN1NoUDFRZHk1ZDRTOURKTmtr?=
 =?utf-8?B?QnFxbzhRWnduS0hFMHZLdGNEUjNKZkoxK2F0VUEyclk2Qk9xcUlFL0hJTk5p?=
 =?utf-8?B?eXcyd0c2U28zUk5aZ0dkSHRObW9YSWI2QVhEWGg2WmZ6TVJUeWZJRldzTzZl?=
 =?utf-8?B?RGxJY3Q3NXhidVdWQXJiazRERUZZcnlJWlJON2ZkT3ExaWZicUp6b01zSnhQ?=
 =?utf-8?B?RjhXenpuQ2tEQktia1l6cVRNbHJCK3RmTUl4SG1SMS83OVJDU2IxZk9YY3BG?=
 =?utf-8?B?bDkwOUpRMzhnMjF0NEI3ZklKZnZQcGRyUjZWbXRHUmZaT3V4L3RnRU1XYmZx?=
 =?utf-8?B?bHQ4WTV6K09XdFVlaXV5RFo4NURDK2U3Wmw5bUU3ZzlodFFzblZXOXVVSDJi?=
 =?utf-8?B?dUQxWVE5bXVvb3hHbnZUTnVGSzZnQ0JQUmZ0L09Gck9SY3A3RVFjYmZFTkdD?=
 =?utf-8?B?bTJvVFdJajByelVyM1MyWTYvZFBGTk9tVlFBdVBNRnNBTzBSOThmYXJPT0dQ?=
 =?utf-8?B?eFppM1ZiV2VMckxZNU5YWGtoUzFQTUpvbGR2OXRuaHlJdGttRU5VL3NZK3N2?=
 =?utf-8?B?aDVzcG8vbVlPQ1RFeWJSSUwyWkNtTmVxbjZhMDIyVTVnNGozVW9MamJobXhF?=
 =?utf-8?B?WEFhZUI0WmxBbHZKYzBDZjd4MHJqNEoyRWZHMnAya3FQb3B0QmU5MEJNbHps?=
 =?utf-8?B?bXpmTHN3M05XMVZmYno3VGtacWdKVERHTk45Y29aWk9UcVIyeEY1cXV1Z09R?=
 =?utf-8?B?ckFoTExlWHB6UXJIV016UFNIQjJYSGcrREJxRTQwdFBCc0Y3VEVQaUJ5OE1O?=
 =?utf-8?B?MEFDLy9mYnlYMzkwaXFlcjVzRkxzQ1QrbFQ2THhleWNJcFZZTFBScDlDQWNr?=
 =?utf-8?B?bFQxRXJPMTRpVHRUbTU0RjlyYWxtQXc4NXZURnVYVW9BQWdvVUN5blZibG9z?=
 =?utf-8?B?TmQvS3hIT09HVnY4eXoxUzBFSldWVG5GREFHVVh5Ky9ydTlrT3VGeVowYktW?=
 =?utf-8?B?R1JMc1lrUkFLNjA0MlBQSlk5YXkyamRpaXpNUWJldGw2ODNZVmtDSVRxSmkr?=
 =?utf-8?Q?yYfXH/4WYgc5gj7GFolTDHzNY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e84e6e-5ba4-46d4-3293-08dc0c263089
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 06:35:34.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWZbwTjRtOrZFzB9io1ZfDdjLa3SiK/I2HFLFnQB/71qj9gG8zFDuc3+Axf3ueQdE2zlhpvBR4s9g1lREiffGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345

On Tue, Jan 02, 2024 at 06:42:44PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Dec 21, 2023 at 10:55 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >
> > On 2023/12/19 23:14, Peter Maydell wrote:
> > > On Tue, 19 Dec 2023 at 13:49, Huang Rui <ray.huang@amd.com> wrote:
> > >>
> > >> On Tue, Dec 19, 2023 at 08:20:22PM +0800, Akihiko Odaki wrote:
> > >>> On 2023/12/19 16:53, Huang Rui wrote:
> > >>>> Sync up kernel headers to update venus macro till they are merged into
> > >>>> mainline.
> > >>>
> > >>> Thanks for sorting things out with the kernel and spec.
> > >>>
> > >>>>
> > >>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> > >>>> ---
> > >>>>
> > >>>> Changes in v6:
> > >>>> - Venus capset is applied in kernel, so update it in qemu for future use.
> > >>>>
> > >>>> https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
> > >>>> https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0
> > >>> Please include the link to the upstream commit in the commit message.
> > >>
> > >> So far, it's in drm maintainers' branch not in kernel mainline yet. Do I
> > >> need to wait it to be merged into kernel mainline?
> > >
> > > For an RFC patchset, no. For patches to be merged into QEMU
> > > the headers change must be in the kernel mainline, and the
> > > QEMU commit that updates our copy of the headers must be a
> > > full-sync done with scripts/update-linux-headers.sh, not a
> > > manual edit.
> >
> > Apparently the kernel change is unlikely to be merged to mainline before
> > QEMU 9.0 so we need to come up with some idea to deal with this.

May I know when QEMU 9.0 will be released?

> >
> > The release of Linux 6.7 is near and the development of 6.8 will start
> > soon. So it was nice if the change made into 6.8, but unfortunately it
> > missed the *probably last* drm-misc tree pull request for 6.8:
> > https://lore.kernel.org/all/aqpn5miejmkks7pbcfex7b6u63uwsruywxsnr3x5ljs45qatin@nbkkej2elk46/
> >
> > It will still get into linux-next so we may retrieve headers from
> > linux-next. Or we may add the definition to
> > hw/display/virtio-gpu-virgl.c; the duplicate definition warning will
> > tell when the definition becomes no longer necessary. I'm fine with
> > either option.
> 
> The second option seems better to me, as it can avoid pulling unwanted changes.
> 

I will keep an eye on dri-devel mailing list. And ok, I will add the
definition in virtio-gpu-virgl.c and remove it once kernel patch is merged
by mainline.

Thanks,
Ray

